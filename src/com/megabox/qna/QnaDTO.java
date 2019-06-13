package com.megabox.qna;

import java.sql.Date;

public class QnaDTO {
	private int num;
	private String writer;
	private String title;
	private String contents;
	private Date reg_date;
	private String post_pw;
	private int state;
	private String admin_answer;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getPost_pw() {
		return post_pw;
	}
	public void setPost_pw(String post_pw) {
		this.post_pw = post_pw;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getAdmin_answer() {
		return admin_answer;
	}
	public void setAdmin_answer(String admin_answer) {
		this.admin_answer = admin_answer;
	}
	
	
}
