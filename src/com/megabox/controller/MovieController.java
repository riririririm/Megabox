package com.megabox.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.ActionForward;
import com.megabox.movie.MovieService;
import com.megabox.seat.SeatService;

/**
 * Servlet implementation class MovieController
 */
@WebServlet("/MovieController")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MovieService movieService;
    /////
    private SeatService seatService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieController() {
        super();
        movieService = new MovieService();
        ////
        seatService = new SeatService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward actionForward = new ActionForward();
		String command = request.getPathInfo();
		
		if(command.equals("/movieReg")) {
			actionForward = movieService.insert(request, response);
		}else if(command.equals("/movieTimetableAdmin")) {
			actionForward = movieService.selectList2(request, response);
		}else if(command.equals("/movieTimetable")) {
			actionForward = movieService.selectList(request, response);
		}else if(command.equals("/movieViewDate")) {
			actionForward = movieService.searchDateList(request, response);
		}else if(command.equals("/movieShowTime")) {
			actionForward = movieService.searchShowTimeList(request, response);
		}else if(command.equals("/boxoffice")) {
			actionForward = movieService.boxofficeList(request, response);
		}
		//////rim0612
		else if(command.equals("/movieSeat")) {
			actionForward = seatService.selectList(request, response);
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
