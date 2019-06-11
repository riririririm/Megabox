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


public class MovieDAO2  {

	public ArrayList<String> calcDateList(Connection con) throws Exception {
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
	
	public ArrayList<MovieDTO> selectList(Connection con) throws Exception {
		// 등록한 영화 목록
		ArrayList<MovieDTO> ar = new ArrayList<MovieDTO>();
		String sql= "select movie_code, movie_title,movie_kind, theater, auditorium, to_char(view_date,'yyyy-mm-dd') vd from movie";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		MovieDTO movieDTO =null;
		while(rs.next()) {
			movieDTO = new MovieDTO();
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
	public ArrayList<ShowTimeDTO> selectShowTimeList(String movie_code, Connection con) throws Exception {
		//영화별 상영시간 리스트
		ArrayList<ShowTimeDTO> ar = new ArrayList<ShowTimeDTO>();
		String sql= "select * from showTime where movie_code=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, movie_code);
		ResultSet rs = st.executeQuery();
		
		ShowTimeDTO showTimeDTO =null;
		while(rs.next()) {
			showTimeDTO = new ShowTimeDTO();
			showTimeDTO.setMovie_code(rs.getString("movie_code"));
			showTimeDTO.setShow_time(rs.getString("show_time"));
			
			ar.add(showTimeDTO);
		}
		rs.close();
		st.close();
		return ar;
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
		
		String sql = "insert into showTime values(show_time_seq.nextval,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, showTimeDTO.getMovie_code());
		st.setString(2, showTimeDTO.getShow_time());
			
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
