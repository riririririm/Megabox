package com.megabox.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.megabox.util.DBConnector;

public class StoreDAO {

	//insert
	public int insert(StoreDTO storeDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		int result=0;
		
		String sql = "insert into store values(store_num_seq.nextval,?,?,?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, storeDTO.getStore_category());
		st.setString(2, storeDTO.getStore_name());
		st.setString(3, storeDTO.getStore_theater());
		st.setString(4, storeDTO.getStore_noTheater());
		st.setInt(5, storeDTO.getStore_period());
		st.setInt(6, storeDTO.getStore_count());
		st.setString(7, storeDTO.getStore_cancel());
		st.setInt(8, storeDTO.getStore_price());
		
		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
	}
	//update
	//delete
	//selectOne
	//selectList
	public ArrayList<StoreDTO> selectList() throws Exception{
		ArrayList<StoreDTO> ar=new ArrayList<StoreDTO>();
		
		Connection con = DBConnector.getConnect();
		String sql="select * from store";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		StoreDTO storeDTO = null;
		while(rs.next()) {
			storeDTO = new StoreDTO();
			storeDTO.setStore_num(rs.getInt("store_num"));
			storeDTO.setStore_category(rs.getString("store_category"));
			storeDTO.setStore_name(rs.getString("store_name"));
			storeDTO.setStore_theater(rs.getString("store_theater"));
			storeDTO.setStore_noTheater(rs.getString("store_noTheater"));
			storeDTO.setStore_period(rs.getInt("store_period"));
			storeDTO.setStore_count(rs.getInt("store_count"));
			storeDTO.setStore_cancel(rs.getString("store_cancel"));
			storeDTO.setStore_price(rs.getInt("store_price"));
			ar.add(storeDTO);
			}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
