package com.chat;

import java.io.BufferedInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.Socket;
import java.net.URI;
import java.net.URL;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Properties;
import java.util.Queue;
import java.util.Set;

import org.java_websocket.client.WebSocketClient;
import org.json.simple.JSONObject;

import com.msg.Msg;
import com.ws.WsClient;

import gnu.io.CommPort;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;

public class Client implements SerialPortEventListener {
	// LattePanda ID
	// latte_1_A : 1A 구역에서 가동되는 IoT 클라이언트
	static String AREA = "1_A";
	static String LATTE_ID = "latte_" + AREA;	// latte_1_A
	
	// 멤버 변수
	int port;
	String address;
	String id;
	Socket socket;
	Sender sender;
	
	// 루트 로컬의 my.properties 저장할 변수
	static String tcpipIp;
	static String wsIp;
	static String serialComPort;
	static int tcpipPort;
	static int wsPort;

	// Serial 변수
	private BufferedInputStream bin;
	private InputStream in;
	private OutputStream out;
	private SerialPort serialPort;
	private CommPortIdentifier portIdentifier;
	private CommPort commPort;

	// 웹소켓
	static WebSocketClient WsClient;

	String bufferStr = "";

	// 기본생성자
	public Client() throws Exception {
	}
	
	// IP주소, 포트, ID를 담은 클라이언트 생성자
	public Client(String address, int port, String id) throws Exception {
		this.address = address;
		this.port = port;
		this.id = id;

		// WebSocket Client 선언, 최초 연결
		WsClient = new WsClient(new URI("ws://" + wsIp + ":" + wsPort + "/chatting"));
		WsClient.connect();

		// Serial 연결
		portIdentifier = CommPortIdentifier.getPortIdentifier(serialComPort);
		System.out.printf("Port Connect : %s\n", serialComPort);
		connectSerial();

	}

	public void connect() throws IOException {
		try {
			socket = new Socket(address, port);
		} catch (Exception e) {
			while (true) {
				try {
					Thread.sleep(2000);
					socket = new Socket(address, port);
					break;
				} catch (Exception e1) {
					e1.printStackTrace();
					System.out.println("Retry ...");
				}
			}
		}
		System.out.println("Connected Server: " + address);
		sender = new Sender(socket);
		new Receiver(socket).start();
		
		// 최초 연결 시 msg type: "first"
		Msg msg = new Msg(id, "first", "First Connection");
		System.out.println(msg);
		sender.setMsg(msg);
		new Thread(sender).start();
	}

	public void sendTarget(String ip, String cmd) {
		// ArrayList<String> ips = new ArrayList<String>();
		// ips.add(ip);
		Msg msg = new Msg(id, null, cmd);
//		sender.setMsg(msg);
		new Thread(sender).start();
	}

	// Send 센서데이터 to 서버 through TCP/IP소켓통신 
	public void sendTcpip(String ss) {
		Msg msg = new Msg(id, "ssRaw", ss);
		sender.setMsg(msg);
		new Thread(sender).start();
	}
	public void sendTcpip2(String ss) {
		Msg msg = new Msg(id, "RawToLog", ss);
		sender.setMsg(msg);
		new Thread(sender).start();
	}

	// 메세지 전송
	class Sender implements Runnable {
		Socket socket;
		ObjectOutputStream oo;
		Msg msg;

		public Sender(Socket socket) throws IOException {
			this.socket = socket;
			oo = new ObjectOutputStream(socket.getOutputStream());
		}

		public void setMsg(Msg msg) {
			this.msg = msg;
		}

		@Override
		public void run() {
			if (oo != null) {
				try {
					oo.writeObject(msg);
				} catch (IOException e) {
					// 서버가 죽어 있을 때
					// 더 이상의 메세지가 날라가지 않을 때 에러
					// e.printStackTrace();
					try {
						if (socket != null) {
							socket.close();
						}
					} catch (Exception e1) {
						e1.printStackTrace();
					}
					try {
						// 다시 서버와 연결 시도
						System.out.println("Retry ...");
						Thread.sleep(2000);
						connect();
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				} // end try
			}
		}
	}

	class Receiver extends Thread {
		ObjectInputStream oi;

		public Receiver(Socket socket) throws IOException {
			oi = new ObjectInputStream(socket.getInputStream());
		}

		@Override
		public void run() {
			while (oi != null) {
				Msg msg = null;
				try {
					msg = (Msg) oi.readObject();
					if (msg.getMaps() != null) {
						HashMap<String, Msg> hm = msg.getMaps();
						Set<String> keys = hm.keySet();
						for (String k : keys) {
							System.out.println(k);
						}
						continue;
					}
					System.out.println("RECEIVED DATA: " + msg.getId() + "::::" + msg.getMsg());
					if(msg.getType().equals("command")) {
						// mobile client에서 보낸 메세지를 IoT Client로 전송
						sendToArduino(msg.getMsg());
						System.out.println("COMPLETE SEND ARDUINO: " + msg.getMsg());
					}
					
				} catch (Exception e) {
					// e.printStackTrace();
					break;
				}

			} // end while

			try {
				if (oi != null) {
					oi.close();
				}
				if (socket != null) {
					socket.close();
				}
			} catch (Exception e) {

			}
		}

	}

