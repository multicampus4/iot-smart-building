package com.chart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleTest {

	
	public static void main(String[] args) throws Exception {
		String url="jdbc:oracle:thin:@database-1.chookpxses6b.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
		String id ="admin";
		String password ="2020final";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(url,id,password);
		PreparedStatement pstmt = con.prepareStatement("SELECT TIME,VAL FROM ACCTABLE WHERE VAL = -228");
				
		ResultSet rset = pstmt.executeQuery();
		
		while(rset.next()) {
			String did = rset.getString("TIME");
			
			String data = rset.getString("VAL");
			System.out.println(did+"/"+data);
			}
		con.close();
	
	}
}
