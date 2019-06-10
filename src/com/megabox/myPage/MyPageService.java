package com.megabox.myPage;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.member.MemberDTO;
import com.megabox.store.Store_historyDAO;
import com.megabox.store.Store_historyDTO;
import com.megabox.util.DBConnector;

public class MyPageService implements Action{
	Store_historyDAO store_historyDAO = null;
	public MyPageService() {
		// TODO Auto-generated constructor stub
		store_historyDAO = new Store_historyDAO();
	}
	//myPage Main화면
	public ActionForward myPageMain(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/myPage.jsp";
		boolean check = true;
		
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	
	//BookPage
	public ActionForward bookPage(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/bookPage.jsp";
		boolean check = true;
		
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	
	//myQnA
	public ActionForward myQnA(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/myQnA.jsp";
		boolean check = true;
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	
	//StoprePage
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ArrayList<Store_historyDTO> ar = null;
		
		//session에 있는 ID값 꺼내오기
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String id = memberDTO.getId();
		Connection conn = null;
		try {
			conn = DBConnector.getConnect();
			ar = store_historyDAO.selectList(conn, id);
			request.setAttribute("list", ar);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/myPage/myStorePage.jsp");
			System.out.println(ar.get(1));
		} catch (Exception e) {
			request.setAttribute("msg", "Server Error");
			request.setAttribute("path", "../index.do");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/common/result.jsp");
			e.printStackTrace();
		}
		return actionForward;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

}
