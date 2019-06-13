package com.megabox.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QnaDAO {
	//1:1문의 내역
	public ArrayList<QnaDTO> myQna(Connection conn, String id, QnaDTO qnaDTO)throws Exception {
		ArrayList<QnaDTO> ar = new ArrayList<QnaDTO>();
		
		String sql = "select * from qna where writer=? and title like ? and state= ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setString(2, "like");
		st.setInt(3, qnaDTO.getState());
		
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
