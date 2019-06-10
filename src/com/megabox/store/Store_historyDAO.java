package com.megabox.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import oracle.net.aso.h;

public class Store_historyDAO {

	public ArrayList<Store_historyDTO> selectList(Connection conn, String id) throws Exception{
		ArrayList<Store_historyDTO> ar = new ArrayList<Store_historyDTO>();
		Store_historyDTO store_historyDTO = null;
		String sql = "select * from store_history where id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			store_historyDTO = new Store_historyDTO();
			store_historyDTO.setHistory_num(rs.getInt("history_num"));
			store_historyDTO.setId(rs.getString("id"));
			store_historyDTO.setCategory(rs.getString("category"));
			store_historyDTO.setStore_name(rs.getString("store_name"));
			store_historyDTO.setBuy_count(rs.getInt("buy_count"));
			store_historyDTO.setBuy_date(rs.getDate("buy_date"));
			store_historyDTO.setCancel_date(rs.getDate("cancel_date"));
			store_historyDTO.setExpiry_date(rs.getDate("expiry_date"));
			store_historyDTO.setPrice(rs.getInt("price"));
			store_historyDTO.setState(rs.getInt("state"));
			ar.add(store_historyDTO);
		}
		rs.close();
		st.close();
		return ar;
	}
	
	//insert
	public int insert(Store_historyDTO historyDTO, int period, Connection con) throws Exception {
		int result=0;
		String sql = "insert into store_history values(store_history_seq.nextval,?,?,?,?,sysdate,null,add_months(sysdate,?),?,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, historyDTO.getId());
		st.setString(2, historyDTO.getCategory());
		st.setString(3, historyDTO.getStore_name());
		st.setInt(4, historyDTO.getBuy_count());
		st.setInt(5, period);
		st.setInt(6, historyDTO.getPrice());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}

}
