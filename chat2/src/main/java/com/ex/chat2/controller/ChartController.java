package com.ex.chat2.controller;

import java.io.FileReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

	@Controller
	public class ChartController {

        //oracle
		static String oracleHostname;
		static String oracleId;
		static String oraclePwd;
		//hive
		static String hiveHostname;
		static String hiveId;
		static String hivePwd;
		//oracle
		private String url;
		private String dbid;
		private String dbpwd;
		//hive
		private String url2;
		private String hid;
		private String hpwd;
		

	public ChartController() {
		getProp();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Class.forName("org.apache.hive.jdbc.HiveDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		this.url = "jdbc:oracle:thin:@" + oracleHostname + ":1521:ORCL";
		this.dbid = oracleId;
		this.dbpwd = oraclePwd;
		this.url2 = "jdbc:hive2://" + hiveHostname +"/default";
		this.hid = hiveId;
		this.hpwd = hivePwd;
	}

	@RequestMapping("/getTimeGph.mc")
	@ResponseBody
	public void getTimeGph(HttpServletResponse res) throws Exception {
		Connection con = null;
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
			ResultSet rset = pstmt.executeQuery();
			while (rset.next()) {
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
				val.add(rset.getFloat(14));
				val.add(rset.getFloat(15));
				
				data.put("data", val);
				ja.add(data);
				// System.out.println(ja);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		con.close();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}

	@RequestMapping("/getdayavg.mc")
	@ResponseBody
	public void getdata1(HttpServletResponse res) throws Exception {
		Connection con = null;
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
			ResultSet rset = pstmt.executeQuery();
			while (rset.next()) {

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
				val.add(rset.getFloat(12));
				val.add(rset.getFloat(14));
				val.add(rset.getFloat(15));
				data.put("data", val);
				ja.add(data);
				//System.out.println(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		con.close();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}

	
	@RequestMapping("/getdata1130.mc")
	@ResponseBody
	public void getdata1130(HttpServletResponse res,HttpServletRequest req) throws Exception {
	
		Connection con = null;
		String cmd = req.getParameter("CMD");
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);

			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1130");

			ResultSet rset = pstmt.executeQuery();
			while (rset.next()) {
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
				val.add(rset.getFloat(12));
				val.add(rset.getFloat(14));
				val.add(rset.getFloat(15));
				data.put("data", val);
				ja.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		con.close();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}
	
	@RequestMapping("/getdata1201.mc")
	@ResponseBody
	public void getdata5(HttpServletResponse res,HttpServletRequest req) throws Exception {
		Connection con = null;
		String cmd = req.getParameter("CMD");
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
			ResultSet rset = pstmt.executeQuery();
			System.out.println(rset);
			while (rset.next()) {
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
				val.add(rset.getFloat(12));
				val.add(rset.getFloat(14));
				val.add(rset.getFloat(15));
				data.put("data", val);
				ja.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		con.close();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}
	
//	@RequestMapping("/get1201table.mc?cmd=2")
	@RequestMapping("/getdata1202.mc")
	@ResponseBody
	public void getTable1201(HttpServletResponse res,HttpServletRequest req) throws Exception {
		Connection con = null;
		String cmd = req.getParameter("CMD");
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt 
			= con.prepareStatement("SELECT * FROM T1202");
															
			ResultSet rset = pstmt.executeQuery();
			System.out.println(rset);
			while (rset.next()) {

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
				val.add(rset.getFloat(12));
				val.add(rset.getFloat(14));
				val.add(rset.getFloat(15));
				data.put("data", val);

				ja.add(data);
				// System.out.println(ja);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		con.close();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}



	@RequestMapping("/getdata1203.mc")

	@ResponseBody
	public void getdata6(HttpServletResponse res,HttpServletRequest req) throws Exception {
		Connection con = null;
		String cmd = req.getParameter("CMD");
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1203");
			ResultSet rset = pstmt.executeQuery();
			System.out.println(rset);
			while (rset.next()) {

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
				val.add(rset.getFloat(12));
				val.add(rset.getFloat(14));
				val.add(rset.getFloat(15));
				data.put("data", val);
				ja.add(data);
				//System.out.println(ja);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		Connection con = null;
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
			ResultSet rset = pstmt.executeQuery();
			System.out.println(rset);
			while (rset.next()) {
				JSONObject data = new JSONObject();
				data.put("name", rset.getString(1));
				data.put("data", rset.getFloat(11));
				ja.add(data);
				// System.out.println(ja);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		con.close();
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}

	@RequestMapping("/getNow.mc")
	@ResponseBody
	public void getNow(HttpServletResponse res) throws Exception {
		Random random = new Random();
		Connection con = null;
		JSONArray ja = new JSONArray();
		while(true) {
			try {
				int minute = random.nextInt(6)+21;			//21~26
				int second = random.nextInt(60)+1;	
				System.out.println(minute);System.out.println(second);
				con = DriverManager.getConnection(url2, hid, hpwd);
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM thdi where day(realtime)=13 and hour(realtime)=5 and minute(realtime)="+minute+" and second(realtime)="+second);
				ResultSet rset = pstmt.executeQuery();
				// [{name: 'Sweden',data:[0.904 81.0 11.0]},{}]
				while(rset.next()) {
					JSONObject jo = new JSONObject();
					jo.put("temperature", rset.getString(2).substring(3));
					jo.put("humidity", rset.getString(3).substring(3));
					jo.put("finedust", rset.getString(4).substring(3));
					jo.put("illuminance", rset.getString(5).substring(3));
					ja.add(jo);
				}
				if(ja.size()==0) {
					continue;
				}
				break;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		con.close();
		System.out.println(ja);
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();
		out.print(ja.toJSONString());
		out.close();
	}

	@RequestMapping("/getdata1208.mc")
	@ResponseBody
	public void getdata8(HttpServletResponse res) throws Exception {
		Connection con = null;
		JSONArray ja = new JSONArray();
		try {
			con = DriverManager.getConnection(url, dbid, dbpwd);
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM T1201");
			ResultSet rset = pstmt.executeQuery();
			System.out.println(rset);
			while (rset.next()) {
				JSONObject data = new JSONObject();
				data.put("name", rset.getString(1));
				data.put("data", rset.getFloat(11));
				ja.add(data);
				// System.out.println(ja);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
        hiveHostname = properties.getProperty("hiveHostname");
	    hiveId = properties.getProperty("hiveId");
		hivePwd = properties.getProperty("hivePwd");
	}

}