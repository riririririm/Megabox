package com.megabox.seat;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.book.BookDTO;
import com.megabox.member.MemberDTO;
import com.megabox.movie.MovieDTO;
import com.megabox.util.DBConnector;

public class SeatService implements Action {
	private SeatDAO seatDAO;
	
	public SeatService() {
		// TODO Auto-generated constructor stub
		seatDAO = new SeatDAO();
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// 영화관 좌석표 보이기
		ActionForward actionForward = new ActionForward();
		String command = request.getMethod();
		ArrayList<String> seatInit= seatDAO.initSeat(); 
		ArrayList<Integer> seatStatus = null;
			
		request.setAttribute("seatInit", seatInit);
		
		BookDTO bookDTO = new BookDTO();
		bookDTO.setMovie_title(request.getParameter("movie_title"));
		bookDTO.setMovie_code(request.getParameter("movie_code"));
		bookDTO.setTheater(request.getParameter("theater"));
		bookDTO.setAuditorium(request.getParameter("auditorium"));
		bookDTO.setView_date(request.getParameter("view_date"));
		bookDTO.setShow_time(request.getParameter("show_time"));
		
		System.out.println(bookDTO.getTheater());
		System.out.println(bookDTO.getAuditorium());
		System.out.println(bookDTO.getView_date());
		System.out.println(bookDTO.getShow_time());
		request.setAttribute("bookDto", bookDTO);
		
		Connection con =null;
		try {
			con=DBConnector.getConnect();
			seatStatus =seatDAO.selectStateList(bookDTO,con);
			request.setAttribute("seatStatus", seatStatus);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//int result
		
		
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
		ActionForward actionForward = new ActionForward();
		String command = request.getMethod();
		ArrayList<String> seatInit= new ArrayList<String>();
		BookDTO bookDTO = new BookDTO();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		bookDTO = new BookDTO();
		bookDTO.setId(memberDTO.getId());
		bookDTO.setMovie_code(request.getParameter("movie_code"));
		bookDTO.setMovie_title(request.getParameter("movie_title"));
		bookDTO.setTheater(request.getParameter("theater"));
		bookDTO.setAuditorium(request.getParameter("auditorium"));
		bookDTO.setView_date(request.getParameter("view_date"));
		bookDTO.setShow_time(request.getParameter("show_time"));
		
		int adult_count = Integer.parseInt(request.getParameter("adult_count"));
		int teen_count = Integer.parseInt(request.getParameter("teen_count"));
		int children_count = Integer.parseInt(request.getParameter("children_count"));
		int other_count = Integer.parseInt(request.getParameter("other_count"));
		int total_price = adult_count*10000 + teen_count*9000 + children_count*8000 + other_count*7000;
		bookDTO.setPrice(total_price);
		bookDTO.setSeat_count(adult_count+teen_count+children_count+other_count);
		String[] seats= request.getParameterValues("seat_no");
		
		System.out.println(seats.length);
		for(int i=0;i<seats.length;i++)
			System.out.println(seats[i]);
		
		request.setAttribute("movie", bookDTO);
		request.setAttribute("seat_num", seats);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/movie/movieReadyPay.jsp");
		
		if(command.equals("POST")) {
			
		}
		return actionForward;
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
