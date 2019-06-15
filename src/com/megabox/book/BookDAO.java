package com.megabox.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.megabox.util.DBConnector;
import com.sun.xml.internal.bind.v2.runtime.RuntimeUtil.ToStringAdapter;


public class BookDAO {
	public int getBookNum(Connection con) throws Exception {
		int result=0;
		String sql="select book_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		rs.next();
		result=rs.getInt(1);
		
		rs.close();
		st.close();
		
		return result;
		
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