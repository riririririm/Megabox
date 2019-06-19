package com.megabox.movieAPI;


public class cotroll {
	
	public static void main(String[] args) {
		String collection = "kmdb_new";
		String sort = "repRlsDate";
		String releaseDte = "";
		int listCount=150;
		
		MovieJson mJson = new MovieJson();
		
		MovieApiDTO movieApiDTO = mJson.getMovieApiDTO(collection, sort, releaseDte, listCount);
		
	}
}
