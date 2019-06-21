package com.megabox.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.member.MemberDTO;


/**
 * Servlet Filter implementation class Filtertest1
 */
@WebFilter("/MovieFilter")
public class MovieFilter implements Filter {
	private HashMap<String, Boolean> map;
    /**
     * Default constructor. 
     */
    public MovieFilter() {
        map= new HashMap<String, Boolean>();
        map.put("/boxoffice",false);
        map.put("/movieTimetable",false);
        map.put("/movieViewDate",false);
        map.put("/movieShowTime",false);
        map.put("/movieSeat",true);
        map.put("/movieSelect",true);
        map.put("/movieReadyPay",true);
        map.put("/movieTimetableAdmin",true);
        map.put("/movieReg",true);
        map.put("/movieDelete",true);
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		
		//request
		HttpSession session = ((HttpServletRequest)request).getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		String command = ((HttpServletRequest)request).getPathInfo();
		boolean check = map.get(command);
		if(check) {
			if(command.equals("/movieSeat") || command.equals("/movieReadyPay") ) {
				//좌석 선택 페이지에서
				if(memberDTO != null){ //로그인한 상태면 보여주고
					chain.doFilter(request, response);
				}else { //로그인 안된 상태면 상영시간표로 보내기
					((HttpServletRequest)request).setAttribute("message", "로그인 후 이용해주세요");
					((HttpServletRequest)request).setAttribute("path", "./movieTimetable");
					RequestDispatcher view = ((HttpServletRequest)request).getRequestDispatcher("../WEB-INF/views/common/result.jsp");
					view.forward(request, response);
					//((HttpServletResponse)response).sendRedirect("./movieTimetable");
				}
			}else {
				//영화등록 페이지, 등록된 영화리스트 페이지에서
				if(memberDTO != null && memberDTO.getId().equals("admin")) {
					//관리자만 접근 가능
					chain.doFilter(request, response);
				}else {
					((HttpServletResponse)response).sendRedirect("./movieTimetable");
				}
			}
			
		}else {
			chain.doFilter(request, response);
		}
		
		
	
		System.out.println("Filter in");
		
		//response
		System.out.println("Filter out");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
