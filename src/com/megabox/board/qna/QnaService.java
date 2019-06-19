package com.megabox.board.qna;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.upload.UploadDAO;
import com.megabox.board.BoardDTO;
import com.megabox.page.SearchMakePage;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.megabox.board.qna.QnaDTO;
import com.megabox.upload.UploadDTO;

public class QnaService implements Action {
	private QnaDAO qnaDAO;
	private UploadDAO uploadDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
		uploadDAO = new UploadDAO();
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int curPage=1;
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		SearchMakePage searchMakePage = new SearchMakePage(curPage, kind, search);
		
		//row
		 SearchRow searchRow = searchMakePage.makeRow();
		//page
		 int totalCount=0;
		 Connection con = null;
		try {
			con = DBConnector.getConnection();
			totalCount = qnaDAO.getTotalCount(searchRow, con);
			List<BoardDTO> ar = qnaDAO.selectList(searchRow, con);
			System.out.println(ar.size());
			request.setAttribute("list", ar);
			request.setAttribute("board", "qna");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 SearchPager searchPager = searchMakePage.makePage(totalCount);
		 request.setAttribute("pager", searchPager);
		 
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/qna/qnaList.jsp");
		
		return actionForward;
	}
	
	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		BoardDTO boardDTO = null;
		List<UploadDTO> ar = null;
		Connection con = null;
		try {
			con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			boardDTO = qnaDAO.selectOne(num, con);
			ar = uploadDAO.selectList(num, con);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String path="";
		if(boardDTO != null) {
			request.setAttribute("dto", boardDTO);
			request.setAttribute("upload", ar);
			path = "../WEB-INF/views/qna/qnaSelect.jsp";
		}else {
			request.setAttribute("message", "No Data");
			request.setAttribute("path", "./qnaList");
			path = "../WEB-INF/views/common/result.jsp"; 
		}
		
		actionForward.setCheck(true);
		actionForward.setPath(path);
		return actionForward;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/qna/qnaWrite.jsp");
		String method = request.getMethod();
		if(method.equals("POST")) {
			
			
			
		}
		return actionForward;
	}
	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		
		
		return actionForward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path="";
		boolean check= true;
		//qnaDAO.delete() 이거 호출하기
		
		Connection conn=null;
		BoardDTO boardDTO = new BoardDTO();
		int num = Integer.parseInt(request.getParameter("num"));
		int result = 0;
		try {
			conn = DBConnector.getConnection();
			result = qnaDAO.delete(num, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(result>0) {
			request.setAttribute("message", "삭제성공");
			request.setAttribute("path", "./qnaList");
			check=true;
			path="../WEB-INF/views/common/result.jsp";
		}else {
			request.setAttribute("message", "삭제실패");
			request.setAttribute("path", "./qnaList");
			path="../WEB-INF/views/common/result.jsp";
		}
		
		actionForward.setCheck(true);
		actionForward.setPath(path);
		return actionForward;
	}

}
