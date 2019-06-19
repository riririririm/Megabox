package com.megabox.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.megabox.util.DBConnector;

public class StoreDAO {
	//0618
	public int getNum(Connection con) throws Exception {
		int result=0;
		
		String sql ="select store_num_seq.nextval from dual";
		PreparedStatement st =con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		rs.close();
		st.close();
		return result;
	}

	//insert
	public int insert(StoreDTO storeDTO, Connection con) throws Exception {
		int result=0;
		
		String sql = "insert into store values (?,?,?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, storeDTO.getStore_num());
		st.setString(2, storeDTO.getStore_category());
		st.setString(3, storeDTO.getStore_name());
		st.setString(4, storeDTO.getStore_theater());
		st.setInt(5, storeDTO.getStore_period());
		st.setInt(6, storeDTO.getStore_count());
		st.setString(7, storeDTO.getStore_cancel());
		st.setInt(8, storeDTO.getStore_price());
		
		result = st.executeUpdate();
		st.close();
		return result;
		
	}
	//update
	public int update(StoreDTO storeDTO, Connection con) throws Exception {
		int result=0;
		String sql = "update store set store_category=?, store_name=?, store_period=?, "
				+ "store_count=?, store_cancel=?, store_price=? where store_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, storeDTO.getStore_category());
		st.setString(2, storeDTO.getStore_name());
		st.setInt(3, storeDTO.getStore_period());
		st.setInt(4, storeDTO.getStore_count());
		st.setString(5, storeDTO.getStore_cancel());
		st.setInt(6, storeDTO.getStore_price());
		st.setInt(7, storeDTO.getStore_num());
		
		result=st.executeUpdate();
		st.close();
		return result;
	}
	//searchStoreNum
	public int searchStoreNum(String store_name, Connection con) throws Exception {
		int store_num=0;
		String sql = "select store_num from store where store_name=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, store_name);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next())
			store_num = rs.getInt("store_num");
		
		rs.close();
		st.close();
		return store_num;
	}
	
	//selectOne
	public StoreDTO selectOne(int store_num, Connection con) throws Exception{
		String sql="select * from store where store_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, store_num);
		ResultSet rs = st.executeQuery();
		
		StoreDTO storeDTO = null;
		if(rs.next()) {
			storeDTO = new StoreDTO();
			storeDTO.setStore_num(rs.getInt("store_num"));
			storeDTO.setStore_category(rs.getString("store_category"));
			storeDTO.setStore_name(rs.getString("store_name"));
			storeDTO.setStore_period(rs.getInt("store_period"));
			storeDTO.setStore_count(rs.getInt("store_count"));
			storeDTO.setStore_cancel(rs.getString("store_cancel"));
			storeDTO.setStore_price(rs.getInt("store_price"));
			
		}
		rs.close();
		st.close();
		return storeDTO;
	}
	
	//selectList
	public ArrayList<StoreDTO> selectList(Connection con) throws Exception{
		ArrayList<StoreDTO> ar=new ArrayList<StoreDTO>();
	
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
		rs.close();
		st.close();
		return ar;
	}
	
	//selectListByCategory
	public ArrayList<StoreDTO> selectListByCategory(String category, Connection con) throws Exception {
		ArrayList<StoreDTO> ar=new ArrayList<StoreDTO>();
	
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
		rs.close();
		st.close();
		return ar;
	}
	
	public int delete(int store_num, Connection con) throws Exception {
		int result=0;
		String sql="delete store where store_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, store_num);
		result = st.executeUpdate();
		
		st.close();
		return result;
	}
	
}