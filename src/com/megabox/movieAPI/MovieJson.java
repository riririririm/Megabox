package com.megabox.movieAPI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;



public class MovieJson {
	final static String serviceKey = "19TKUUT86TYFU6699SQ4";
	
	public MovieApiDTO getMovieApiDTO(String collection, String sort, String releaseDte, int listCount) {
		MovieApiDTO movieApiDTO = null;
		String urlStr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?" + "collection="+collection + "&sort=" +sort+ "&1&releaseDte="+ releaseDte + "&listCount="+ listCount + "&ServiceKey=" + serviceKey +"&_type=json"; 		
		

		MovieApiDAO movieApiDAO = new MovieApiDAO();
		
		
		try {
			URL url = new URL(urlStr);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			String line = "";
			String result ="";
			
			while((line=br.readLine())!=null) {
				result = result.concat(line);
			}
			
			System.out.println("result = " + result);
			
			JSONParser jsonParser = new JSONParser();
			
			JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
			System.out.println("jsonObj: " + jsonObj);
			System.out.println("jsonObj.size() : " + jsonObj.size());
			
			JSONArray parse_data = (JSONArray)jsonObj.get("Data");
			
			//System.out.println("test" + parse_data_test);
			System.out.println("parse_data : " + parse_data);

			JSONObject obj;
			JSONObject obj2;
			String category;
			
			obj = (JSONObject)parse_data.get(0);
			
			System.out.println("obj :  " + obj);
			
			JSONArray parse_result = (JSONArray)obj.get("Result");
			
			System.out.println("parse_result" + parse_result);
			System.out.println("parse_result.size() : " + parse_result.size());
			
			
			for(int i=0; i< parse_result.size(); i++) {
				obj2 = (JSONObject)parse_result.get(i);
				
				movieApiDTO = new MovieApiDTO();
				
				movieApiDTO.setMovie_code(obj2.get("DOCID").toString());
				movieApiDTO.setMovie_title(obj2.get("title").toString());
				
				movieApiDAO.insertMovie(movieApiDTO);
			}
	
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return movieApiDTO;
		
		
	}

	
}
