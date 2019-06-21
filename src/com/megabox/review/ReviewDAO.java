package com.megabox.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.megabox.page.SearchRow;

public class ReviewDAO{
	public int getTotalCount(SearchRow searchRow, Connection conn) throws Exception {
		int result = 0;
		String sql = "select count(num) from review where " +searchRow.getSearch().getReviewKind() + " like ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt(1);
		
		rs.close();
		st.close();
		
		
		return result;
	}
	
	public int insert(ReviewDTO reviewDTO, Connection conn) throws Exception {
		int result =0;
		String sql = "insert into review values(review_seq.nextval, ?,?,?,sysdate) ";
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, reviewDTO.getMovie_code());
		st.setString(2, reviewDTO.getId());
		st.setString(3, reviewDTO.getContents());
		
		result = st.executeUpdate();
		
		return result;
	}

	public List<ReviewDTO> selectList(SearchRow searchRow, Connection conn) throws Exception {
		List<ReviewDTO> ar = new ArrayList<ReviewDTO>();
		String sql = "select * from "
				+ "(select rownum N, R.* from "
				+"(select * from review where " + searchRow.getSearch().getReviewKind()+" like ? order by num desc) R) "   
				+ "where N between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		st.setInt(2, searchRow.getStartRow());
		st.setInt(3, searchRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		ReviewDTO reviewDTO = null;
		
		while(rs.next()) {
			reviewDTO = new ReviewDTO();
			reviewDTO.setNum(rs.getInt("num"));
			reviewDTO.setMovie_code(rs.getString("movie_code"));
			reviewDTO.setId(rs.getString("id"));
			reviewDTO.setContents(rs.getString("contents"));
			reviewDTO.setReg_date(rs.getDate("reg_date"));
			
			ar.add(reviewDTO);
			
		}
		rs.close();
		st.close();
		
		return ar;
		
	}
	
	
	
}
