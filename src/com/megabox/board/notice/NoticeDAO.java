package com.megabox.board.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.megabox.board.BoardDAO;
import com.megabox.board.BoardDTO;
import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;



public class NoticeDAO implements BoardDAO{

	@Override
	public int getNum() throws Exception {
		int result=0;
		Connection con = DBConnector.getConnect();
		String sql ="select notice_seq.nextval from dual";
		PreparedStatement st =con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return result;
	}

	@Override
	public int getTotalCount(SearchRow searchRow, Connection conn) throws Exception {
		int result=0;
		String sql ="select count(num) from notice where "+searchRow.getSearch().getKind()+" like ?";
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
		NoticeDTO noticeDTO = null;
		String sql = "select title, contents,reg_date from notice where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(num);
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
		}
		rs.close();
		st.close();
		
		return noticeDTO;
	}

	@Override
	public List<BoardDTO> selectList(SearchRow searchRow, Connection conn) throws Exception {
		List<BoardDTO> ar = new ArrayList<BoardDTO>();
		/* String sql = "select num,title,reg_date from notice"; */
		String sql="select * from "
				+ "(select rownum R, N.* from "
				+ "(select num, title, reg_date from notice where "+searchRow.getSearch().getKind()+ " like ? order by num desc)N) "
				+ "where R between ? and ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, "%"+searchRow.getSearch().getSearch()+"%");
		st.setInt(2, searchRow.getStartRow());
		st.setInt(3,searchRow.getLastRow());
		ResultSet rs = st.executeQuery();
		
		
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			ar.add(noticeDTO);
		}
		rs.close();
		st.close();
		
		return ar;
	}

	@Override
	public int insert(BoardDTO boardDTO, Connection conn) throws Exception {
		int result=0;
		
		String sql ="insert into notice values(?,?,?,?, sysdate)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getTitle());
		st.setString(3, boardDTO.getContents());
		st.setString(4, boardDTO.getWriter());
		result = st.executeUpdate();
		st.close();
		return result;
	}
	

	@Override
	public int update(BoardDTO boardDTO, Connection conn) throws Exception {
		int result=0;
		String sql = "update notice set title=?, writer=?, contents=?,reg_date=sysdate where num=?";
		PreparedStatement st =conn.prepareStatement(sql);
		st.setString(1, boardDTO.getTitle());
		st.setString(2, boardDTO.getWriter());
		st.setString(3, boardDTO.getContents());
		st.setInt(4, boardDTO.getNum());
		result = st.executeUpdate();
		st.close();
		
		return result;
	}

	@Override
	public int delete(int num, Connection conn) throws Exception {
		int result = 0;
		String sql = "delete notice where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		st.close();
		return result;
		
		
	}

	

}
