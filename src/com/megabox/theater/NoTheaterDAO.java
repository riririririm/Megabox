package com.megabox.theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoTheaterDAO {
	
	//selectListByNum
	public ArrayList<NoTheaterDTO> selectListByNum(int store_num, Connection con) throws Exception {
		ArrayList<NoTheaterDTO> ar = new ArrayList<NoTheaterDTO>();
		String sql = "select * from noTheater where store_num=?";

		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, store_num);

		ResultSet rs = st.executeQuery();

		NoTheaterDTO noTheaterDTO = null;
		while (rs.next()) {
			noTheaterDTO = new NoTheaterDTO();
			noTheaterDTO.setStore_num(rs.getInt("store_num"));
			noTheaterDTO.setNoTheater_num(rs.getInt("notheater_num"));
			noTheaterDTO.setTheater_name(rs.getString("theater_name"));
			ar.add(noTheaterDTO);
		}

		rs.close();
		st.close();

		return ar;
	}

	//selectList
	public ArrayList<NoTheaterDTO> selectList(Connection con) throws Exception {
		ArrayList<NoTheaterDTO> ar = new ArrayList<NoTheaterDTO>();
		String sql = "select * from noTheater";
		
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		NoTheaterDTO noTheaterDTO = null;
		while(rs.next()) {
			noTheaterDTO = new NoTheaterDTO();
			noTheaterDTO.setNoTheater_num(rs.getInt("noTheater_num"));
			noTheaterDTO.setTheater_name(rs.getString("theater_name"));
			noTheaterDTO.setStore_num(rs.getInt("store_num"));
			ar.add(noTheaterDTO);
		}
		
		return ar;
	}
	
	
	
	public int insert(NoTheaterDTO noTheaterDTO, Connection con) throws Exception {
		int result=0;
		String sql = "insert into noTheater values(noTheater_seq.nextval, ?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, noTheaterDTO.getStore_num());
		st.setString(2,noTheaterDTO.getTheater_name());
		
		result = st.executeUpdate();
		
		st.close();	
		
		return result;
	}
	
	public int delete(int store_num, Connection con) throws Exception {
		int result=0;
		String sql = "delete noTheater where store_num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, store_num);
		
		result = st.executeUpdate();
		
		st.close();	
		
		return result;
	}
}
