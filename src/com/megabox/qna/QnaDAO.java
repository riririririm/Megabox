package com.megabox.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.megabox.page.SearchRow;

public class QnaDAO {
	//1:1 문의 
	
	//1:1문의 내역 totalCount (kind)
	public int QnaTotalKind(Connection conn, SearchRow searchRow, String id)throws Exception{
		int result = 0;
		String sql = "select count(num) from qna where state=? and writer=? and title like ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, searchRow.getSearch().getKind());
		st.setString(2, id);
		st.setString(3, "%"+searchRow.getSearch().getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(num)");
		rs.close();
		st.close();
		return result;
	}
	//1:1문의 내역 totalCount 전체
	public int QnaTotalCount(Connection conn,String id, SearchRow searchRow)throws Exception{
		int result=0;
		String sql = "select count(num) from qna where writer=? and title like ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setString(2, "%"+searchRow.getSearch().getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(num)");
		rs.close();
		st.close();
		return result;
	}
	
	//1:1문의 내역 totalCount 전체
	public int QnaTotalCountKind(Connection conn,String id, SearchRow searchRow)throws Exception{
		int result=0;
		String sql = "select count(num) from qna where writer=? and title like ? ";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setString(2, "%"+searchRow.getSearch().getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt("count(num)");
		rs.close();
		st.close();
		return result;
	}
	//1:1문의 내역
	public ArrayList<QnaDTO> myQnaList(Connection conn, String id, SearchRow searchRow)throws Exception {
		String subQuery = "";
		if(searchRow.getSearch().getKind()==null) {
			subQuery="";
		}else if(searchRow.getSearch().getKind().equals("no")) {
			subQuery = "and state='0'";
		}else if(searchRow.getSearch().getKind().equals("ok")){
			subQuery = "and state='1'";
		}else {
			subQuery = "";
		}
		
		
		ArrayList<QnaDTO> ar = new ArrayList<QnaDTO>();
		String sql = "select * from " 
				+"(select rownum R, p.* from " 
				+"(select * from qna where writer=? and title like ? "+subQuery+" order by num desc) p) " 
				+"where R between ? and ?";
		
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setString(2, "%"+searchRow.getSearch().getSearch()+"%");
		st.setInt(3, searchRow.getStartRow());
		st.setInt(4, searchRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		
		QnaDTO qna = null;
		while(rs.next()) {
			qna = new QnaDTO();
			qna.setNum(rs.getInt("num"));
			qna.setWriter(rs.getString("writer"));
			qna.setTitle(rs.getString("title"));
			qna.setContents(rs.getString("contents"));
			qna.setReg_date(rs.getDate("reg_date"));
			qna.setPost_pw(rs.getString("post_pw"));
			qna.setState(rs.getInt("state"));
			qna.setAdmin_answer(rs.getString("admin_answer"));
			ar.add(qna);
		}
		
		rs.close();
		st.close();
		return ar;
	}
	
	//1:1문의 내역 전체
		public ArrayList<QnaDTO> dd(Connection conn, String id, SearchRow searchRow)throws Exception {
			ArrayList<QnaDTO> ar = new ArrayList<QnaDTO>();
			
			String sql = "select * from "
					+"(select rownum R, p.* from "
					+"(select * from qna where writer=?  and title like ? "+searchRow.getSearch().getKind()+" order by num desc) p) "
					+"where R between ? and ?";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, id);
			st.setString(2, "%"+searchRow.getSearch().getSearch()+"%");
			st.setInt(3, searchRow.getStartRow());
			st.setInt(4, searchRow.getLastRow());
			
			ResultSet rs = st.executeQuery();
			
			QnaDTO qna = null;
			while(rs.next()) {
				qna = new QnaDTO();
				qna.setNum(rs.getInt("num"));
				qna.setWriter(rs.getString("writer"));
				qna.setTitle(rs.getString("title"));
				qna.setContents(rs.getString("contents"));
				qna.setReg_date(rs.getDate("reg_date"));
				qna.setPost_pw(rs.getString("post_pw"));
				qna.setState(rs.getInt("state"));
				qna.setAdmin_answer(rs.getString("admin_answer"));
				ar.add(qna);
			}
			
			rs.close();
			st.close();
			return ar;
		}
}

