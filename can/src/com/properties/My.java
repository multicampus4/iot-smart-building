package com.properties;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class My {
	// git 레포지토리 루트폴더에 있는 my.properties 로드
	
	// 로컬 서버-클라이언트 IP주소 & 포트
	public static String localIp;		// 로컬 ip주소 입력. 예) 192.168.1.1
	private int localPort;		// TCP/IP 서버의 포트번호. 예) 5555
	
	// 웹소켓 IP주소
	// AWS : 3.35.240.16
	private String websocketIp;	// 연결할 웹소켓의 ip주소 입력. 예) 192.168.1.1
	private int websocektPort;	// 웹소켓의 포트 번호. 예) 88
	private String serialPort;	// 아두이노 시리얼 포트. 예) COM5
	
	// ========= Set Setter ========= //
	public String getLocalIp() {
		return localIp;
	}

	public int getLocalPort() {
		return localPort;
	}

	public String getWebsocketIp() {
		return websocketIp;
	}

	public int getWebsocektPort() {
		return websocektPort;
	}

	public String getSerialPort() {
		return serialPort;
	}
	
	public static void main(String[] args) {
		FileReader resources = null;
 
		try {
			resources = new FileReader("../my.properties");
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		Properties properties = new Properties();
		try {
			properties.load(resources);
			localIp = properties.getProperty("localIp");
			System.out.println(properties.getProperty("localPort"));
			System.out.println(properties.getProperty("websocketIp"));
			System.out.println(properties.getProperty("websocektPort"));
			System.out.println(properties.getProperty("serialPort"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
