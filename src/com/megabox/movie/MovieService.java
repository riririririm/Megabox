package com.megabox.movie;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.util.DBConnector;

public class MovieService implements Action{
	private MovieDAO movieDAO;
	
	public MovieService() {
		movieDAO = new MovieDAO();
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		Connection con=null;
		ArrayList<MovieDTO> mar =new ArrayList<MovieDTO>();
		ArrayList<ShowTimeDTO> sar = new ArrayList<ShowTimeDTO>();
		try {
			con = DBConnector.getConnect();
			mar= movieDAO.selectList(con);
			for(int i=0;i<mar.size();i++) {
				sar= movieDAO.selectShowTimeList(mar.get(i).getMovie_code(),con);			
			}
			
			request.setAttribute("movie", mar);
			request.setAttribute("showtime", sar);
			
			String command = request.getPathInfo();
			if(command.equals("/movieTimetableAdmin")) {
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/views/movie/movieTimetableAdmin.jsp");				
			}else if(command.equals("/movieTimetable")) {
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/views/movie/movieTimetable.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "Sever Error");
			request.setAttribute("path", "../index.do");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/common/result.jsp");
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
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
		boolean check=true;
		String path="../WEB-INF/views/movie/movieReg.jsp"; //영화상영리스트로 나중에 변경하기
		String method = request.getMethod();
		
		if(method.equals("POST")) {
			Connection con=null;
			MovieDTO movieDTO = new MovieDTO();
			int result1, result2=0;
			
			try {
				con = DBConnector.getConnect();
				
				movieDTO.setMovie_code(request.getParameter("movie_code"));
				movieDTO.setMovie_title(request.getParameter("movie_title"));
				movieDTO.setMovie_kind(request.getParameter("movie_kind"));
				movieDTO.setTheater(request.getParameter("theater"));
				movieDTO.setAuditorium(request.getParameter("auditorium"));
				movieDTO.setView_date(request.getParameter("view_date"));
				String[] show_times = request.getParameterValues("show_time");
				
				result1 = movieDAO.insert(movieDTO, con);
				
				ShowTimeDTO showTimeDTO=new ShowTimeDTO();
				for(int i=0;i<show_times.length;i++) {
					showTimeDTO.setMovie_code(movieDTO.getMovie_code());
					showTimeDTO.setShow_time(show_times[i]);
					result2 = movieDAO.insertShowTime(showTimeDTO, con);
				}
				
				
				if(result1>0 && result2>0) {
					//영화 상영시간표 등록 성공시
					request.setAttribute("message", "영화 상영정보를 등록했습니다.");
					request.setAttribute("path", "./movieTimetableAdmin");
					check=true;
					path="../WEB-INF/views/common/result.jsp";
				}else {
					request.setAttribute("message", "영화 상영정보 등록 실패.");
					request.setAttribute("path", "./movieTimetableAdmin");
					check = true;
					path = "../WEB-INF/views/common/result.jsp";
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
		}//end of post
		
		
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
