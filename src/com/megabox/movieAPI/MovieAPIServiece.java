package com.megabox.movieAPI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.ActionForward;



public class MovieAPIServiece {
	private MovieApiDAO movieApiDAO;
	
	public MovieAPIServiece() {
		movieApiDAO = new MovieApiDAO();
	}
	
	public ActionForward boxofficeList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/movieAPI/boxoffice.jsp");
		return actionForward;
	}
}