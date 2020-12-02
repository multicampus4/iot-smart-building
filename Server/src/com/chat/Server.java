package com.chat;

import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import com.msg.Msg;

public class Server {
	// 멤버 변수 선언
	int port;															// 포트
	String address;														// IP 주소
	String id;															// ID
	
	// 루트 로컬의 my.properties 저장할 변수
	static int tcpipPort;

	ServerSocket serverSocket;											// SErverSocket 객체
	
	// client들의 메세지를 받는다.
	HashMap<String, ObjectOutputStream> maps;	// HashMap<IP주소, 해당 아웃풋스트림>
	HashMap<String, String> idipMaps;			// HashMap<클라이언트id, 클라이언트ip> for sendTarget
												// ex) <latte_1_A, 192.168.1.11>
	
	// sendTarget 위한 ip주소 선언 >> hashMap 관리방식으로 변경하기!
	String targetIp = null;
	String targetIp2 = null;
	String targetIp3 = null; // Tablet ip
	
	// 기본 생성자
	public Server() {}
	
	// 포트를 담은 생성자
	public Server(int port) {
		this.port = port;
		maps = new HashMap<>();
		idipMaps = new HashMap<>();
		
	}
	
	// 서버를 시작하는 startServer() 함수
	public void startServer() throws Exception {
		serverSocket = new ServerSocket(port);							// serverSocket에 포트를 입력하여 선언
		System.out.println("Strat Server ...");							// "서버를 시작합니다."
		
		// 네트워크는 스레드에서 동작시켜야 한다.
		Runnable r = new Runnable() {
			
			@Override
			public void run() {
				while(true) {
					try {
						Socket socket = null;							// 소켓 초기화
						System.out.println("Ready Server ...");			// "서버를 준비합니다..."
						socket = serverSocket.accept();					// 클라이언트를 기다린다.
						
						// 접속한 client들의 ip 주소 확인
						System.out.println(socket.getInetAddress());	// IP 주소 출력
						makeOut(socket);								// 각각의 client들의 outputstream을 hashmap에 저장
						
						// client가 들어올 때마다 새로운 스레드가 생성
						new Receiver(socket).start();
						
					} catch(Exception e) {
						e.printStackTrace();
					}
				} // end while
			}
		};
		
		new Thread(r).start();
		
	}
	
	// 각각의 client들의 outputstream을 hashmap에 저장한다.
	public void makeOut(Socket socket) throws IOException {
		ObjectOutputStream oo;											// 아웃풋스트림 객체인 oo 선언		
		oo = new ObjectOutputStream(socket.getOutputStream());			// 소켓으로부터 아웃풋 스트림을 가져와 대입
		maps.put(socket.getInetAddress().toString(), oo);				// IP주소와 아웃풋스트림을 해쉬맵에 저장
		System.out.println("접속자수: " + maps.size());					// 해쉬맵의 크기로 접속자 수를 출력
	}
	
	// client들을 받는다.
	// sendMsg를 호출하여 메세지 객체를 받는다.
	// Receiver 쓰레드
	class Receiver extends Thread {
		Socket socket;													// 소켓
		ObjectInputStream oi;											// 인풋스트림
		
		// 소켓을 담은 Receiver 생성자
		public Receiver(Socket socket) throws IOException {
			this.socket = socket;
			oi = new ObjectInputStream(this.socket.getInputStream());	// 소켓으로부터 인풋스트림을 가져와 oi에 대입
		}

