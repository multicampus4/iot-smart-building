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

		String url="jdbc:oracle:thin:@192.168.0.63:1521:xe";
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
				
				while(rset.next()) {
					JSONObject data = new JSONObject();
					
					data.put("name", rset.getString(1));
					//JSONArray jo2 = new JSONArray();
					//jo2.add(rset.getInt(2));
					//jo2.add(rset.getString(5));
					//jo2.add(rset.getFloat(5));
					data.put("y", rset.getInt(2));
					ja.add(data);
					System.out.println(ja);
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


