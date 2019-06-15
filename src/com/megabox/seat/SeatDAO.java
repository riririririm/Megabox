package com.megabox.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class SeatDAO {
	public int update(SeatDTO seatDTO, Connection con) throws Exception {
		String sql="update seat set book_num=?, state=0 where theater=? and auditorium=? and seat_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, seatDTO.getBook_num());
		st.setString(2, seatDTO.getTheater());
		st.setString(3, seatDTO.getAuditorium());
		st.setString(4, seatDTO.getSeat_num());

		int result=0;
		result=st.executeUpdate();
		
		st.close();
		return result;
	}
}
