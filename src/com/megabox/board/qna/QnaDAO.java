package com.megabox.board.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.megabox.board.BoardDAO;
import com.megabox.board.BoardDTO;
import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;

public class QnaDAO implements BoardDAO {

	@Override
	public int getNum() throws Exception {
		int result=0;
		Connection con = DBConnector.getConnection();
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}

	@Override
	public int getTotalCount(SearchRow searchRow, Connection conn) throws Exception {
		int result=0;
		String sql="select count(num) from qna where "+searchRow.getSearch().getKind()+" like ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		result = rs.getInt(1);
		rs.close();
		st.close();
		return result;
	}

	@Override
	public BoardDTO selectOne(int num, Connection conn) throws Exception {
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
			qnaDTO.setState(rs.getString("state"));
			qnaDTO.setAdmin_answer(rs.getString("admin_answer"));
		}
		rs.close();
		st.close();
		
		return qnaDTO;
		
	}

	@Override
	public List<BoardDTO> selectList(SearchRow searchRow, Connection conn) throws Exception {
		ArrayList<BoardDTO> ar = new ArrayList<BoardDTO>();
		String sql ="select * from "
				+ "(select rownum R, Q.* from "
				+ "(select * from qna where "+searchRow.getSearch().getKind()+" like ?) Q) "
				+ "where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		st.setInt(2, searchRow.getStartRow());
		st.setInt(3, searchRow.getLastRow());
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
			qnaDTO.setState(rs.getString("state"));
			qnaDTO.setAdmin_answer(rs.getString("admin_answer"));
			
			
			ar.add(qnaDTO);
		}
		rs.close();
		st.close();
		return ar;
	}

	@Override
	public int insert(BoardDTO boardDTO, Connection conn) throws Exception {
		QnaDTO qnaDTO = new QnaDTO();
		int result=0;
		String sql = "insert into qna values(?,?,?,?,sysdate,?,?,?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getWriter());
		st.setString(3, boardDTO.getTitle());
		st.setString(4, boardDTO.getContents());
		st.setString(5, qnaDTO.getPost_pw());
		st.setString(6, qnaDTO.getState());
		st.setString(7, qnaDTO.getAdmin_answer());
		result=st.executeUpdate();
		st.close();
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num, Connection conn) throws Exception {
		int result=0;
		String sql="delete qna where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		st.close();
		return result;
	}

}
