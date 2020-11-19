package com.chat;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import com.msg.Msg;

public class Server {

	int port;
	String address;
	String id;
	
	ServerSocket serverSocket;
	
	// client들의 메세지를 받는다.
	HashMap<String, ObjectOutputStream> maps;
	
	// sendTarget 위한 ip주소 선언 >> hashMap 관리방식으로 변경하기!
	String targetIp = null;
	String targetIp2 = null;
	
	public Server() {}
	
	public Server(int port) {
		this.port = port;
		maps = new HashMap<>();
	}
	
	public void startServer() throws Exception {
		serverSocket = new ServerSocket(port);
		System.out.println("Strat Server ...");
		
		// 네트워크는 스레드에서 동작시켜야 한다.
		Runnable r = new Runnable() {
			
			@Override
			public void run() {
				while(true) {
					try {
						Socket socket = null;
						System.out.println("Ready Server ...");
						socket = serverSocket.accept();
						// 접속한 client들의 ip address 확인
						System.out.println(socket.getInetAddress());
						makeOut(socket);
						
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
		ObjectOutputStream oo;
		oo = new ObjectOutputStream(socket.getOutputStream());
		maps.put(socket.getInetAddress().toString(), oo);
		System.out.println("접속자수: " + maps.size());
	}
	
	// client들을 받는다.
	// sendMsg를 호출하여 메세지 객체를 받는다.
	class Receiver extends Thread {
		Socket socket;
		ObjectInputStream oi;
		
		public Receiver(Socket socket) throws IOException {
			this.socket = socket;
			oi = new ObjectInputStream(this.socket.getInputStream());
		}

		@Override
		public void run() {
			while(oi != null) {
				Msg msg = null;
				
				try {
					msg = (Msg) oi.readObject();
					switch (msg.getMsg()) {
					case "q": // 강제로 exception을 내서 client를 삭제한다.
						throw new Exception();
					case "byeAndroid":
						System.out.println("bye Android");
						throw new Exception();
					case "iamAndroid": // Hand Shake 메시지로 sendTarget 실행할 IP 저장
						targetIp = socket.getInetAddress().toString();
						System.out.println("ANDROID's IP" + targetIp);
						sendTarget(targetIp, "Connected");
						break;
					case "iamLatte01":
						targetIp2 = socket.getInetAddress().toString();
						System.out.println("LATTE'S IP" + targetIp2);
						break;

					}
					System.out.println("Received: " + msg.getId() + msg.getMsg());
//					sendMsg(msg);
					// ▲ 전체 클라이언트에 전송하면 중복 데이터 주고받고 난리나는 문제의 원인
					// sendTarget으로 특정 클라이언트에만 데이터 전송
					// 지금 여기선 모바일앱이 sendTarget 대상
					// 2020-11-18(재현)
					// To-do : 로직 설계 제대로 해서 Null Exception 해결
					// 원인 : 안드로이드 앱종료/재실행 액션 인지가 잘 안됨 
					if(targetIp != null) {	// 센서데이터 > 안드로이드 전송 
						sendTarget(targetIp,msg.getMsg());
						System.out.println("To 안드로이드: "+ msg.getMsg());
					}
					if(msg.getId().equals("[WEB]") && targetIp2 != null) {
						sendTarget(targetIp2,msg.getMsg()); // to Latte
						System.out.println("웹 > 라떼: "+ msg.getMsg());
					}
					else if(msg.getId().equals("[osh_switch]") && targetIp2 != null) {
						sendTarget(targetIp2,msg.getMsg());	// to Latte
						System.out.println("안드로이드 > 라떼: "+ msg.getMsg());
					}
				} catch (Exception e) { // client가 갑자기 접속 중단된 경우
					maps.remove(socket.getInetAddress().toString());
					System.out.println(socket.getInetAddress()+".. Exited");
					System.out.println("접속자수: " + maps.size());
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
	
	public void sendTarget(String ip, String cmd) {
		ArrayList<String> ips = new ArrayList<String>();
		ips.add(ip);
		Msg msg = new Msg(ips,id,cmd);
		Sender sender = new Sender();
		sender.setMsg(msg);
		new Thread(sender).start();
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
					
					if(msg.getIps() != null) {
//						System.out.println("Sender class msg: "+msg);
						for(String ip: msg.getIps()) {
							maps.get(ip).writeObject(msg);
						}
						break;
					}
					
					it.next().writeObject(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	

	public static void main(String[] args) {
		Server server = new Server(5253);
		
		// 서버 실행
		try {
			server.startServer();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}