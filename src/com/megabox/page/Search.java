package com.megabox.page;

public class Search {
	private String kind;
	private String search;
	private String communityKind;
	private String reviewKind;
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		if(kind==null) {
			this.kind="title";
		}else if(kind.equals("w")) {
			this.kind="writer";
		}else if(kind.equals("c")) {
			this.kind="contents";
		}else {
			this.kind="title";
		}
		
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
	
	public String getReviewKind() {
		return communityKind;
	}
	
	public void setReviewKind(String reviewKind) {
		if(reviewKind==null) {
			this.reviewKind = "contents";
		} else if(reviewKind.equals("w")) {
			this.reviewKind="id";
		}else if(reviewKind.equals("c")) {
			this.reviewKind="contents";
		} else this.reviewKind="contents";
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
