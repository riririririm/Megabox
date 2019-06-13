package com.megabox.movie;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.theater.TheaterDAO;
import com.megabox.theater.TheaterDTO;
import com.megabox.util.DBConnector;

public class MovieService implements Action{
	private MovieDAO movieDAO;
	private TheaterDAO theaterDAO;
	
	public MovieService() {
		movieDAO = new MovieDAO();
		theaterDAO =new TheaterDAO();
	}
	/////////////////////////////////////////////////////////////////////////////////////////
	//유라
	public ActionForward boxofficeList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/movie/boxoffice.jsp");
		return actionForward;
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////
	public ActionForward searchShowTimeList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		Connection con=null;
		ArrayList<String> show_times = new ArrayList<String>();
		//
		ArrayList<AudiShowDTO> aud = new ArrayList<AudiShowDTO>();
		try {
			con = DBConnector.getConnect();
			String movie_title = request.getParameter("movie_title");
			String theater = request.getParameter("theater");
			String view_date = request.getParameter("view_date");
			
			//show_times = movieDAO.searchShowTimeList(movie_title, theater,view_date,con);
			aud= movieDAO.searchShowTimeList(movie_title, theater,view_date,con);
			System.out.println("////////////////////"+show_times.size());
			System.out.println(movie_title);
			System.out.println(theater);
			System.out.println(view_date);
			request.setAttribute("show_times", aud);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/common/showTimeList.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return actionForward;
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	public ActionForward selectList2(HttpServletRequest request, HttpServletResponse response) {
		//admin용
		ActionForward actionForward = new ActionForward();
		
		Connection con=null;
		ArrayList<MovieDTO> mar =new ArrayList<MovieDTO>();
		ArrayList<ShowTimeDTO> sar = new ArrayList<ShowTimeDTO>();
		ArrayList<ArrayList<ShowTimeDTO>>ssar = new ArrayList<ArrayList<ShowTimeDTO>>();
		
		ArrayList<TheaterDTO> theaters = new ArrayList<TheaterDTO>();
		
		try {
			con = DBConnector.getConnect();
			mar= movieDAO.selectList(con); //상영중인 영화리스트 가져오기
			for(int i=0;i<mar.size();i++) {
				//각 영화의 상영시간리스트 가져오기
				//sar= movieDAO.selectShowTimeList(mar.get(i).getMovie_code(),con);
				sar= movieDAO.selectShowTimeList(mar.get(i).getNum(),con);
				ssar.add(sar);
			}
			theaters = theaterDAO.selectList(con);//극장리스트
			request.setAttribute("movie", mar);
			request.setAttribute("theater", theaters);
			request.setAttribute("showtime", ssar);
		
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/movie/movieTimetableAdmin.jsp");				
			
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
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	public ActionForward searchDateList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		ArrayList<String> dates = new ArrayList<String>();
		Connection con=null;
		try {
			con = DBConnector.getConnect();
			dates = movieDAO.searchDateList(request.getParameter("movie_title"),request.getParameter("theater"), con);
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
		System.out.println(request.getParameter("movie_title"));
		System.out.println(request.getParameter("theater"));
		request.setAttribute("dates", dates);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/common/dateList.jsp");
		return actionForward;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		//actionForward.setCheck(true);
		//actionForward.setPath("../WEB-INF/views/movie/movieTimetable.jsp");
		
		Connection con=null;
		ArrayList<String> tar = new ArrayList<String>();
		ArrayList<MovieDTO> mar =new ArrayList<MovieDTO>();
		ArrayList<ShowTimeDTO> sar = new ArrayList<ShowTimeDTO>();
		ArrayList<ArrayList<ShowTimeDTO>>ssar = new ArrayList<ArrayList<ShowTimeDTO>>();
		ArrayList<String> all_dates = new ArrayList<String>();
		ArrayList<TheaterDTO> theaters = new ArrayList<TheaterDTO>();
		ArrayList<String> movie_codes = new ArrayList<String>();
		
		
		try {
			con = DBConnector.getConnect();
			tar = movieDAO.selectMovieTitleList(con);
			mar= movieDAO.selectList(con); //상영중인 영화리스트 가져오기
			for(int i=0;i<tar.size();i++) {
				//각 영화의 상영시간리스트 가져오기
				//sar= movieDAO.selectShowTimeList(mar.get(i).getMovie_code(),con);	
				movie_codes.add(movieDAO.searchMovieCode(tar.get(i), con));
				sar= movieDAO.selectShowTimeList(mar.get(i).getNum(),con);	
				ssar.add(sar);
			}
			theaters = theaterDAO.selectList(con);//극장리스트
			all_dates = movieDAO.calcDateList(); // 날짜리스트 
			
			request.setAttribute("movie_codes", movie_codes);
			request.setAttribute("movieTitle", tar);
			//request.setAttribute("movie", mar);
			request.setAttribute("theater", theaters);
			//request.setAttribute("all_dates", all_dates);
			
			//request.setAttribute("showtime", ssar);
			
			System.out.println(request.getParameter("movie_title"));
			System.out.println(request.getParameter("theater"));
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/movie/movieTimetable.jsp");
			
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
				
				int movie_num = movieDAO.getNum(con)-1;
				ShowTimeDTO showTimeDTO=new ShowTimeDTO();
				for(int i=0;i<show_times.length;i++) {
					showTimeDTO.setMovie_num(movie_num);
					showTimeDTO.setMovie_code(movieDTO.getMovie_code());
					showTimeDTO.setShow_time(show_times[i]);
					showTimeDTO.setAuditorium(movieDTO.getAuditorium());
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
