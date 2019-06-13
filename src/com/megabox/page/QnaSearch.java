package com.megabox.page;

public class QnaSearch {
	private int state; //답변 달린 상태 답변 완료 -> 1, 답변 X -> 0
	private String search;
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		if(state == 0) {
			this.state =0;
		}else if(state==1) {
			this.state =1;
		}else {
			this.state=0;
		}
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
}
