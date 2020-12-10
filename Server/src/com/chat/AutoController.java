package com.chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.msg.DeviceVO;

public class AutoController {
	static int MAX_QUE_SIZE = 5;
	static float NORMAL_TEMP = (float) 22.00;
	
	Queue<Float> q_1_A_TEMP = new LinkedList<>();
	
	
	public String whatToDo(String ssRaw) throws Exception  {
		
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonObj = null;
		jsonObj = (JSONObject)jsonParser.parse(ssRaw);
		// {"area":"1_A","hum":"76.81","msgType":"ssRaw","latteId":"latte_1_A","tmp":"24.69"}
		
		// json key값 찾기
        Set key = jsonObj.keySet();
        Iterator<String> iterator = key.iterator();
        
        while(iterator.hasNext()) {
        	String keyName = iterator.next();
        	switch(keyName){
        	case "tmp":
        		String deviceId = jsonObj.get("area") + "_D_AIR";	// 1_A_D_AIR
        		DeviceVO dv = new DeviceVO();
        		Queue<Float> rawQueue = new LinkedList<>();
        		
        		dv = Server.deviceStat.get(deviceId);
        		if(dv.getRAW_QUEUE() == null)
        			rawQueue.add(Float.parseFloat((String) jsonObj.get(keyName)));
        		else {
        			rawQueue = dv.getRAW_QUEUE();
        			rawQueue.add(Float.parseFloat((String) jsonObj.get(keyName)));
        		}
        		
        		// Queue 데이터 5개 초과 시 queue.poll
        		if (rawQueue.size() > MAX_QUE_SIZE) {
    				rawQueue.poll();
    			}
        		dv.setRAW_QUEUE(rawQueue);

        		
        		System.out.println(jsonObj.get("area") + "의 현재 평균 온도: " +getQueAvg(rawQueue));
    			// 센서 평균값 & 적정 기준치 값 비교
    			// return 예) 1_A_D_AIR_ON
    			String command = null;
    			
    			// 기준치에 따른 디바이스 작동상태 판단 
    			if(getQueAvg(rawQueue) > NORMAL_TEMP) {
    				command = "ON";
    			} else {
    				command = "OFF";
    			}
    			
    			// 현재 디바이스 작동상태와 제어명령 같은지 판단
    			// 같으면: 상태 변경할 필요 없음 
    			// 다르면: DB 업데이트 & 제어 메시지 전송
    			if(isCommandEqualsDeviceStat(command)){
    				continue;
//    				return "nothing";
    			} else {
    				upDeviceStat(deviceId, command);
    				String cmdMsg = jsonObj.get("area") + "_D_AIR_" + command;	// 1_A_D_AIR_ON
    				
    				return jsonObj.get("area") + "_D_AIR_" + command;
    			}
    			        		
        		continue;
        	case "hum":
        		continue;
        	}

        }
		
		switch ((String) jsonObj.get("area")) {
		case "1_A":
			// queue에 add
			if (q_1_A_TEMP.size() >= MAX_QUE_SIZE) {
				q_1_A_TEMP.poll();
			}
			q_1_A_TEMP.add(Float.parseFloat((String) jsonObj.get("tmp")));
			
			System.out.println(jsonObj.get("area") + "의 현재 평균 온도: " +getQueAvg(q_1_A_TEMP));
			// 센서 평균값 & 적정 기준치 값 비교
			// return 예) 1_A_D_AIR_ON
			String command = null;
			
			// 기준치에 따른 디바이스 작동상태 판단 
			if(getQueAvg(q_1_A_TEMP) > NORMAL_TEMP) {
				command = "ON";
			} else {
				command = "OFF";
			}
			
			// 현재 디바이스 작동상태와 제어명령 같은지 판단
			// 같으면: 상태 변경할 필요 없음 
			// 다르면: DB 업데이트 & 제어 메시지 전송
			if(isCommandEqualsDeviceStat(command)){
				return "nothing";
			} else {
				upDeviceStat("1_A_D_AIR", command);
				return jsonObj.get("area") + "_D_AIR_" + command;
			}
			
		case "1_B":
			break;
		}
		
		return null;
	}
	
	public boolean isCommandEqualsDeviceStat(String command) {
		if(Server.deviceStat.get("1_A_D_AIR").getDEVICE_STAT().equals(command)) {
			return true;
		} else {
			return false;
		}
	}
	
	// queue에 저장된 값들의 평균 반환 
	public float getQueAvg(Queue<Float> q) {
		float avg = 0;
		float temporary = 0;
		for(float f : q) {
			temporary += f;
		}
		avg = temporary/q.size();
		return avg;
	}
	
	// ON/OFF 제어 명령 DEVICE_STAT 테이블에 업데이트 
	public void upDeviceStat(String deviceId, String command) throws SQLException {
		String url = "jdbc:oracle:thin:@" + Server.oracleHostname + ":1521:ORCL";
		String dbid = Server.oracleId;
		String dbpwd = Server.oraclePwd;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			pstmt = con.prepareStatement("UPDATE DEVICE SET DEVICE_STAT='" + command + 
										"' WHERE DEVICE_ID='" + deviceId + "'");
			rset = pstmt.executeQuery();
			Server.getDeviceStat();		// DB 조회하여 변경사항 저장 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rset.close();
			pstmt.close();
			con.close();
		}
	}
	
	
	public static void main(String[] args) throws SQLException {
		
		//-------------------- queue test
		AutoController ac = new AutoController();
		HashMap<String, DeviceVO> hashtest = new HashMap<>();
		
		
		Queue<Float> temp = new LinkedList<>();
		temp.add((float) 5.12);
		temp.add((float) 4.43);
		temp.add((float) 15.13);
		temp.add((float) 1.18);
		
		DeviceVO dv = new DeviceVO("1_A_D_AIR", "ON", temp);
		String deviceId = "1_A_D_AIR";
		hashtest.put(deviceId, dv);
		
		Queue<Float> temp2 = new LinkedList<>();
		temp2 = hashtest.get("1_A_D_AIR").getRAW_QUEUE();
		temp.add((float) 3.33333);
		
		System.out.println(hashtest.get("1_A_D_AIR"));
		
//		System.out.println(temp);
		
		float t = 0;
		for(float f : temp) {
			t += f;
		}
		
		
//		System.out.println(t/temp.size());
		
		// ------------- db test
/*		deviceStat = new HashMap<>();
		
		// oracle 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String oracleHostname = "database-1.chookpxses6b.ap-northeast-2.rds.amazonaws.com";
		String oracleId = "admin";
		String oraclePwd = "2020final";

		
		String url = "jdbc:oracle:thin:@" + oracleHostname + ":1521:ORCL";
		String dbid = oracleId;
		String dbpwd = oraclePwd;
				
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DeviceVO> list = new ArrayList<>();
		
		try {
			System.out.println(url + dbid + dbpwd);
			con = DriverManager.getConnection(url, dbid, dbpwd);
			pstmt = con.prepareStatement("SELECT * FROM DEVICE");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				String device_id = rset.getString(1);
				String device_stat = rset.getString(8);
				
				DeviceVO device = new DeviceVO(device_id, device_stat);
				list.add(device);
				deviceStat.put(device_id, device_stat);
			}
			System.out.println(list);
			System.out.println(deviceStat);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rset.close();
			pstmt.close();
			con.close();
		}
		*/
	}
}
