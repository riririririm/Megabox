package com.megabox.community;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.page.SearchMakePage_2;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;

public class CommunityService implements Action {
	
	private CommunityDAO communityDAO;
	
	
	public CommunityService() {
		communityDAO = new CommunityDAO();
		// TODO Auto-generated constructor stub
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int curPage = 1;
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
			
		} catch (Exception e) {
			
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		SearchMakePage_2 searchMakePage_2 = new SearchMakePage_2(curPage, kind, search);
		
		// row
		SearchRow searchRow = searchMakePage_2.makeRow();
		//page
		
		int totalCount=0;
		Connection conn = null;
		List<CommunityDTO> ar = null;
		try {
			conn = DBConnector.getConnect();
			totalCount = communityDAO.getTotalCount(searchRow, conn);
			
			ar = communityDAO.selectList(searchRow, conn);
			System.out.println("size : " + ar.size());
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("communityList", ar);
		
		SearchPager searchPager = searchMakePage_2.makePage(totalCount);
		request.setAttribute("pager", searchPager);
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/community/community.jsp");

		return actionForward;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		
		CommunityDTO communityDTO = new CommunityDTO();
		communityDTO.setWriter(request.getParameter("writer"));
		communityDTO.setContents(request.getParameter("contents"));
		int result=0;
		Connection conn=null;
		
		try {
			conn =DBConnector.getConnect();
			result=communityDAO.insert(communityDTO, conn);
			System.out.println("result = " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("result", result);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/common/result2.jsp");

		
		return actionForward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		CommunityDTO communityDTO = new CommunityDTO();
		communityDTO.setNum(Integer.parseInt(request.getParameter("num")));
		communityDTO.setContents(request.getParameter("contents"));
		
		int result=0;
		Connection conn = null;
		
		try {
			conn = DBConnector.getConnect();
			result = communityDAO.update(communityDTO, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		request.setAttribute("result", result);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/common/result2.jsp");
		return actionForward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		Connection conn = null;
		int result = 0;
		
		try {
			int num = Integer.parseInt(request.getParameter("num"));
			conn = DBConnector.getConnect();
			result = communityDAO.delete(num, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("result", result);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/common/result2.jsp");
		return actionForward;
	}

}
