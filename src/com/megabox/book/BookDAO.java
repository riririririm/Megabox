package com.megabox.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.megabox.page.SearchRow;



public class BookDAO {
	//BookCancelCount
	public int bookCancelCount(Connection conn, String id)throws Exception{
		int result=0;
		String sql = "select count(book_num) from book where state=1 and id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(book_num)");
		rs.close();
		st.close();
		return result;
	}
	//BookTotalCount
	public int bookTotalCount(Connection conn, String id)throws Exception{
		int result=0;
		String sql = "select count(book_num) from book where state=0 and id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(book_num)");
		rs.close();
		st.close();
		return result;
	}
	//MyPage 에서 BookDelete 해주기
	public int bookDelete(Connection conn, String id, int book_num)throws Exception{
		int result=0;
		String sql = "update book set cancel_date=sysdate, state=1 where id=? and book_num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setInt(2, book_num);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	
	//MyPage에서 Book예약 화면 보여주기
	public ArrayList<BookDTO> bookList(Connection conn, String id, SearchRow searchRow)throws Exception{
		ArrayList<BookDTO> ar = new ArrayList<BookDTO>();
		String sql="select * from " + 
				"(select rownum R, p.* from " + 
				"(select book_num, id, movie_code , movie_title , theater , auditorium, seat_count, book_date, show_time, "
				+"to_char(view_date, 'yyyy-mm-dd') vd, cancel_date, state, price from book where id=? and state=0 order by book_num desc) p) " + 
				"where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setInt(2, searchRow.getStartRow());
		st.setInt(3, searchRow.getLastRow());
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			BookDTO bookDTO = new BookDTO();
			bookDTO.setBook_num(rs.getInt("book_num"));
			bookDTO.setId(rs.getString("id"));
			bookDTO.setMovie_code(rs.getString("movie_code"));
			bookDTO.setMovie_title(rs.getString("movie_title"));
			bookDTO.setTheater(rs.getString("theater"));
			bookDTO.setAuditorium(rs.getString("auditorium"));
			bookDTO.setSeat_count(rs.getInt("seat_count"));
			bookDTO.setBook_date(rs.getDate("book_date"));
			bookDTO.setShow_time(rs.getString("show_time"));
			bookDTO.setView_date(rs.getString("vd"));
			bookDTO.setCancel_date(rs.getDate("cancel_date"));
			bookDTO.setState(rs.getInt("state"));
			bookDTO.setPrice(rs.getInt("price"));
			ar.add(bookDTO);
		}
		rs.close();
		st.close();
		return ar;
	}
	
	//MyPage에서 Book예약취소 화면 보여주기
		public ArrayList<BookDTO> bookCancelList(Connection conn, String id, SearchRow searchRow)throws Exception{
			ArrayList<BookDTO> ar = new ArrayList<BookDTO>();
			String sql="select * from " + 
					"(select rownum R, p.* from " + 
					"(select book_num, id, movie_code , movie_title , theater , auditorium, seat_count, book_date, show_time, "
					+"to_char(view_date, 'yyyy-mm-dd') vd, cancel_date, state, price from book where id=? and state=1 order by book_num desc) p) " + 
					"where R between ? and ?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setInt(2, searchRow.getStartRow());
			st.setInt(3, searchRow.getLastRow());
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				BookDTO bookDTO = new BookDTO();
				bookDTO.setBook_num(rs.getInt("book_num"));
				bookDTO.setId(rs.getString("id"));
				bookDTO.setMovie_code(rs.getString("movie_code"));
				bookDTO.setMovie_title(rs.getString("movie_title"));
				bookDTO.setTheater(rs.getString("theater"));
				bookDTO.setAuditorium(rs.getString("auditorium"));
				bookDTO.setSeat_count(rs.getInt("seat_count"));
				bookDTO.setBook_date(rs.getDate("book_date"));
				bookDTO.setShow_time(rs.getString("show_time"));
				bookDTO.setView_date(rs.getString("vd"));
				bookDTO.setCancel_date(rs.getDate("cancel_date"));
				bookDTO.setState(rs.getInt("state"));
				bookDTO.setPrice(rs.getInt("price"));
				ar.add(bookDTO);
			}
			rs.close();
			st.close();
			return ar;
		}
	public int getBookNum(Connection con) throws Exception {
		int result=0;
		String sql="select book_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		rs.next();
		result=rs.getInt(1);
		
		rs.close();
		st.close();
		
		return result-1;
		
	}
	public int insert(BookDTO bookDTO, Connection con) throws Exception {
		String sql="insert into book values("
				+ "book_seq.nextval,?,?,?,?,?,?,sysdate,?,?,null,0,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, bookDTO.getId());
		st.setString(2, bookDTO.getMovie_code());
		st.setString(3, bookDTO.getMovie_title());
		st.setString(4, bookDTO.getTheater());
		st.setString(5, bookDTO.getAuditorium());
		st.setInt(6, bookDTO.getSeat_count());
		st.setString(7, bookDTO.getShow_time());
		st.setString(8, bookDTO.getView_date());
		st.setInt(9, bookDTO.getPrice());
		
		int result=0;
		result=st.executeUpdate();
		
		st.close();
		return result;
	}
	
}

/*
 * public static void main(String[] args) throws Exception {
 * 
 * int alpha=65; ArrayList<String> a = new ArrayList<String>();
 * ArrayList<String> c = new ArrayList<String>();
 * 
 * for(int i=0;i<12;i++) { a.add(((char)alpha)+""); for(int j=0;j<17;j++) {
 * c.add(a.get(i)+Integer.toString(j+1)); } alpha++; }
 * 
 * for(int i=0;i<c.size();i++) { Connection con = DBConnector.getConnect();
 * String sql="insert into seat values(seat_seq.nextval,null,'동대문','1관',?,1)";
 * PreparedStatement st = con.prepareStatement(sql); st.setString(1, c.get(i));
 * int result=st.executeUpdate();
 * 
 * DBConnector.disConnect(st, con); }
 * 
 * }
 */