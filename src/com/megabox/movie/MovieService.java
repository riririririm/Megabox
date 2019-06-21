package com.megabox.movie;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.seat.SeatDAO;
import com.megabox.seat.SeatDTO;
import com.megabox.theater.TheaterDAO;
import com.megabox.theater.TheaterDTO;
import com.megabox.util.DBConnector;

public class MovieService implements Action{
	private MovieDAO movieDAO;
	private TheaterDAO theaterDAO;
	private SeatDAO seatDAO;
	
	public MovieService() {
		movieDAO = new MovieDAO();
		theaterDAO =new TheaterDAO();
		seatDAO = new SeatDAO();
	}
	
///////////////////////////////////////////////////////////////////////////////////
//수현 movie_update
	public ActionForward movieUpdate(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/movie/movieSelect.jsp";
		boolean check = true;
		String method = request.getMethod();

		if (method.equals("POST")) {
			Connection conn = null;
			MovieDTO movieDTO = new MovieDTO();
			SeatDTO seatDTO = new SeatDTO();
			ArrayList<String> seatRows = new ArrayList<String>();
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
			try {
				conn = DBConnector.getConnect();
				movieDTO.setNum(Integer.parseInt(request.getParameter("num")));
				movieDTO.setMovie_code(request.getParameter("movie_code"));
				movieDTO.setMovie_title(request.getParameter("movie_title"));
				movieDTO.setMovie_kind(request.getParameter("movie_kind"));
				movieDTO.setTheater(request.getParameter("theater"));
				movieDTO.setAuditorium(request.getParameter("auditorium"));
				movieDTO.setView_date(request.getParameter("view_date"));
				String[] show_times = request.getParameterValues("show_time");

				conn.setAutoCommit(false);
				result1 = movieDAO.movieUpdate(conn, movieDTO);
				if (result1 < 1) {
					throw new Exception();
				}

				seatDTO.setTheater(movieDTO.getTheater());
				seatDTO.setAuditorium(movieDTO.getAuditorium());
				seatDTO.setView_date(movieDTO.getView_date());
				seatRows = seatDAO.initSeat();
				if (seatRows == null) {
					throw new Exception();
				}

				int movie_num = Integer.parseInt(request.getParameter("num"));

				ShowTimeDTO showTimeDTO = new ShowTimeDTO();
				for (int i = 0; i < show_times.length; i++) {
					showTimeDTO.setMovie_num(movie_num);
					showTimeDTO.setMovie_code(movieDTO.getMovie_code());
					showTimeDTO.setShow_time(show_times[i]);
					showTimeDTO.setAuditorium(movieDTO.getAuditorium());
					result2 = movieDAO.insertShowTime(showTimeDTO, conn);
				}
				if (result2 < 1) {
					throw new Exception();
				}

				for (int i = 0; i < show_times.length; i++) {
					seatDTO.setShow_time(show_times[i]);
					for (int j = 0; j < seatRows.size(); j++) {
						for (int k = 0; k < 10; k++) {
							seatDTO.setSeat_num(seatRows.get(j) + k);
							result3 = seatDAO.insert(seatDTO, conn);
						}
					}
				}
				if (result3 < 1) {
					throw new Exception();
				}
				conn.commit();
				request.setAttribute("message", "영화 상영정보를 수정했습니다.");
				request.setAttribute("path", "./movieTimetableAdmin");
				check = true;
				path = "../WEB-INF/views/common/result.jsp";
			} catch (Exception e) {
				try {
					request.setAttribute("message", "영화 상영정보 수정 실패.");
					request.setAttribute("path", "./movieTimetableAdmin");
					check = true;
					path = "../WEB-INF/views/common/result.jsp";
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} finally {
					try {
						conn.setAutoCommit(true);
						conn.close();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}

//수현 movie_selectOne
	public ActionForward movieSelectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/movie/movieSelect.jsp";
		boolean check = true;
		int num = Integer.parseInt(request.getParameter("num"));
		MovieDTO movieDTO = null;
		ArrayList<TheaterDTO> theaters=null;
		Connection conn = null;
		int result = 0, result1 = 0;

		try {
			conn = DBConnector.getConnect();
			conn.setAutoCommit(false);
			movieDTO = movieDAO.movieSelect(conn, num);
			theaters = theaterDAO.selectList(conn);
			if (movieDTO == null) {
				throw new Exception();
			}
			request.setAttribute("movie", movieDTO);
			request.setAttribute("theaters", theaters);

////////좌석삭제하는 부분//////////////
			result = seatDAO.deleteSeat(conn, movieDTO);
			if (result < 1) {
				throw new Exception();
			}

////////상영시간표 삭제하는 부분////////
			result1 = movieDAO.showTimeDelete(conn, num);
			if (result1 < 1) {
				throw new Exception();
			}
			conn.commit();

		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				request.setAttribute("message", "Sever Error");
				request.setAttribute("path", "../index.do");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/views/common/result.jsp");
				e1.printStackTrace();
			} finally {
				try {
					conn.setAutoCommit(true);
					conn.close();
				} catch (SQLException e1) {
// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			request.setAttribute("message", "Sever Error");
			request.setAttribute("path", "../index.do");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/common/result.jsp");
			e.printStackTrace();
		}

		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}

//movieDelete
	public ActionForward movieDelete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/movie/movieTimetableAdmin.jsp";
		boolean check = true;
		int num = Integer.parseInt(request.getParameter("num"));
		MovieDTO movieDTO = null;
		Connection conn = null;
		int result = 0, result1 = 0, result2 = 0;
		try {
			conn = DBConnector.getConnect();
			conn.setAutoCommit(false);
			movieDTO = movieDAO.movieSelect(conn, num);
			if (movieDTO == null) {
				throw new Exception();
			}

////////좌석삭제하는 부분//////////////
			result = seatDAO.deleteSeat(conn, movieDTO);
			if (result < 1) {
				throw new Exception();
			}

////////상영시간표 삭제하는 부분////////
			result1 = movieDAO.showTimeDelete(conn, num);
			if (result1 < 1) {
				throw new Exception();
			}

//////영화삭제하는 부분///////////////
			result2 = movieDAO.deleteMovie(conn, num);
			if (result < 1) {
				throw new Exception();
			}
			conn.commit();
			request.setAttribute("message", "영화 상영정보를 삭제했습니다.");
			request.setAttribute("path", "./movieTimetableAdmin");
			check = true;
			path = "../WEB-INF/views/common/result.jsp";
		} catch (Exception e) {
			try {
				request.setAttribute("message", "영화 상영정보 삭제 실패.");
				request.setAttribute("path", "./movieTimetableAdmin");
				check = true;
				path = "../WEB-INF/views/common/result.jsp";
				conn.rollback();
			} catch (SQLException e1) {
// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				try {
					conn.setAutoCommit(true);
					conn.close();
				} catch (SQLException e1) {
// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
// TODO Auto-generated catch block
			e.printStackTrace();
		}

		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}
//////////////////////////////////////////////////////////////////////////////////
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
				//sar= movieDAO.selectShowTim  eList(mar.get(i).getMovie_code(),con);	
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
			SeatDTO seatDTO = new SeatDTO();
			ArrayList<String> seatRows = new ArrayList<String>();
			int result1=0; int result2=0; int result3=0;
			
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
				
				seatDTO.setTheater(movieDTO.getTheater());
				seatDTO.setAuditorium(movieDTO.getAuditorium());
				seatDTO.setView_date(movieDTO.getView_date());
				seatRows = seatDAO.initSeat();
				
				int movie_num = movieDAO.getNum(con)-1;
				ShowTimeDTO showTimeDTO=new ShowTimeDTO();
				for(int i=0;i<show_times.length;i++) {
					showTimeDTO.setMovie_num(movie_num);
					showTimeDTO.setMovie_code(movieDTO.getMovie_code());
					showTimeDTO.setShow_time(show_times[i]);
					showTimeDTO.setAuditorium(movieDTO.getAuditorium());
					result2 = movieDAO.insertShowTime(showTimeDTO, con);
					
					//
					seatDTO.setShow_time(show_times[i]);
					for(int j=0;j<seatRows.size();j++) {
						for(int k=1;k<11;k++) {
							seatDTO.setSeat_num(seatRows.get(j)+k);
							result3= seatDAO.insert(seatDTO, con);
						}
					}
				}
				
				
				if(result1>0 && result2>0 && result3>0) {
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
		
			Connection con=null;
			try {
				con = DBConnector.getConnect();
				ArrayList<TheaterDTO> theaters = theaterDAO.selectList(con);
				System.out.println(theaters.size());
				request.setAttribute("theaters", theaters);
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
