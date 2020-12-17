package com.chat;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONObject;

public class FcmSender {
	
	public void sender(String title, String body) {
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
		notification.put("title", title);
		notification.put("body", body);
		message.put("notification", notification);

		JSONObject data = new JSONObject();
		data.put("control", "control1");
		data.put("data", 1001111);
		data.put("type", "disaster");
		message.put("data", data);

		/*
		 * JSONObject message는 이렇게 생겼다. { "to": "/topicx/osh", "priority": "high",
		 * "notification": {"title": "센서작동", "body": "센서가 작동되었습니다."}, "data":
		 * {"control": "control1", "data": 100} }
		 */

		System.out.println(message.toString());

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
	}

}
