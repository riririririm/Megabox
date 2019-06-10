package com.megabox.myPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;

public class MyPageService implements Action{
	//StoprePage
	public ActionForward myStorePage(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/myStorePage.jsp";
		boolean check = true;
		
		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
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
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
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
