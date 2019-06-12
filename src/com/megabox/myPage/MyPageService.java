package com.megabox.myPage;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.member.MemberDTO;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.page.StoreSearchMakePage;
import com.megabox.store.Store_historyDAO;
import com.megabox.store.Store_historyDTO;
import com.megabox.util.DBConnector;

import sun.nio.cs.HistoricallyNamedCharset;

public class MyPageService implements Action{
	Store_historyDAO store_historyDAO = null;
	public MyPageService() {
		// TODO Auto-generated constructor stub
		store_historyDAO = new Store_historyDAO();
	}
	//myPage Main화면
	public ActionForward myPageMain(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/myPage.jsp";
		boolean check = true;
		
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	
	//BookPage
	public ActionForward bookPage(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/bookPage.jsp";
		boolean check = true;
		
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	
	//myQnA
	public ActionForward myQnA(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/myQnA.jsp";
		boolean check = true;
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	
	//StoprePage
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		ArrayList<Store_historyDTO> buy = new ArrayList<Store_historyDTO>();
		ArrayList<Store_historyDTO> cancel = new ArrayList<Store_historyDTO>();
		
		int curPage = 1;
		int cancelPage =1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e) {
			//예외 발생시 curPage는 1로 설정
		}
		try {
			cancelPage = Integer.parseInt(request.getParameter("cancelPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		StoreSearchMakePage storeSearchMakePage = new StoreSearchMakePage(curPage);
		StoreSearchMakePage storeSearchMakePage2 = new StoreSearchMakePage(cancelPage);
		
		SearchRow searchRow =  storeSearchMakePage.makeRow();
		SearchRow searchRow2 = storeSearchMakePage2.makeRow();
		
		//session에 있는 ID값 꺼내오기
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		Connection conn = null;
		try {
			String id = memberDTO.getId(); 
			if(id!= null) {
				conn = DBConnector.getConnect();
				int totalCount = store_historyDAO.getTotalCount(conn, id);
				int totalCountCancel = store_historyDAO.getTotalCountCancel(conn, id);
				
				SearchPager searchPager = storeSearchMakePage.makePage(totalCount);
				SearchPager searchPagerCancel = storeSearchMakePage2.makePage(totalCountCancel);
				
				buy = store_historyDAO.buyList(conn, id, searchRow);
				cancel = store_historyDAO.cancelList(conn, id, searchRow2);
				
				request.setAttribute("cancelPager", searchPagerCancel);
				request.setAttribute("pager", searchPager);
				
				request.setAttribute("buyList", buy);
				request.setAttribute("cancelList", cancel);
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/views/myPage/myStorePage.jsp");
			}
		}catch (Exception e) {
			request.setAttribute("msg", "다시 로그인 해주세요");
			request.setAttribute("path", "../index.do");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/common/result.jsp");
			e.printStackTrace();
		}
	
		return actionForward;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
	//stroe 구매 취소 update문
	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int history_num = Integer.parseInt(request.getParameter("history_num"));
		Connection conn = null;
		int result = 0;
		try {
			conn = DBConnector.getConnect();
			result = store_historyDAO.canceUpdate(conn, history_num);
			if(result>0) {
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/views/myPage/myStorePage.jsp");
			}else {
				request.setAttribute("msg", "다시 시도해주세요");
				request.setAttribute("path", "./myStorePage");
				actionForward.setPath("../WEB-INF/views/common/result.jsp");
				actionForward.setCheck(true);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return actionForward;
	}
	
	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

}
