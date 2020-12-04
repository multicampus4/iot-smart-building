package com.chat;

import java.util.LinkedList;
import java.util.Queue;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class AutoController {
	static int MAX_QUE_SIZE = 5;
	static float NORMAL_TEMP = (float) 24.00;
	
	// 여기서 디바이스 상태를 알아야 함
	// 디비 로드하여 저장할 필요잇음
	
	Queue<Float> q_1_A_TEMP = new LinkedList<>();
	
	public void ssQueue(String s) {
		
	}
	
	public String whatToDo(String ssRaw) throws ParseException  {
	    JSONParser jsonParser = new JSONParser();
	    JSONObject jsonObj = null;
		jsonObj = (JSONObject)jsonParser.parse(ssRaw);

		switch ((String) jsonObj.get("area")) {
		case "1_A":
			// queue에 add
			if (q_1_A_TEMP.size() < MAX_QUE_SIZE) {
				q_1_A_TEMP.add(Float.parseFloat((String) jsonObj.get("tmp")));
			} else {
				q_1_A_TEMP.poll();
				q_1_A_TEMP.add(Float.parseFloat((String) jsonObj.get("tmp")));
			}
			System.out.println(getQueAvg(q_1_A_TEMP));
			// 센서 평균값 & 적정 기준치 값 비교
			if(getQueAvg(q_1_A_TEMP) > NORMAL_TEMP) {
				return jsonObj.get("area") + "_D_AIR_ON";
			} else {
				return "Good Status";
			}
		case "1_B":
			break;
		}
		
		return null;
	}
	
	public float getQueAvg(Queue<Float> q) {
		float avg = 0;
		float temporary = 0;
		for(float f : q) {
			temporary += f;
		}
		avg = temporary/q.size();
		return avg;
	}
	
	public static void main(String[] args) {
		AutoController ac = new AutoController();
		ac.ssQueue("SSS");
		
		Queue<Float> temp = new LinkedList<>();
		temp.add((float) 5.12);
		temp.add((float) 4.43);
		temp.add((float) 15.13);
		temp.add((float) 1.18);
		
		System.out.println(temp);
		
		float t = 0;
		for(float f : temp) {
			t += f;
		}
		System.out.println(t/temp.size());
		
	}
}
