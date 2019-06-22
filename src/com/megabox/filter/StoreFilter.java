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
@WebFilter("/StoreFilter")
public class StoreFilter implements Filter {
	private HashMap<String, Boolean> map;
    /**
     * Default constructor. 
     */
    public StoreFilter() {
        map= new HashMap<String, Boolean>();
        map.put("/myModal",false);
        map.put("/myModal2",false);
        map.put("/storeList",false);
        map.put("/storePurchase",true);
        map.put("/storeUpdate",true);
        map.put("/storeDelete",true);
        map.put("/storeReg",true);
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
		if (check) {
			if (memberDTO != null && memberDTO.getId().equals("admin")) {
				// 관리자만 접근 가능
				chain.doFilter(request, response);
			} if(memberDTO != null) {
				chain.doFilter(request, response);
			}
			else {
				((HttpServletResponse) response).sendRedirect("./storeList");
			}

		} else {
			if(command.equals("/myModal2") && memberDTO == null) {
				((HttpServletRequest)request).setAttribute("message", "로그인 후 이용해주세요");
				((HttpServletRequest)request).setAttribute("path", "./storeList");
				RequestDispatcher view = ((HttpServletRequest)request).getRequestDispatcher("../WEB-INF/views/common/result.jsp");
				view.forward(request, response);
			}else {				
				chain.doFilter(request, response);
			}
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
