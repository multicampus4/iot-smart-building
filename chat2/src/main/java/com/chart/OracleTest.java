package com.chart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleTest {

	
	public static void main(String[] args) throws Exception {
		String url="jdbc:oracle:thin:@192.168.25.57:1521:xe";
		String id ="final_db";
		String password ="111111";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url,id,password);
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM SENSOR2");
		ResultSet rset = pstmt.executeQuery();
		
		while(rset.next()) {
			String did = rset.getString("SNAME");
			
			int data = rset.getInt("SOUT");
			System.out.println(did+""+data);
			}
		con.close();
	
	}
}
