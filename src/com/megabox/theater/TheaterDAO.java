package com.megabox.theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TheaterDAO {

	//selectList
	public ArrayList<TheaterDTO> selectList(Connection con) throws Exception {
		ArrayList<TheaterDTO> ar = new ArrayList<TheaterDTO>();
		String sql = "select * from theater";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		TheaterDTO theaterDTO = null;
		while(rs.next()) {
			theaterDTO = new TheaterDTO();
			theaterDTO.setTheater_num(rs.getInt("theater_num"));
			theaterDTO.setTheater_name(rs.getString("theater_name"));
			ar.add(theaterDTO);
		}
		
		rs.close();
		st.close();
		
		return ar;
	}
	
	
}
