package com.megabox.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.megabox.util.DBConnector;

public class StoreDAO {

	//insert
	public int insert(StoreDTO storeDTO, Connection con) throws Exception {
		int result=0;
		
		String sql = "insert into store values (store_num_seq.nextval,?,?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, storeDTO.getStore_category());
		st.setString(2, storeDTO.getStore_name());
		st.setString(3, storeDTO.getStore_theater());
		st.setInt(4, storeDTO.getStore_period());
		st.setInt(5, storeDTO.getStore_count());
		st.setString(6, storeDTO.getStore_cancel());
		st.setInt(7, storeDTO.getStore_price());
		
		result = st.executeUpdate();
		st.close();
		return result;
		
	}
	//update
	//delete
	//searchStoreNum
	public int searchStoreNum(String store_name, Connection con) throws Exception {
		int store_num=0;
		String sql = "select store_num from store where store_name=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, store_name);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next())
			store_num = rs.getInt("store_num");
		
		return store_num;
	}
	
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
			//storeDTO.setStore_noTheater(rs.getString("store_noTheater"));
			storeDTO.setStore_period(rs.getInt("store_period"));
			storeDTO.setStore_count(rs.getInt("store_count"));
			storeDTO.setStore_cancel(rs.getString("store_cancel"));
			storeDTO.setStore_price(rs.getInt("store_price"));
			ar.add(storeDTO);
			}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	//selectListByCategory
	public ArrayList<StoreDTO> selectListByCategory(String category) throws Exception {
		ArrayList<StoreDTO> ar=new ArrayList<StoreDTO>();
		
		Connection con = DBConnector.getConnect();
		String sql="select * from store where store_category=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, category);
		ResultSet rs = st.executeQuery();
		
		StoreDTO storeDTO = null;
		while(rs.next()) {
			storeDTO = new StoreDTO();
			storeDTO.setStore_num(rs.getInt("store_num"));
			storeDTO.setStore_category(rs.getString("store_category"));
			storeDTO.setStore_name(rs.getString("store_name"));
			storeDTO.setStore_theater(rs.getString("store_theater"));
			//storeDTO.setStore_noTheater(rs.getString("store_noTheater"));
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
