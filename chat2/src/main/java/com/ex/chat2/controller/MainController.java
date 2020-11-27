package com.ex.chat2.controller;

import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chat.Client;
import com.vo.SensorVO;

@Controller
public class MainController {
	
	Client client;

	// 루트 로컬의 my.properties 저장할 변수
	static String tcpipIp;
	static String wsIp;
	static String serialComPort;
	static int tcpipPort;
	static int wsPort;
	
	// DB에 연결할 변수
	private String url;
	private String dbid;
	private String dbpwd;
	
	
	public MainController() {
		getProp();
		client = new Client(tcpipIp, tcpipPort, "[WEB]");
		try {
			client.connect();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// oracle 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		this.url = "jdbc:oracle:thin:@" + tcpipIp + ":1521:xe";
		this.dbid = "db";
		this.dbpwd = "db";
		
	}
	
	@RequestMapping("/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("centerpage", "mainCenter.jsp");
		mv.setViewName("index");
		return mv;
	}
	

	@RequestMapping("/chat")
	public ModelAndView chat(ModelAndView mv, HttpServletResponse res) throws Exception {
		
		// SENSOR 데이터 가져오기
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SensorVO> list = new ArrayList<>();
		
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			pstmt = con.prepareStatement("SELECT * FROM SENSOR");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				String sensor_id = rset.getString(1);
				String sensor_stat = rset.getString(2);
				
				SensorVO sensor = new SensorVO(sensor_id, sensor_stat);
				list.add(sensor);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rset.close();
			pstmt.close();
			con.close();
		}
		mv.addObject("sensorlist", list);
		
		
		// centerpage
		mv.addObject("centerpage", "chat.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/test")
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
	
	@RequestMapping("/chat2")
	public ModelAndView chat2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat2");
		return mv;
	}
	
	@RequestMapping("/history")
	public ModelAndView history() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("centerpage", "c2.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	
	
	@RequestMapping("/ON")
	public void ledStart(HttpServletResponse res, String area) throws IOException {
		System.out.println(area + "_ON START ...");
		client.sendMsg(area +"_ON");
		
	}
	
	@RequestMapping("/OFF")
	public void ledStop(HttpServletResponse res, String area) throws IOException {
		System.out.println(area + "_OFF STOP ...");
		client.sendMsg(area + "_OFF");
		
	}
	@RequestMapping("/alert")
	public void alert(HttpServletResponse res, HttpServletRequest request) throws IOException {
		Client client;
			URL url = null;
			try {
				url = new URL("https://fcm.googleapis.com/fcm/send");
			} catch (MalformedURLException e) {
				System.out.println("Error while creating Firebase URL | MalformedURLException");
				e.printStackTrace();
			}
			HttpURLConnection conn = null;
			try {
				conn = (HttpURLConnection) url.openConnection();
			} catch (IOException e) {
				System.out.println("Error while createing connection with Firebase URL | IOException");
				e.printStackTrace();
			}
			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			// 구글에 요청할 때 제이슨 형태로 요청한다.
			conn.setRequestProperty("Content-Type", "application/json");

			// 구글에서 제공하는 서버 키를 입력.
			conn.setRequestProperty("Authorization", "key="
					+ "AAAAsibJcNg:APA91bEhTQJvT4pGtj2iHyARE-236-p9lfo60OBb-GK7kMDdvL2ycHpaSHA5hDU2ON5AwVIcdLOCSGyQ-U4rDrd2RjORJWfUa3qIC-tArIvjxy87XA3DnGmAOSfEzXp3rBaa7RlTHdMN");

			// create notification message into JSON format
			JSONObject message = new JSONObject();
			message.put("to", "/topics/osh");
			message.put("priority", "high");
			
			
			JSONObject notification = new JSONObject();
			notification.put("title", "센서 작동");
			notification.put("body", "센서가 작동되었습니다.");
			message.put("notification", notification);
			
			JSONObject data = new JSONObject();
			data.put("control", "control1");
			data.put("data", 100);
			message.put("data", data);


			try {
				OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
				out.write(message.toString());
				out.flush();
				conn.getInputStream();
				System.out.println("OK...............");

			} catch (IOException e) {
				System.out.println("Error while writing outputstream to firebase sending to ManageApp | IOException");
				e.printStackTrace();
			}	
			PrintWriter out = res.getWriter();
			out.print("ok");
			out.close();
				
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

	}
	
	// 층별제어 - 1층 
	@RequestMapping("/f1")
	public ModelAndView f1() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("floorpage", "f1.jsp");
		mv.setViewName("redirect:chat");
		return mv;
	}
	
	// 층별제어 - 2층 
	@RequestMapping("/f2")
	public ModelAndView f2() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("floorpage", "f2.jsp");
		mv.setViewName("redirect:chat");
		return mv;
	}
}

