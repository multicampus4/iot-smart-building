package com.chart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleTest {

	
	public static void main(String[] args) throws Exception {
		String url="jdbc:oracle:thin:@192.168.0.63:1521:xe";
		String id ="system";
		String password ="oracle";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url,id,password);
		PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Sensor");
		ResultSet rset = pstmt.executeQuery();
		while(rset.next()) {
			String did = rset.getString("SENSORNAME");
			
			int data = rset.getInt("OUTCOME");
			System.out.println(did+""+data);
			}
		con.close();
	
	}
}
