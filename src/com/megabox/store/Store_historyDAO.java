package com.megabox.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.megabox.page.SearchRow;


public class Store_historyDAO {
	//getTotalCountCancel
	public int getTotalCountCancel(Connection conn, String id)throws Exception{
		int result = 0;
		String sql = "select count(history_num) from store_history where state=1 and id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(history_num)");
		rs.close();
		st.close();
		return result;
	}
	//getTotalCount
	public int getTotalCount(Connection conn, String id) throws Exception{
		int result = 0;
		String sql = "select count(history_num) from store_history where state=0 and id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(history_num)");
		rs.close();
		st.close();
		return result;
	}
	//store 구매취소 update
	public int canceUpdate(Connection conn, int history_num)throws Exception {
		int result = 0;
		String sql = "update store_history set state = 1, cancel_date=sysdate where history_num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, history_num);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	public ArrayList<Store_historyDTO> buyList(Connection conn, String id, SearchRow searchRow) throws Exception{
		ArrayList<Store_historyDTO> ar = new ArrayList<Store_historyDTO>();
		Store_historyDTO store_historyDTO = null;
		String sql = "select * from "
					+"(select rownum R, p.* from "
					+"(select * from store_history where id=? and state=0 order by history_num desc) p)"
					+"where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setInt(2, searchRow.getStartRow());
		st.setInt(3, searchRow.getLastRow());
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

	public ArrayList<Store_historyDTO> cancelList(Connection conn, String id, SearchRow searchRow2) throws Exception{
		ArrayList<Store_historyDTO> ar = new ArrayList<Store_historyDTO>();
		Store_historyDTO store_historyDTO = null;
		String sql = "select * from "
				+"(select rownum R, p.* from "
				+"(select * from store_history where id=? and state=1 order by cancel_date desc) p)"
				+"where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setInt(2, searchRow2.getStartRow());
		st.setInt(3, searchRow2.getLastRow());
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
