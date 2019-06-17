package com.megabox.seat;

import java.sql.Date;

public class SeatDTO {
	private int num;
	private int book_num;
	private String theater;
	private String auditorium;
	private String seat_num;
	private int state;
	private String view_date;
	private String show_time;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
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
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getView_date() {
		return view_date;
	}
	public void setView_date(String view_date) {
		this.view_date = view_date;
	}
	public String getShow_time() {
		return show_time;
	}
	public void setShow_time(String show_time) {
		this.show_time = show_time;
	}
	
	
}
