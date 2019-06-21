package com.megabox.community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.megabox.board.BoardDTO;
import com.megabox.page.SearchRow;


public class CommunityDAO {


	public int getNum() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 총 글의 개수
	public int getTotalCount(SearchRow searchRow, Connection conn) throws Exception {
		int result =0;
		String sql = "select count(num) from community where " +searchRow.getSearch().getCommunityKind()+" like ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		rs.close();
		st.close();
				
		return result;
	}


	public BoardDTO selectOne(int num, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	public List<CommunityDTO> selectList(SearchRow searchRow, Connection conn) throws Exception {
		
		List<CommunityDTO> ar = new ArrayList<CommunityDTO>();
		
		String sql = "select * from "
				+"(select rownum R, C.* from "
				+"(select * from community where "+searchRow.getSearch().getCommunityKind()+" like ? order by num desc) C) "
				+"where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		st.setInt(2, searchRow.getStartRow());
		st.setInt(3, searchRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		CommunityDTO communityDTO = null;
		while(rs.next()) {
			
			communityDTO = new CommunityDTO();
			communityDTO.setNum(rs.getInt("num"));
			communityDTO.setWriter(rs.getString("writer"));
			communityDTO.setContents(rs.getString("contents"));
			communityDTO.setReg_date(rs.getDate("reg_date"));
			ar.add(communityDTO);
		}
		rs.close();
		st.close();
		
		
		return ar;
		
	}


	public int insert(CommunityDTO communityDTO, Connection conn) throws Exception {
		int result = 0;
		String sql = "insert into community values(community_seq.nextval,?,?,sysdate)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, communityDTO.getWriter());
		st.setString(2, communityDTO.getContents());
		result = st.executeUpdate();
	
		st.close();
		return result;
	}


	public int update(CommunityDTO communityDTO, Connection conn) throws Exception {
		int result=0;
		String sql = "update community set contents=? where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, communityDTO.getContents());
		st.setInt(2, communityDTO.getNum());
		result=st.executeUpdate();
		
		st.close();
		
		return result;
	}


	public int delete(int num, Connection conn) throws Exception {
		int result = 0;
		String sql = "delete community where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setInt(1, num);
		result = st.executeUpdate();
		st.close();
		
		return result;
	}

}
