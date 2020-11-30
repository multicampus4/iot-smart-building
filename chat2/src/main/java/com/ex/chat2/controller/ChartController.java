package com.ex.chat2.controller;


	import java.io.PrintWriter;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;

	import javax.servlet.http.HttpServletResponse;

	import org.json.simple.JSONArray;
	import org.json.simple.JSONObject;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.ResponseBody;

	@Controller
	public class ChartController {

		String url="jdbc:oracle:thin:@192.168.123.106:1521:xe";
		String id ="system";
		String password ="oracle";
		public ChartController() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		@RequestMapping("/getdata1.mc")
		@ResponseBody
		public void getdata1(HttpServletResponse res) throws SQLException, Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,id,password);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Sensor");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
					
					data.put("name", rset.getString(1));
					//JSONArray jo2 = new JSONArray();
					//jo2.add(rset.getInt(2));
					//jo2.add(rset.getString(5));
					//jo2.add(rset.getFloat(5));
					data.put("y", rset.getInt(2));
					ja.add(data);
					System.out.println(data);
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
			}
			con.close();
			res.setCharacterEncoding("UTF-8");

			res.setContentType("application/json");

			PrintWriter out = res.getWriter();

			out.print(ja.toJSONString());

			out.close();

			
		}
		@RequestMapping("/getdata2.mc")
		@ResponseBody
		public void getdata2(HttpServletResponse res) throws SQLException, Exception {
			Connection con =null;
			JSONArray ja2 = new JSONArray();
			try {
				con = DriverManager.getConnection(url,id,password);
				PreparedStatement pstmt = con.prepareStatement("SELECT sensorName,outcome FROM Sensor WHERE sensorName='HUM1'");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data2 = new JSONObject();
					
					data2.put("name", rset.getString(1));
					//JSONArray jo2 = new JSONArray();
					//jo2.add(rset.getInt(2));
					//jo2.add(rset.getString(5));
					//jo2.add(rset.getFloat(5));
					data2.put("y", rset.getInt(2));
					ja2.add(data2);
					System.out.println(data2);
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
			}
			con.close();
			res.setCharacterEncoding("UTF-8");

			res.setContentType("application/json");

			PrintWriter out = res.getWriter();

			out.print(ja2.toJSONString());

			out.close();

			
		}
		@RequestMapping("/getdata3.mc")
		@ResponseBody
		public void getdata3(HttpServletResponse res) throws SQLException, Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,id,password);
				PreparedStatement pstmt = con.prepareStatement("SELECT *FROM Sensor2");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
					
					data.put("name", rset.getString(1));
					//JSONArray jo2 = new JSONArray();
					//jo2.add(rset.getInt(2));
					//jo2.add(rset.getString(5));
					//jo2.add(rset.getFloat(5));
					data.put("y", rset.getInt(2));
					ja.add(data);
					System.out.println(data);
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
			}
			con.close();
			res.setCharacterEncoding("UTF-8");

			res.setContentType("application/json");

			PrintWriter out = res.getWriter();

			out.print(ja.toJSONString());

			out.close();

			
		}
		
		
	}


