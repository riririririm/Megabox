package com.megabox.movieAPI;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class MovieApiDAO {
	String user = "megabox";
	String password = "megabox";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String driver = "oracle.jdbc.driver.OracleDriver";

	
	public void insertMovie(MovieApiDTO movieApiDTO) {
		Connection con = null;
		ResultSet rs = null;
		
		String sql = "insert into movieAPI values(?,?)";
		//2. driver 메모리에 로딩
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			if(con != null) {
				System.out.println("성공");
			} else { 
				System.out.println("실패");
			}
			
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, movieApiDTO.getMovie_code());
			st.setString(2, movieApiDTO.getMovie_title());
			st.executeUpdate();
		
			st.close();
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}


