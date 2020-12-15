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
		//PreparedStatement pstmt = con.prepareStatement("SELECT * FROM (SELECT DATA,T5 FROM T1130)"
																	//+ "WHERE ROWNUM <= 3");
															
		PreparedStatement pstmt = con.prepareStatement("SELECT DATA,T5 FROM T1130");		
		ResultSet rset = pstmt.executeQuery();
		
		while(rset.next()) {
			String did = rset.getString("DATA");
			
			Float data = rset.getFloat("T5");
			System.out.println(data+"/"+did);
			}
		con.close();
	
	}
}
