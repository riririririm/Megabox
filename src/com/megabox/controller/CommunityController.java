package com.megabox.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.ActionForward;
import com.megabox.community.CommunityDAO;
import com.megabox.community.CommunityService;

/**
 * Servlet implementation class CommController
 */
@WebServlet("/CommController")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private CommunityService communityService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityController() {
        super();
        communityService= new CommunityService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getPathInfo();
		ActionForward actionForward = null;
		
		if(command.equals("/communityList")) {
			actionForward = communityService.selectList(request, response);
		} else if(command.equals("/communityWrite")) {
			actionForward = communityService.insert(request, response);
		} else if(command.equals("/communityUpdate")) {
			actionForward = communityService.update(request, response);
		} else if(command.equals("/communityDelete")) {
			actionForward = communityService.delete(request, response);
		}
		
		//check 가 true이면
		if(actionForward.isCheck()) {
			RequestDispatcher view = request.getRequestDispatcher(actionForward.getPath());
			view.forward(request, response);
			// forward로 전송
		} else {
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
