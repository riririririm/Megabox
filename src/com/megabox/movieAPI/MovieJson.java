package com.megabox.movieAPI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class MovieJson {
	final static String serviceKey = "19TKUUT86TYFU6699SQ4";
	
	public MovieApiDTO getMovieApiDTO(String collection, String sort, String releaseDte) {
		MovieApiDTO movieApiDTO = null;
		String urlStr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?" + "collection="+collection + "&sort=" +sort+ "&1&releaseDte="+ releaseDte + "&ServiceKey=" + serviceKey +"&_type=json"; 		
		
		movieApiDTO = new MovieApiDTO();
		
		try {
			URL url = new URL(urlStr);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String line = "";
			String result ="";
			
			while((line=br.readLine())!=null) {
				result = result.concat(line);
			}
			System.out.println(result);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
			JSONObject parse_response = (JSONObject)jsonObj.get("response");

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		return movieApiDTO;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
