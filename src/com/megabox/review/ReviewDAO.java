package com.megabox.review;

import java.sql.Connection;
import java.util.List;

import com.megabox.board.BoardDAO;
import com.megabox.board.BoardDTO;
import com.megabox.page.SearchRow;

public class ReviewDAO implements BoardDAO{

	@Override
	public int getTotalCount(SearchRow searchRow, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardDTO> selectList(SearchRow searchRow, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(BoardDTO boardDTO, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardDTO boardDTO, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int num, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNum() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO selectOne(int num, Connection conn) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
