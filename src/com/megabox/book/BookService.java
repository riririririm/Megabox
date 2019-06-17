package com.megabox.book;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.seat.SeatDAO;
import com.megabox.seat.SeatDTO;
import com.megabox.util.DBConnector;

import oracle.net.aso.b;
import oracle.net.aso.s;

public class BookService implements Action{
	private BookDAO bookDAO;
	private SeatDAO seatDAO;
	
	public BookService() {
		bookDAO = new BookDAO();
		seatDAO = new SeatDAO();
	}
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		// book DB와 seat DB insert
		ActionForward actionForward = new ActionForward();
		boolean check=true;
		String path="../index.do";
		String command = request.getMethod();
		
		if(command.equals("POST")) {
			BookDTO bookDTO = new BookDTO();
			bookDTO.setId(request.getParameter("id"));
			bookDTO.setMovie_code(request.getParameter("movie_code"));
			bookDTO.setMovie_title(request.getParameter("movie_title"));
			bookDTO.setTheater(request.getParameter("theater"));
			bookDTO.setAuditorium(request.getParameter("auditorium"));
			bookDTO.setSeat_count(Integer.parseInt(request.getParameter("seat_count")));
			bookDTO.setShow_time(request.getParameter("show_time"));
			bookDTO.setView_date(request.getParameter("view_date"));
			bookDTO.setPrice(Integer.parseInt(request.getParameter("price")));
			String[] seats = request.getParameterValues("seat_num"); //좌석번호들 배열저장
			
			System.out.println(bookDTO.getTheater());
			System.out.println(bookDTO.getAuditorium());
			Connection con=null;
			int result=0; int result2=0;
			
			try {
				con = DBConnector.getConnect();
				result= bookDAO.insert(bookDTO, con);
				int book_num=bookDAO.getBookNum(con);
				
				for(int i=0;i<seats.length;i++) {					
					SeatDTO seatDTO = new SeatDTO();
					seatDTO.setBook_num(book_num);
					seatDTO.setTheater(bookDTO.getTheater());
					seatDTO.setAuditorium(bookDTO.getAuditorium());
					seatDTO.setView_date(bookDTO.getView_date());
					seatDTO.setShow_time(bookDTO.getShow_time());
					seatDTO.setSeat_num(seats[i]);
					result2= seatDAO.update(seatDTO,con);
				}
				
				if(result>0 && result2>0) {
					check=false;
					path="../index.do";
				}
				
				
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
			
			
		}
		
		
		actionForward.setCheck(check);
		actionForward.setPath(path);
		
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