		@Override
		public void run() {
			while(oi != null) {
				Msg msg = null;
				try {
					msg = (Msg) oi.readObject();
					System.out.println(msg);

					switch(msg.getType()) {	// first :: ssRaw :: command 
					case "first":
						System.out.println("First");
						idipMaps.put(msg.getId(), socket.getInetAddress().toString());
						sendTarget(idipMaps.get(msg.getId()), msg.getType(),"SUCCESS Connection (FROM Server)");
						for(String key : idipMaps.keySet()){
				            String value = idipMaps.get(key);
				            System.out.println(key+" ::: "+value);
				        }
						break;
					case "ssRaw":
						System.out.println("Received Sensor Raw Data");
						// From Lattes
						// To (센서 raw 데이터 전송 대상)
						// : 모바일 안드로이드(tcp/ip)
						// : 웹대시보드 (websocket) >> 이건 여기서 취급 안함 >> 라떼에서 직접 통신
						sendTarget(idipMaps.get("mobileApp"), msg.getType(), msg.getMsg());
						break;
					case "command":
						System.out.println("Received Command");
						// Data From 웹대시보드, 모바일 안드로이드
						// To 각 라떼 IoT Client (1_A, 2_A, 2_B)
						// web에서 보내는 메시지 예: 1_A_D_AIR_OFF
						String[] split = msg.getMsg().split("_");
						String cmdTargetL = "latte_" + split[0] + "_" + split[1];
						String cmdTargetT = "tablet_" + split[0] + "_" + split[1];
						// Target : Latte
						if(idipMaps.get(cmdTargetL) != null) {
							String cmdAction = split[2] + "_" + split[3] + "_" + split[4];
							sendTarget(idipMaps.get(cmdTargetL), msg.getType(), cmdAction);
						}
						// Target : Tablet
						if(idipMaps.get(cmdTargetT) != null) {
							sendTarget(idipMaps.get(cmdTargetT), msg.getType(), msg.getMsg());
						}
						if(idipMaps.get("mobileApp") != null) {
							sendTarget(idipMaps.get("mobileApp"), msg.getType(), msg.getMsg());
						}
						break;
					case "etc":
						// 기타 메시지 처리
						System.out.println("기타메시지: " + msg);
						break;
					}

					//	=========================== Legacy ==================================
					switch (msg.getMsg()) {
					case "q": 											// "q" 입력시
						throw new Exception();							// 강제로 exception을 내서 client를 삭제한다.
					case "byeAndroid":
						System.out.println("bye Android");
						throw new Exception();
					case "iamAndroid": 									// Hand Shake 메시지로 sendTarget 실행할 IP 저장
						targetIp = socket.getInetAddress().toString();
						System.out.println("ANDROID's IP" + targetIp);
//						sendTarget(targetIp, "Connected");
						break;
					case "iamLatte01":
						targetIp2 = socket.getInetAddress().toString();
						System.out.println("LATTE'S IP" + targetIp2);
						break;
					case "iamTablet":
						targetIp3 = socket.getInetAddress().toString();
						System.out.println("TABLET'S IP" + targetIp3);
						break;

					}
					System.out.println("Received: " + msg.getId() + " /// " + msg.getType() + " /// " + msg.getMsg());
//					sendMsg(msg);
					// ▲ 전체 클라이언트에 전송하면 중복 데이터 주고받고 난리나는 문제의 원인
					// sendTarget으로 특정 클라이언트에만 데이터 전송
					// 지금 여기선 모바일앱이 sendTarget 대상
					// 2020-11-18(재현)
					// To-do : 로직 설계 제대로 해서 Null Exception 해결
					// 원인 : 안드로이드 앱종료/재실행 액션 인지가 잘 안됨 
					if(targetIp != null) {	// 센서데이터 > 안드로이드 전송 
//						sendTarget(targetIp,msg.getMsg());
//						System.out.println("To 안드로이드: "+ msg.getMsg());
					}
					if(msg.getId().equals("[WEB]") && targetIp2 != null) {
//						sendTarget(targetIp2,msg.getMsg()); // to Latte
						System.out.println("웹 > 라떼: "+ msg.getMsg());
					}
					else if(msg.getId().equals("[osh_switch]") && targetIp2 != null) {
//						sendTarget(targetIp2,msg.getMsg());	// to Latte
						System.out.println("안드로이드 > 라떼: "+ msg.getMsg());
					}else if(msg.getId().equals("[WEB]") && targetIp3 != null) {
//						sendTarget(targetIp3,msg.getMsg());	// to Tablet
						System.out.println("웹 > 태블릿: "+ msg.getMsg());
					}
				} catch (Exception e) { // client가 갑자기 접속 중단된 경우
					maps.remove(socket.getInetAddress().toString());			// 해쉬맵에서 연결된 IP주소 삭제
					idipMaps.remove(socket.getInetAddress().toString());	// ************************* 테스트 안해봄!
					System.out.println(socket.getInetAddress()+".. Exited");	// "(IP)가 나갔습니다"
					System.out.println("접속자수: " + maps.size());				// 해쉬맵의 크기로 접속자수 출력
					break;
				} 
			} // end while
			
			try {
				if(oi != null) {
					oi.close();
				}
				if(socket != null) {
					socket.close();
				}
			} catch(Exception e) {
				
			}
		}
		
	}
	
	// 객체에서 메세지로 가져와서 Sender를 호출한다.
	public void sendMsg(Msg msg) {
		Sender sender = new Sender();
		sender.setMsg(msg);
		sender.start();
	}
	
	
	// 특정 클라이언트에게만 메시지를 전송하는 sendTarget 함수
	public void sendTarget(String ip, String type, String cmd) {
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		ArrayList<String> ips = new ArrayList<String>();					// IP를 담을 문자열 ArrayList 선언
		ips.add(ip);														// ArrayList에 IP저장
		Msg msg = new Msg(ips, "MainServer", type, cmd);					// IP ArrayList, ID, 메시지 내용을 담는 Msg 생성자를 이용
		Sender sender = new Sender();										// Sender 객체 선언
		sender.setMsg(msg);											// sender에 msg 저장
		new Thread(sender).start();											// sender 쓰레드 실행
	}
	
	// client들에게 메세지 전송한다.
	class Sender extends Thread {
		Msg msg;
		public void setMsg(Msg msg) {
			
			this.msg = msg;
		}
		
		@Override
		public void run() { 
			Collection<ObjectOutputStream> cols = maps.values();
			Iterator<ObjectOutputStream> it = cols.iterator();
			while(it.hasNext()) {
				try {
					System.out.println("AAAAAA" + msg);
					if(msg.getIps() != null) {								// 만약 Msg 객체 변수 중 IP Arraylist 안이 null이 아니면
//						System.out.println("Sender class msg: "+msg);
						for(String ip: msg.getIps()) {						// ips에 저장된 특정 클라이언트들만 대상으로 한다.
							maps.get(ip).writeObject(msg);					// 해쉬맵에서 key가 "ip"인 메시지내용을 아웃풋스트림에 출력
						}
						break;
					}
					
					it.next().writeObject(msg);								// 그게 아니면 전체를 대상으로 아웃풋스트림에 메시지 내용 출력
				} catch (IOException e) {
					e.printStackTrace();
				}
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

		tcpipPort = Integer.parseInt(properties.getProperty("tcpipPort"));

	}

	public static void main(String[] args) {
		getProp();
		Server server = new Server(tcpipPort);								// Server 객체에  포트를 넣어 선언
		
		// 서버 실행
		try {
			server.startServer();											// 서버 시작
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}