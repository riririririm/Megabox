package com.megabox.seat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.megabox.book.BookDTO;
import com.megabox.movie.MovieDTO;


public class SeatDAO {
//////////////////////////////////
//06.19수현 상영시간표 좌석삭제
	public int deleteSeat(Connection conn, MovieDTO movieDTO) throws Exception {
		int result = 0;
		String sql = "delete seat where theater=? and auditorium=? and view_date=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, movieDTO.getTheater());
		st.setString(2, movieDTO.getAuditorium());
		String[] vd = movieDTO.getView_date().split(" ");
		st.setString(3, vd[0]);

		result = st.executeUpdate();
		st.close();
		return result;
	}
	
	//예매 취소하고나서 좌석 state =1로 바꾸는 sql문
		public int updateSeat(Connection conn, int book_num)throws Exception{
			int result = 0;
			String sql = "update seat set book_num=null, state=1 where book_num=?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, book_num);
			result = st.executeUpdate();
			st.close();
			return result;
		}
/////////////////////////////////////
	public ArrayList<Integer> selectStateList(BookDTO bookDTO, Connection con) throws Exception{
		ArrayList<Integer> seatStatus = new ArrayList<Integer>();
		String sql="select state from seat where theater=? and auditorium=? and view_date=? and show_time=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, bookDTO.getTheater());
		st.setString(2, bookDTO.getAuditorium());
		st.setString(3, bookDTO.getView_date());
		st.setString(4, bookDTO.getShow_time());
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			seatStatus.add(rs.getInt("state"));
		}
		return seatStatus;
	}
	
	public ArrayList<String> initSeat(){
		ArrayList<String> seatInit= new ArrayList<String>();
		int alpha=65;
		for(int i=1;i<7;i++) {
			seatInit.add(((char)alpha)+"");
			alpha++;
		}
		return seatInit;
	}
	public int update(SeatDTO seatDTO, Connection con) throws Exception {
		String sql="update seat set book_num=?, state=0 where theater=? and auditorium=? and seat_num=? "
				+ "and view_date=? and show_time=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, seatDTO.getBook_num());
		st.setString(2, seatDTO.getTheater());
		st.setString(3, seatDTO.getAuditorium());
		st.setString(4, seatDTO.getSeat_num());
		st.setString(5, seatDTO.getView_date());
		st.setString(6, seatDTO.getShow_time());
		

		int result=0;
		result=st.executeUpdate();
		
		st.close();
		return result;
	}
	
	public int insert(SeatDTO seatDTO, Connection con) throws Exception {
		String sql="insert into seat values(seat_seq.nextval,null,?,?,?,1,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		//st.setInt(1, seatDTO.getBook_num());
		st.setString(1, seatDTO.getTheater());
		st.setString(2, seatDTO.getAuditorium());
		st.setString(3, seatDTO.getSeat_num());
		st.setString(4, seatDTO.getView_date());
		st.setString(5, seatDTO.getShow_time());
		int result=0;
		result=st.executeUpdate();
		
		st.close();
		return result;
	}
}