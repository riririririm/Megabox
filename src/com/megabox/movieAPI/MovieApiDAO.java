package com.megabox.movieAPI;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MovieApiDAO {
	
	public void insert(MovieApiDTO movieApiDTO, Connection conn) throws Exception {
		int result =0;
		String sql = "insert into movieAPI values(?,?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, x);
		st.setString(2, x);
		
		
		
	}

}

