package com.megabox.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.ActionForward;
import com.megabox.member.MemberService;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private MemberService memberService;
    public MemberController() {
        super();
        memberService = new MemberService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getPathInfo();
		ActionForward actionForward = null;
		if(command.equals("/memberCheck")) {
			actionForward = memberService.memberCheck(request, response);
		}else if(command.equals("/memberJoin")) {
			actionForward = memberService.insert(request, response);
		}else if(command.equals("/memberDupl")){
			actionForward = memberService.idCheck(request, response);
		}else if(command.equals("/memberLogin")) {
			actionForward = memberService.selectOne(request, response);
		}else if(command.equals("/memberLogout")) {
			actionForward = memberService.logout(request, response);
		}else if(command.equals("/myPersonalPage")) {
			actionForward = memberService.pwcheck(request, response);
		}else if(command.equals("/myPersonalUpdate")) {
			actionForward = memberService.update(request, response);
		}else if(command.equals("/dropMember")) {
			actionForward = memberService.delete(request, response);
		}else if(command.equals("/myPwChange")) {
			actionForward = memberService.myPwChange(request, response);
		}
		if(actionForward.isCheck()) {
			RequestDispatcher view = request.getRequestDispatcher(actionForward.getPath());
			view.forward(request, response);
		}else {
			response.sendRedirect(actionForward.getPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
