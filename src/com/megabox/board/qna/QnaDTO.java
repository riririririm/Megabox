package com.megabox.board.qna;

import com.megabox.board.BoardDTO;

public class QnaDTO extends BoardDTO{
	private String post_pw;
	private String state;
	private String admin_answer;
	
	public String getPost_pw() {
		return post_pw;
	}
	public void setPost_pw(String post_pw) {
		this.post_pw = post_pw;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAdmin_answer() {
		return admin_answer;
	}
	public void setAdmin_answer(String admin_answer) {
		this.admin_answer = admin_answer;
	}

	
}
