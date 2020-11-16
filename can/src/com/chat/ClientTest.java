package com.chat;

import java.util.Arrays;

import org.json.simple.JSONObject;

public class ClientTest {

	public static void main(String[] args) {
		String ss = "tmp26;hum80;";
		String[] dataArr = ss.split(";");
		System.out.println(Arrays.toString(dataArr));
		
		JSONObject jsonObj = new JSONObject();
		
		for(int i=0; i<dataArr.length; i++) {
			switch(dataArr[i].substring(0,3)) {
				case "tmp":
					System.out.println("온도"+dataArr[i].substring(3));
					jsonObj.put("tmp", dataArr[i].substring(3));
					continue;
				case "hum":
					System.out.println("습도"+dataArr[i].substring(3));
					jsonObj.put("hum", dataArr[i].substring(3));
					continue;
			}	
		}
		System.out.println(jsonObj);
		
	}

}
