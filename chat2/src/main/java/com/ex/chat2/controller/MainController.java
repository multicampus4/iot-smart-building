package com.ex.chat2.controller;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chat.Client;

@Controller
public class MainController {
	
	Client client;
		client = new Client("192.168.0.17", 5555, "[WEB]");
		try {
			client.connect();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat");
		return mv;
	}
	
	@RequestMapping("/ledStart")
	public void ledStart(HttpServletResponse res) throws IOException {
		System.out.println("LED START ...");
		client.sendMsg("ledStart");
		
	}
	
	@RequestMapping("/ledStop")
	public void ledStop(HttpServletResponse res) throws IOException {
		System.out.println("LED STOP ...");
		client.sendMsg("ledStop");
		
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
}

