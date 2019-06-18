package com.megabox.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.ActionForward;
import com.megabox.store.StoreService;

/**
 * Servlet implementation class StoreController
 */
@WebServlet("/StoreController")
public class StoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StoreService storeService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreController() {
        super();
        storeService = new StoreService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getPathInfo();
		ActionForward actionForward = new ActionForward();
		
		if(command.equals("/storeReg")) {
			actionForward = storeService.insert(request, response);
		}else if(command.equals("/storeList")) {
			actionForward = storeService.selectList(request, response);
		}else if(command.equals("/storePurchase")) {
			actionForward = storeService.insertStoreHistory(request, response);
		}else if(command.equals("/myModal")) {
			actionForward=storeService.settingAttributes(request,response);
		}else if(command.equals("/myModal2")) {
			actionForward=storeService.settingAttributes2(request,response);
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
