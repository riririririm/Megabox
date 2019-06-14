package com.megabox.page;

import java.util.Map;

public class Search {
	private String kind;
	private String search;
	private String communityKind;
	
	
	public String getKind() {
		/*
		 * if(this.kind==null) { // null이면 전체가 보여줬으면 좋겠다 return ""; }else
		 * if(kind.equals("no")) { return "and state='0'"; }else if(kind.equals("ok")) {
		 * this.kind="and state='1'"; }else { this.kind=""; }
		 */
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getCommunityKind() {
		return communityKind;
	}
	
	public void setCommunityKind(String communityKind) {
		if(communityKind==null) {
			this.communityKind = "contents";
		} else if(communityKind.equals("w")) {
			this.communityKind="writer";
		}else if(communityKind.equals("c")) {
			this.communityKind="contents";
		} else this.communityKind="contents";
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		if(search==null) {
			this.search="";
		}else {
			this.search = search;
		}
	}
	
}
