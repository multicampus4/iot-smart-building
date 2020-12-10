package com.ex.chat2.controller;


	import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpServletResponse;

	import org.json.simple.JSONArray;
	import org.json.simple.JSONObject;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.ResponseBody;

	@Controller
	public class ChartController {

		static String oracleHostname;
		static String oracleId;
		static String oraclePwd;
		private String url;
		private String dbid;
		private String dbpwd;

		public ChartController() {
			getProp();
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			this.url = "jdbc:oracle:thin:@" + oracleHostname + ":1521:ORCL";
			this.dbid = oracleId;
			this.dbpwd = oraclePwd;
		}
		
		@RequestMapping("/getTimeGph.mc")
		@ResponseBody
		public void getTimeGph(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
					data.put("name", rset.getString(1));

					JSONArray val = new JSONArray();
					val.add(rset.getFloat(2));
					val.add(rset.getFloat(3));
					val.add(rset.getFloat(4));
					val.add(rset.getFloat(5));
					val.add(rset.getFloat(6));
					val.add(rset.getFloat(7));
					val.add(rset.getFloat(8));
					val.add(rset.getFloat(9));
					val.add(rset.getFloat(10));
					val.add(rset.getFloat(11));
					data.put("data", val);
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		
		
		@RequestMapping("/getdatatable.mc")
		@ResponseBody
		public void getdata1(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {

                   JSONObject data = new JSONObject();
					
					data.put("name", rset.getString(1));

					JSONArray val = new JSONArray();
					val.add(rset.getFloat(2));
					val.add(rset.getFloat(3));
					val.add(rset.getFloat(4));
					val.add(rset.getFloat(5));
					val.add(rset.getFloat(6));
					val.add(rset.getFloat(7));
					val.add(rset.getFloat(8));
					val.add(rset.getFloat(9));
					val.add(rset.getFloat(10));
					val.add(rset.getFloat(11));
					data.put("data", val);
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		
		
		@RequestMapping("/getdata1204.mc")
		@ResponseBody
		public void getdata4(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
                  	data.put("name", rset.getString(1));
                  	data.put("data",rset.getFloat(3));
					

					//JSONArray jo2 = new JSONArray();
					//jo2.add(rset.getInt(2));
					//jo2.add(rset.getString(5));
					//jo2.add(rset.getFloat(1));
					//jo2.add(rset.getFloat(1));
					//jo2.add(rset.getFloat(2));
					//
					//ja.add(data);
					//data.put("data",jo2);
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		@RequestMapping("/getdata1205.mc")
		@ResponseBody
		public void getdata5(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
                  	data.put("name", rset.getString(1));
                  	data.put("data",rset.getFloat(4));
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		@RequestMapping("/getdata1206.mc")
		@ResponseBody
		public void getdata6(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
                  	data.put("name", rset.getString(1));
                  	data.put("data",rset.getFloat(11));
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		@RequestMapping("/getdata1207.mc")
		@ResponseBody
		public void getdata7(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
                  	data.put("name", rset.getString(1));
                  	data.put("data",rset.getFloat(11));
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		@RequestMapping("/getdata1208.mc")
		@ResponseBody
		public void getdata8(HttpServletResponse res) throws Exception {
			Connection con =null;
			JSONArray ja = new JSONArray();
			try {
				con = DriverManager.getConnection(url,dbid,dbpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
				ResultSet rset = pstmt.executeQuery();
				System.out.println(rset);
				while(rset.next()) {
					JSONObject data = new JSONObject();
                  	data.put("name", rset.getString(1));
                  	data.put("data",rset.getFloat(11));
					ja.add(data);
					//System.out.println(ja);
					}
			} catch (SQLException e) {
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
		
		public static void getProp() {
			FileReader resources = null;
			Properties properties = new Properties();

			try {
				resources = new FileReader("../my.properties");
				properties.load(resources);
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			oracleHostname = properties.getProperty("oracleHostname");
			oracleId = properties.getProperty("oracleId");
			oraclePwd = properties.getProperty("oraclePwd");

		}
		
	}