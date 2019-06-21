package com.megabox.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.member.MemberDTO;

/**
 * Servlet Filter implementation class memberPageFilter
 */
@WebFilter("/memberPageFilter")
public class memberPageFilter implements Filter {
	private HashMap<String, Boolean> map;
    /**
     * Default constructor. 
     */
    public memberPageFilter() {
        // TODO Auto-generated constructor stub
    	map = new HashMap<String, Boolean>();
    	map.put("/memberCheck", false);
    	map.put("/memberJoin", false);
    	map.put("/memberDupl", false);
    	map.put("/memberLogin", false);
    	map.put("/memberLogout", false);
    	map.put("/myPersonalPage", true);
    	map.put("/myPersonalUpdate", true);
    	map.put("/dropMember", true);
    	map.put("/myPwChange", true);
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
		HttpSession session = ((HttpServletRequest)request).getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String command = ((HttpServletRequest)request).getPathInfo();
		boolean check = map.get(command);
		if(check) {
			if(memberDTO!=null) {
				chain.doFilter(request, response);
			}else {
				((HttpServletResponse)response).sendRedirect("../index.do");
			}
		}else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
