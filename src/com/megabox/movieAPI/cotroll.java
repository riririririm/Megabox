package com.megabox.movieAPI;

import com.megabox.movie.MovieDTO;

public class cotroll {
	public static void main(String[] args) {
		String collection = "kmdb_new";
		String sort = "repRlsDate";
		String releaseDte = "20190626";
		
		MovieJson mJson = new MovieJson();
		
		MovieApiDTO movieApiDTO = mJson.getMovieApiDTO(collection, sort, releaseDte);
		
		MovieApiDAO movieApiDAO = new MovieApiDAO();
		movieApiDAO.insertMovie(movieApiDTO);
	}
}
