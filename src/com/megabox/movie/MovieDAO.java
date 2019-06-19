package com.megabox.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;


public class MovieDAO  {
	
	////////////////////////////////////////////////
	//수현 0618 movie select
	public MovieDTO movieSelect(Connection conn, int num)throws Exception{
		MovieDTO movieDTO = null;
		String sql = "select * from movie where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			movieDTO = new MovieDTO();
			movieDTO.setNum(rs.getInt("num"));
			movieDTO.setMovie_code(rs.getString("movie_code"));
			movieDTO.setMovie_title(rs.getString("movie_title"));
			movieDTO.setMovie_kind(rs.getString("movie_kind"));
			movieDTO.setTheater(rs.getString("theater"));
			movieDTO.setAuditorium(rs.getString("auditorium"));
			movieDTO.setView_date(rs.getString("view_date"));
		}
		rs.close();
		st.close();
		return movieDTO;
	}
	
	
	//상영시간표 삭제
	public int showTimeDelete(Connection conn, int num) throws Exception{
		int result = 0;
		String sql = "delete showtime where movie_num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	
	//영화Update
	
	public int movieUpdate(Connection conn, MovieDTO movieDTO) throws Exception{
		int result =0;
		String sql = "update movie set movie_code=?, movie_title=?, movie_kind=?, theater=?, auditorium=?, view_date=? where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, movieDTO.getMovie_code());
		st.setString(2, movieDTO.getMovie_title());
		st.setString(3, movieDTO.getMovie_kind());
		st.setString(4, movieDTO.getTheater());
		st.setString(5, movieDTO.getAuditorium());
		st.setString(6, movieDTO.getView_date());
		st.setInt(7, movieDTO.getNum());
		result = st.executeUpdate();
		st.close();
		return result;
	}
	
	//영화 삭제
	public int deleteMovie(Connection conn, int num) throws Exception{
		int result = 0;
		String sql = "delete movie where num=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	/////////////////////////////////////////////////jsh
	
	public int getNum(Connection con) throws Exception { //영화db의 인덱스번호
		int result=0;
		String sql="select movie_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		rs.next();
		result=rs.getInt(1);
		
		rs.close();
		st.close();
		
		return result;
	}
	
	public ArrayList<AudiShowDTO> searchShowTimeList(String movie_title, String theater, String view_date, Connection con) throws Exception {
		//선택한 영화, 극장, 날짜에 상영하는 시간
		ArrayList<String> show_times = new ArrayList<String>();
		ArrayList<AudiShowDTO> aud = new ArrayList<AudiShowDTO>();
		String sql="select movie.auditorium, show_time from movie join showTime on movie.num= showTime.movie_num " + 
				"where movie_title=? and theater=? and view_date=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, movie_title);
		st.setString(2, theater);
		st.setString(3, view_date);
		
		ResultSet rs = st.executeQuery();
		
		AudiShowDTO dto = null;
		while(rs.next()) {
			//show_times.add(rs.getString(1));
			dto = new AudiShowDTO();
			dto.setAuditorium(rs.getString(1));
			dto.setSar(rs.getString(2));
			aud.add(dto);
		}
		return aud;
		
	}

	public ArrayList<String> calcDateList() throws Exception {
		//상영시간표에서 날짜 리스트를 보여줄 메소드
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		String start_date= fm.format(calendar.getTime()); //현재 날짜
		calendar.add(Calendar.MONTH, 1); //1달 더함
		String end_date = fm.format(calendar.getTime());
		
		Date sdate = fm.parse(start_date);
		Date edate = fm.parse(end_date);
		Date cdate = sdate;
		
		ArrayList<String> dates = new ArrayList<String>();
		while(cdate.compareTo(edate)<=0) {
			dates.add(fm.format(cdate));
			Calendar c = Calendar.getInstance();
			c.setTime(cdate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			cdate=c.getTime();
		}
		
		return dates;
		
	}
	
	public ArrayList<String> searchDateList(String movie_title, String theater, Connection con) throws Exception{// 클릭한 영화의 상영일이 있는 날짜 찾기
		ArrayList<String> dates = new ArrayList<String>();
		String sql ="select distinct to_char(view_date,'YYYY-MM-DD') vd from movie where movie_title=? and theater=? order by vd asc";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, movie_title);
		st.setString(2, theater);
		ResultSet rs = st.executeQuery();
		while(rs.next())
			dates.add(rs.getString(1));
		
		rs.close();
		st.close();
		return dates;
	}
	
	public ArrayList<String> selectMovieTitleList(Connection con) throws Exception {
		// 영화 제목만 받아오기
		ArrayList<String> ar = new ArrayList<String>();
		String sql= "select distinct movie_title from movie";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		
		while(rs.next()) {
			ar.add(rs.getString("movie_title"));
		}
		rs.close();
		st.close();
		
		return ar;
	}
	
	public ArrayList<MovieDTO> selectList(Connection con) throws Exception {
		// 등록한 영화 목록
		ArrayList<MovieDTO> ar = new ArrayList<MovieDTO>();
		String sql= "select num, movie_code, movie_title,movie_kind, theater, auditorium, to_char(view_date,'yyyy-mm-dd') vd from movie";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		MovieDTO movieDTO =null;
		while(rs.next()) {
			movieDTO = new MovieDTO();
			movieDTO.setNum(rs.getInt("num"));
			movieDTO.setMovie_code(rs.getString("movie_code"));
			movieDTO.setMovie_title(rs.getString("movie_title"));
			movieDTO.setMovie_kind(rs.getString("movie_kind"));
			movieDTO.setTheater(rs.getString("theater"));
			movieDTO.setAuditorium(rs.getString("auditorium"));
			movieDTO.setView_date(rs.getString("vd"));
			ar.add(movieDTO);
		}
		rs.close();
		st.close();
		
		return ar;
	}
	public ArrayList<ShowTimeDTO> selectShowTimeList(int num, Connection con) throws Exception {
		//영화별 상영시간 리스트
		ArrayList<ShowTimeDTO> ar = new ArrayList<ShowTimeDTO>();
		//String sql= "select * from showTime where movie_code=?";
		String sql= "select * from showTime where movie_num=? order by show_time asc";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		
		ShowTimeDTO showTimeDTO =null;
		while(rs.next()) {
			showTimeDTO = new ShowTimeDTO();
			showTimeDTO.setMovie_code(rs.getString("movie_code"));
			showTimeDTO.setShow_time(rs.getString("show_time"));
			showTimeDTO.setAuditorium(rs.getString("auditorium"));
			
			ar.add(showTimeDTO);
		}
		rs.close();
		st.close();
		return ar;
	}
	
	public String searchMovieCode(String movie_title, Connection con) throws Exception {
		String sql= "select movie_code from movie where movie_title=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, movie_title);
		ResultSet rs = st.executeQuery();
		
		rs.next();
		
		String movie_code = rs.getString("movie_code");
		return movie_code;
	}
	
	public MovieDTO selectOne() {
		// 영화상영 정보
		return null;
	}

	
	public int insert(MovieDTO movieDTO, Connection con) throws Exception {
		//영화 상영정보 등록
		int result=0;
		
		String sql = "insert into movie values(movie_seq.nextval,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, movieDTO.getMovie_code());
		st.setString(2, movieDTO.getMovie_title());
		st.setString(3, movieDTO.getMovie_kind());
		st.setString(4, movieDTO.getTheater());
		st.setString(5, movieDTO.getAuditorium());
		st.setString(6, movieDTO.getView_date());
		
		result=st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	public int insertShowTime(ShowTimeDTO showTimeDTO, Connection con) throws Exception {
		//상영시간 DB등록
		int result=0;
		
		String sql = "insert into showTime values(show_time_seq.nextval,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, showTimeDTO.getMovie_num());
		st.setString(2, showTimeDTO.getMovie_code());
		st.setString(3, showTimeDTO.getShow_time());
		st.setString(4, showTimeDTO.getAuditorium());
			
		result=st.executeUpdate();
		
		st.close();
		
		return result;
	}

	
	public int update() {
		// 등록한 내용 수정
		return 0;
	}

	
	public int delete() {
		// 영화삭제
		return 0;
	}
	
}
