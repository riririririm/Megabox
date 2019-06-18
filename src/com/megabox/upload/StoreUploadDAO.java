package com.megabox.upload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.megabox.util.DBConnector;


public class StoreUploadDAO {
	public int delete(int pnum, Connection conn) throws Exception {
		int result=0;
		
		String sql="delete storeUpload where pnum=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, pnum);
		result = pst.executeUpdate();
		
		pst.close();
		
		return result;
	}

	public int insert(StoreUploadDTO uploadDTO, Connection conn) throws Exception {
		int result =0;
		
		String sql = "insert into storeUpload values(storeUpload_seq.nextval, ?,?,?)";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, uploadDTO.getNum());
		pst.setString(2, uploadDTO.getOname());
		pst.setString(3, uploadDTO.getFname());
		
		result = pst.executeUpdate();
		
		pst.close();
		
		return result;
	}
	
	public StoreUploadDTO selectOne(int num) throws Exception {
		StoreUploadDTO uploadDTO = null;
		Connection conn = DBConnector.getConnect();
		String sql = "select * from storeUpload where num=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			uploadDTO = new StoreUploadDTO();
			uploadDTO.setPnum(rs.getInt("pnum"));
			uploadDTO.setNum(rs.getInt("num"));
			uploadDTO.setOname(rs.getString("oname"));
			uploadDTO.setFname(rs.getString("fname"));
		}
		DBConnector.disConnect(rs, pst, conn);
		return uploadDTO;
	}
	
	//selectList
		public List<StoreUploadDTO> selectList(Connection con) throws Exception{
			ArrayList<StoreUploadDTO> ar = new ArrayList<StoreUploadDTO>();
			String sql = "select * from storeUpload";
			PreparedStatement st = con.prepareStatement(sql);
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				StoreUploadDTO uploadDTO = new StoreUploadDTO();
				uploadDTO.setPnum(rs.getInt("pnum"));
				uploadDTO.setNum(rs.getInt("num"));
				uploadDTO.setOname(rs.getString("oname"));
				uploadDTO.setFname(rs.getString("fname"));
				ar.add(uploadDTO);
			}
			rs.close();
			st.close();
			return ar;
		}
}
