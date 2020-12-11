package com.chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	static float NORMAL_TEMP_MIN = (float) 18.00;	// 섭씨
	static float NORMAL_TEMP_MAX = (float) 21.00;	// 섭씨
	static float NORMAL_HUM_MIN = (float) 20.00;	// 퍼센트
	static float NORMAL_HUM_MAX = (float) 50.00;	// 퍼센트
	static float NORMAL_DUST_MIN = (float) 15.00;	// 마이크로그램
	static float NORMAL_DUST_MAX = (float) 40.00;	// 마이크로그램 
	
	
	
	public ArrayList<String> getCmdArr(String ssRaw) throws Exception  {
		String deviceType;
		String deviceId;
		String ssRawType;
		float ssRawValue;
		String autoControlCmd;
		ArrayList<String> autoControlCmdArr = new ArrayList<String>();
		
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonObj = null;
		jsonObj = (JSONObject)jsonParser.parse(ssRaw);
		String deviceArea = (String) jsonObj.get("area");
		// json ex) {"area":"1_A","hum":"76.81","msgType":"ssRaw","latteId":"latte_1_A","tmp":"24.69"}
		
		// json key값 찾기
        Set key = jsonObj.keySet();
        Iterator<String> iterator = key.iterator();
        
        // tmp, hum, dst 등 ssRawType별로 제어기기 각각 다름
        // 1. 각 센서에 해당하는 디바이스 정보 등을 whatToDo에 전달
        // 2. 반환받은 제어명령을 ArrayList에 저장
        // 3. Server로 ArrayList 반환하여 제어명령 전
        while(iterator.hasNext()) {
        	String keyName = iterator.next();
        	switch(keyName){
        	case "tmp":
        		// 온도 데이터 >> 냉난방기 제어
        		deviceType = "AIR";
        		deviceId = deviceArea + "_D_" + deviceType;	// 1_A_D_AIR
        		ssRawType = keyName;
        		ssRawValue = Float.parseFloat((String) jsonObj.get(ssRawType));
        		
        		autoControlCmd = whatToDo(deviceId, deviceArea, deviceType, ssRawType, ssRawValue, 
        									NORMAL_TEMP_MIN, NORMAL_TEMP_MAX);
        		if(autoControlCmd != null)
        			autoControlCmdArr.add(autoControlCmd);
    			continue;
        	case "hum":
        		// 습도 데이터 >> 냉난방기 제어
        		deviceType = "HUM";	// 가습기 
        		deviceId = deviceArea + "_D_" + deviceType;	// 1_A_D_HUM
        		ssRawType = keyName;
        		ssRawValue = Float.parseFloat((String) jsonObj.get(ssRawType));
        		
        		autoControlCmd = whatToDo(deviceId, deviceArea, deviceType, ssRawType, ssRawValue, 
        									NORMAL_HUM_MIN, NORMAL_HUM_MAX);
        		if(autoControlCmd != null)
        			autoControlCmdArr.add(autoControlCmd);
    			continue;
        	case "dst":
        		// 미세먼지 데이터 >> 공기청정기 제어
        		deviceType = "AIRCL";	// 공기청정기 
        		deviceId = deviceArea + "_D_" + deviceType;	// 1_A_D_AIRCL
        		ssRawType = keyName;
        		ssRawValue = Float.parseFloat((String) jsonObj.get(ssRawType));
        		
        		autoControlCmd = whatToDo(deviceId, deviceArea, deviceType, ssRawType, ssRawValue, 
        									NORMAL_DUST_MIN, NORMAL_DUST_MAX);
        		if(autoControlCmd != null)
        			autoControlCmdArr.add(autoControlCmd);
    			continue;
        	}
        	
        	
        }
        
        return autoControlCmdArr;
	}
	
	// 1. 전달받은 센서값(ssRawValue)을 queue에 저장
	// 2. queue의 평균값과 쾌적기준 비교하여 ON/OFF 여부 판단
	// 3. 디바이스의 현재상태와 ON/OFF 상태 같은지 판단
	// 4. 같으면 제어할 필요 없으므로 null 반환
	// 5. 다르면 제어명령(1_A_D_AIR_ON) 반환 
	public String whatToDo(String deviceId, String deviceArea, String deviceType, String ssRawType, Float ssRawValue, 
							Float standardMin, Float standardMax) throws SQLException {
		DeviceVO dv = new DeviceVO();
		Queue<Float> rawQueue = new LinkedList<>();
		
		dv = Server.deviceStat.get(deviceId);
		if(dv.getRAW_QUEUE() == null)
			rawQueue.add(ssRawValue);
		else {
			rawQueue = dv.getRAW_QUEUE();
			rawQueue.add(ssRawValue);
		}
		
		// Queue 데이터 5개 초과 시 queue.poll
		if (rawQueue.size() > MAX_QUE_SIZE) {
			rawQueue.poll();
		}
		dv.setRAW_QUEUE(rawQueue);
		float queAvg = getQueAvg(rawQueue);

		System.out.println(dv.getRAW_QUEUE());
		System.out.println(deviceId + "의 현재 평균 값: " + queAvg);
		// 센서 평균값 & 적정 기준치 값 비교
		// return 예) 1_A_D_AIR_ON
		String command = null;
		
		// 기준치에 따른 디바이스 작동상태 판단 
//		if(getQueAvg(rawQueue) > standardMin) {
		if(standardMin < queAvg && queAvg < standardMax) {
			command = "OFF";
		} else {
			command = "ON";
		}
		
		// 현재 디바이스 작동상태와 제어명령 같은지 판단
		// 같으면: 상태 변경할 필요 없음 
		// 다르면: DB 업데이트 & 제어 메시지 전송
		if(isCommandEqualsDeviceStat(command, deviceId)){
			return null;
		} else {
			upDeviceStat(deviceId, command);
			String autoControlCmd = deviceArea + "_D_" + deviceType + "_" + command;	// 1_A_D_AIR_ON
			return autoControlCmd;
		}
	}
	
	public boolean isCommandEqualsDeviceStat(String command, String deviceId) {
//		if(Server.deviceStat.get("1_A_D_AIR").getDEVICE_STAT().equals(command)) {
		if(Server.deviceStat.get(deviceId).getDEVICE_STAT().equals(command)) {
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
