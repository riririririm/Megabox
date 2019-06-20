package com.megabox.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;



public class QnaDAO {
	public int getNum() throws Exception {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	public int getTotalCount(SearchRow searchRow, Connection conn) throws Exception {
		int result=0;
		String sql="select count(num) from qna ";
		PreparedStatement st = conn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt(1);
		rs.close();
		st.close();
		return result;
	}
	
	public QnaDTO selectOne(int num, Connection conn) throws Exception {
		QnaDTO qnaDTO = null;
		String sql = "select * from qna where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setPost_pw(rs.getString("post_pw"));
			qnaDTO.setState(rs.getInt("state"));
			qnaDTO.setAdmin_answer(rs.getString("admin_answer"));
		}
		rs.close();
		st.close();
		
		return qnaDTO;
		
	}
	
	public List<QnaDTO> selectList(SearchRow searchRow, Connection conn) throws Exception {
		ArrayList<QnaDTO> ar = new ArrayList<QnaDTO>();
		String sql ="select * from "
				+ "(select rownum R, Q.* from "
				+ "(select * from qna order by num desc ) Q) "
				+ "where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, searchRow.getStartRow());
		st.setInt(2, searchRow.getLastRow());
		ResultSet rs = st.executeQuery();
	//num, title, state, reg_date
		while(rs.next()) {
			QnaDTO qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setPost_pw(rs.getString("post_pw"));
			qnaDTO.setState(rs.getInt("state"));
			qnaDTO.setAdmin_answer(rs.getString("admin_answer"));
			
			
			ar.add(qnaDTO);
		}
		rs.close();
		st.close();
		return ar;
	}
	
	public int insert(QnaDTO qnaDTO, Connection conn) throws Exception {
		int result=0;
		String sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,?,0,0)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, qnaDTO.getWriter());
		st.setString(2, qnaDTO.getTitle());
		st.setString(3, qnaDTO.getContents());
		st.setString(4, qnaDTO.getPost_pw());
	
		result=st.executeUpdate();
		st.close();
		return result;
	}
	
	public int update(QnaDTO qnaDTO, Connection conn) throws Exception {
		int result=0;
		String sql = "update qna set title=?, contents=? where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setInt(3, qnaDTO.getNum());
		result = st.executeUpdate();
		st.close();
		
		return result;
	}
	
	public int delete(int num, Connection conn) throws Exception {
		int result=0;
		String sql="delete qna where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	////////////////////jsh DAO/////////////////////////////////
	//1:1문의 내역 totalCount 전체
	public int QnaTotalCount(Connection conn,String id, SearchRow searchRow)throws Exception{
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
		
		int result=0;
		String sql = "select count(num) from qna where writer=? and title like ? "+subQuery+"";
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
	

}

