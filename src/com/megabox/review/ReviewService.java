package com.megabox.review;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.page.SearchMakePage_review;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;

public class ReviewService implements Action{
	private ReviewDAO reviewDAO;
	
	public ReviewService() {
		reviewDAO = new ReviewDAO();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int curPage = 1;
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		SearchMakePage_review searchMakePage_review = new SearchMakePage_review(curPage, kind, search);
		
		SearchRow searchRow = searchMakePage_review.makeRow();
		
		int totalCount = 0;
		Connection conn = null;
		List<ReviewDTO> ar = null;
		
		try {
			conn = DBConnector.getConnect();
			totalCount = reviewDAO.getTotalCount(searchRow, conn);
			
			ar = reviewDAO.selectList(searchRow, conn);
			System.out.println("size :" + ar.size());
			
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
		
		request.setAttribute("reviewList", ar);
		
		SearchPager searchPager = searchMakePage_review.makePage(totalCount);
		request.setAttribute("pager", searchPager);
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/review/reviewList.jsp");
		
		
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
		
		ReviewDTO reviewDTO = new ReviewDTO();
		reviewDTO.setMovie_code(request.getParameter("movie_code"));
		reviewDTO.setId(request.getParameter("id"));
		reviewDTO.setContents(request.getParameter("contents"));
		
		System.out.println(reviewDTO.getId());
		int result =0;
		Connection conn = null;
		
		try {
			conn=DBConnector.getConnect();
			result = reviewDAO.insert(reviewDTO, conn);
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