	// *********** Serial 통신 코드 ***********
	public void connectSerial() throws Exception {
		if (portIdentifier.isCurrentlyOwned()) {
			System.out.println("Error: Port is currently in use");
		} else {
			commPort = portIdentifier.open(this.getClass().getName(), 5000);
			if (commPort instanceof SerialPort) {
				serialPort = (SerialPort) commPort;
				serialPort.addEventListener(this);
				serialPort.notifyOnDataAvailable(true);
				serialPort.setSerialPortParams(9600, // 통신속도
						SerialPort.DATABITS_8, // 데이터 비트
						SerialPort.STOPBITS_1, // stop 비트
						SerialPort.PARITY_NONE); // 패리티
				in = serialPort.getInputStream();
				bin = new BufferedInputStream(in);
				out = serialPort.getOutputStream();
			} else {
				System.out.println("Error: Only serial ports are handled by this example.");
			}
		}
	}

	// Asynchronized Receive Data
	// --------------------------------------------------------

	public void serialEvent(SerialPortEvent event) {

		switch (event.getEventType()) {
		case SerialPortEvent.BI:
		case SerialPortEvent.OE:
		case SerialPortEvent.FE:
		case SerialPortEvent.PE:
		case SerialPortEvent.CD:
		case SerialPortEvent.CTS:
		case SerialPortEvent.DSR:
		case SerialPortEvent.RI:
		case SerialPortEvent.OUTPUT_BUFFER_EMPTY:
			break;
		case SerialPortEvent.DATA_AVAILABLE:
			String ss = "";
			String rawToJson = "";
			byte[] readBuffer = new byte[128];
			try {
				while (bin.available() > 0) {
					int numBytes = bin.read(readBuffer);	// ??? 뭐하는 코드?
				}
				String newBufferStr = new String(readBuffer).trim();	// Data From Aruduino : "tmp26.00;hum80.00;^"
				System.out.println("RAW DATA From ARDUINO:" + newBufferStr );
				String correctedBufferStr = bufferCorrection(newBufferStr);	// crahed data 보정
				
				if(correctedBufferStr != null) {
					// 정상수행
					ss = correctedBufferStr;
					System.out.println("Corrected buffer : " + ss);
				} else {
					// 보정결과 불완전 메시지일 경우 return;
					break;
				}
				
//				String [] array = ss.split(";");
//				if(array.length != 4 || array[0].charAt(0)!='A' || array[0].charAt(0)!='t') {
//					System.out.println("Return ... Crashed Data ..." + ss);
//					break;
//				}

				// nfc, accelRaw, ssRaw 구분 
				if(ss.substring(0,2).equals("nfc")) {
					// nfc 데이터인 경우 
					System.out.println("NFC? ::" + ss.substring(0,2) + ss);
					rawToJson = convertJson(ss, "nfc").toJSONString();
				} else if(ss.substring(0,2).equals("AcX")) {
					JSONObject jsonAccel = new JSONObject();
					jsonAccel = convertJson(ss, "accelRaw");
					
					if(jsonAccel.get("dng").equals("N")) {
						// 노말상태인 경우
						// msgType: accelRaw 전송 
						rawToJson = jsonAccel.toString();
					} else {
						// 아니면 지진 
						// msgType: disaster 전송
						rawToJson = convertJson(ss, "disaster").toString();
					}

				} else {
					// ssRaw 데이터인 경우 
					rawToJson = convertJson(ss, "ssRaw").toJSONString();

				}
				
				
				System.out.println("rawToJson >> " + rawToJson);

				// Send JSON to Server
				sendTcpip(rawToJson);
				
				// Send JSON to DashBoard (Websocket)
				if(WsClient.isOpen()) {
					WsClient.send(rawToJson);
				} else {
					System.out.println("WebSocket is not opend");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}
	}

	// 끊겨서 들어오는 데이터 ex) "p26.00;hum80.00;^$tm"
	// master 메시지 "tmp26.00;hum80.00;"
	// 시작 문자 : "$"
	// 종료 문자 : "^"
	public String bufferCorrection(String newBufferStr) {
		// 개행문자 제거
		newBufferStr = newBufferStr.replaceAll("(\r | \n | \r\n | \n\r)", "");
		
		if (newBufferStr.contains("$") && newBufferStr.contains("^")) {
			bufferStr = bufferStr.concat(newBufferStr);
			
			int start = bufferStr.indexOf("$");
			int end = bufferStr.indexOf("^");
//			System.out.println("start: " + start + "; end: " + end);
			if (start == end + 1) {
				// ^$ 붙어있는 경우
				// $ 이후의 string만 보존하여 저장 후 null 리턴
				bufferStr = bufferStr.substring(end+1);
				return null;
			} else {
				String correctBufferStr = bufferStr.substring(start + 1, end);
				// 병목 현상이 생기는 문제
				// 임시방편 : 정상 처리 되면 나머지는 버리자
//				bufferStr = bufferStr.substring(end + 1);
				bufferStr = "";
				
//				System.out.println("correctBufferStr = " + correctBufferStr);
				return correctBufferStr;
			}
			

		} else {
			// 기존 버퍼에 new버퍼 붙여서 저장 후 null 리턴
			bufferStr = bufferStr.concat(newBufferStr);
			return null;
		}
	}

	public void close() throws IOException {
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		if (in != null) {
			in.close();
		}
		if (out != null) {
			out.close();
		}
		if (commPort != null) {
			commPort.close();
		}
	}

	public void sendToArduino(String cmd) {
		Thread t1 = new Thread(new sendIoT(cmd));
		t1.start();
	}

	class sendIoT implements Runnable {
		String cmd;

		public sendIoT(String cmd) {
			this.cmd = cmd;
		}

		@Override
		public void run() {
			byte[] datas = cmd.getBytes();
			try {
				out.write(datas);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
//	// http요청 > 로그 기록 목적
//	public static void sendHttp(String data) {
//		HttpSender sender = null;
//		String urlstr = "http://" + wsIp + ":" + wsPort + "/log";
//		URL url = null;
//		try {
//			//double temp = Double.parseDouble(data);
//			url = new URL(urlstr + "?data=" + data);
//			sender = new HttpSender(data, url);
//			new Thread(sender).start();
//		} catch (Exception e) {
////			break;
//		}
////		try {
////			Thread.sleep(2000);
////		} catch (InterruptedException e) {
////			e.printStackTrace();
////		}
//	}

	// 아두이노에서 받은 센서데이터 > JSON 형식으로 변환 
	public JSONObject convertJson(String ss, String msgType) {
		JSONObject jsonObj = new JSONObject();
		String[] dataArr = ss.split(";");
		
		jsonObj.put("latteId", LATTE_ID);
		jsonObj.put("area", AREA);
		jsonObj.put("msgType", msgType);
		
		for(int i=0; i<dataArr.length; i++) {
			String dataName = dataArr[i].substring(0,3);
			String dataValue = dataArr[i].substring(3);
			jsonObj.put(dataName, dataValue);
		}
		return jsonObj;
	}
	
//	// 아두이노에서 받은 센서데이터 > JSON 형식으로 변환 
//	public JSONObject convertJson2(String ss) {
//		JSONObject jsonObj = new JSONObject();
//		JSONArray accelArray = new JSONArray();
//		JSONObject accelXyz = new JSONObject();
//		String[] dataArr = ss.split(";");
//
//		jsonObj.put("latteId", LATTE_ID);
//		for (int i = 0; i < dataArr.length; i++) {
//			String tempStr = dataArr[i].substring(0, 3);
//			switch (tempStr) {
//			case "tmp":
////					System.out.println("온도"+dataArr[i].substring(3));
//				jsonObj.put("tmp", dataArr[i].substring(3));
//				continue;
//			case "hum":
////					System.out.println("습도"+dataArr[i].substring(3));
//				jsonObj.put("hum", dataArr[i].substring(3));
//				continue;
//			case "acX":
//				System.out.println("ACC-X: " + dataArr[i].substring(3));
//				accelXyz.put("x", dataArr[i].substring(3));
//				continue;
//			case "acY":
//				System.out.println("ACC-X: " + dataArr[i].substring(3));
//				accelXyz.put("y", dataArr[i].substring(3));
//				continue;
//			case "acZ":
//				System.out.println("ACC-X: " + dataArr[i].substring(3));
//				accelXyz.put("z", dataArr[i].substring(3));
//				jsonObj.put("acc", accelXyz);
//				continue;
//			}
//		}
//		return jsonObj;
//	}

	static class HttpSender implements Runnable {

		URL url = null;
		String data;

		public HttpSender() {
		}

		public HttpSender(String data, URL url) {
			this.data = data;
			this.url = url;
		}

		@Override
		public void run() {
			HttpURLConnection con = null;
			try {
				con = (HttpURLConnection) url.openConnection();
				con.setReadTimeout(5000);
				con.setRequestMethod("POST");
				con.getInputStream();
				System.out.println("SEND DATA HTTP:" + data);
			} catch (Exception e) {

			} finally {
				con.disconnect();
			}
		}
	}
	
	// 로컬 폴더의 my.properties 로드
	public static void getProp() {
		FileReader resources = null;
		Properties properties = new Properties();
		 
		try {
			resources = new FileReader("../my.properties");
			properties.load(resources);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		tcpipIp = properties.getProperty("tcpipIp");
		tcpipPort = Integer.parseInt(properties.getProperty("tcpipPort"));
		wsIp = properties.getProperty("websocketIp");
		wsPort = Integer.parseInt(properties.getProperty("websocketPort"));
		serialComPort = properties.getProperty("serialPort");
		System.out.println(tcpipIp+"\n"+tcpipPort+"\n"+wsIp+"\n"+wsPort+"\n"+serialComPort);
	}
	

	public static void main(String[] args) {
		getProp();
		try {
			// TCP/IP Server 연결 초기화
			Client client = new Client(tcpipIp, tcpipPort, LATTE_ID);
			client.connect();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}