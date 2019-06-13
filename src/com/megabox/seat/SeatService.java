package com.megabox.seat;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.book.BookDTO;
import com.megabox.movie.MovieDTO;

public class SeatService implements Action {

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// 영화관 좌석표 보이기
		ActionForward actionForward = new ActionForward();
		String command = request.getMethod();
		ArrayList<String> seatInit= new ArrayList<String>();
		int alpha=65;
		for(int i=1;i<13;i++) {
			seatInit.add(((char)alpha)+"");
			alpha++;
		}
		
		request.setAttribute("seatInit", seatInit);
		
		BookDTO bookDTO = new BookDTO();
		bookDTO.setMovie_title(request.getParameter("movie_title"));
		bookDTO.setMovie_code(request.getParameter("movie_code"));
		bookDTO.setTheater(request.getParameter("theater"));
		bookDTO.setAuditorium(request.getParameter("auditorium"));
		bookDTO.setView_date(request.getParameter("view_date"));
		bookDTO.setShow_time(request.getParameter("show_time"));
		
		request.setAttribute("bookDto", bookDTO);
		
		if(command.equals("post")) {
//			BookDTO bookDTO = new BookDTO();
//			bookDTO.setMovie_title(request.getParameter("movie_title"));
//			bookDTO.setMovie_code(request.getParameter("movie_code"));
//			bookDTO.setTheater(request.getParameter("theater"));
//			bookDTO.setAuditorium(request.getParameter("auditorium"));
//			bookDTO.setView_date(request.getParameter("view_date"));
//			bookDTO.setShow_time(request.getParameter("show_time"));
			
			
		}
		
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/movie/movieSeat.jsp");
		return actionForward;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
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
