package com.megabox.movie;

import java.sql.Date;

public class MovieDTO {
	private int num;
	private String movie_code;
	private String movie_title;
	private String movie_kind;
	private String theater;
	private String auditorium;
	private String view_date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_kind() {
		return movie_kind;
	}
	public void setMovie_kind(String movie_kind) {
		this.movie_kind = movie_kind;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public String getAuditorium() {
		return auditorium;
	}
	public void setAuditorium(String auditorium) {
		this.auditorium = auditorium;
	}
	public String getView_date() {
		return view_date;
	}
	public void setView_date(String view_date) {
		this.view_date = view_date;
	}
	
	
	
	
}
