package com.megabox.myPage;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.ThrowStatement;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.book.BookDAO;
import com.megabox.book.BookDTO;
import com.megabox.member.MemberDTO;
import com.megabox.page.QnaSearchMakePage;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.page.StoreSearchMakePage;
import com.megabox.qna.QnaDAO;
import com.megabox.qna.QnaDTO;
import com.megabox.seat.SeatDAO;
import com.megabox.store.Store_historyDAO;
import com.megabox.store.Store_historyDTO;
import com.megabox.util.DBConnector;



public class MyPageService implements Action{
	Store_historyDAO store_historyDAO = null;
	QnaDAO qnaDAO = null;
	BookDAO bookDAO = null;
	SeatDAO seatDAO = null;
	public MyPageService() {
		// TODO Auto-generated constructor stub
		store_historyDAO = new Store_historyDAO();
		seatDAO = new SeatDAO();
		qnaDAO = new QnaDAO();
		bookDAO = new BookDAO();
	}

	//bookCancel
	public ActionForward bookCancel(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/bookPage.jsp";
		boolean check = true;
		int curPage=1;

		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		StoreSearchMakePage storeSearchMakePage = new StoreSearchMakePage(curPage);
		SearchRow searchRow = storeSearchMakePage.makeRow(); //행과 열이 만들어 지는 부분
		Connection conn = null;
		ArrayList<BookDTO> ar = null; //취소하는거 받는 변수명
		
		try {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			String id = memberDTO.getId();
			conn = DBConnector.getConnect();
			int bookCancelCount = bookDAO.bookCancelCount(conn, id);
			SearchPager searchPager = storeSearchMakePage.makePage(bookCancelCount); //예약취소 페이저
			ar = bookDAO.bookCancelList(conn, id, searchRow);
			request.setAttribute("bookCancelList", ar);
			request.setAttribute("cancelPager", searchPager);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}
	//BookPage
	public ActionForward bookPage(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/bookPage.jsp";
		boolean check = true;
		int curPage=1;

		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		StoreSearchMakePage storeSearchMakePage = new StoreSearchMakePage(curPage);
		SearchRow searchRow = storeSearchMakePage.makeRow(); //행과 열이 만들어 지는 부분
		Connection conn = null;
		ArrayList<BookDTO> ar = null;
		try {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			String id = memberDTO.getId();
			conn = DBConnector.getConnect();
			int bookTotalCount = bookDAO.bookTotalCount(conn, id);
			SearchPager searchPager = storeSearchMakePage.makePage(bookTotalCount); //예약상태 페이저
			ar = bookDAO.bookList(conn, id, searchRow);
			request.setAttribute("bookList", ar);
			request.setAttribute("pager", searchPager);
			
		} catch (Exception e) {
			request.setAttribute("message", "다시 로그인 해주세요");
			request.setAttribute("path", "../index.do");
			path = "../WEB-INF/views/common/result.jsp";
			e.printStackTrace();
		}

		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}

	//BookDelete 
	public ActionForward bookDelete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward= new ActionForward();
		String path = "../WEB-INF/views/myPage/myQnA.jsp";
		boolean check = true;
		Connection conn = null;
		int result = 0;
		try {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			String id = memberDTO.getId();
			int book_num = Integer.parseInt(request.getParameter("book_num"));
			conn = DBConnector.getConnect();
			conn.setAutoCommit(false);//자동으로 commit되는 것을 막는다.  true면 자동 commit
			result = bookDAO.bookDelete(conn, id, book_num);
			if(result<1) {//삭제가 안되었을 때
				throw new Exception(); //예외 발생해서 catch문 안으로 가게 하는 부분
			}
			result = seatDAO.updateSeat(conn, book_num);
			if(result<1) {
				throw new Exception();
			}
			conn.commit(); //두개 다 끝나고 성공하면 commit시킨다.

		} catch (Exception e) {
			try {
				conn.rollback(); //마지막commit으로 돌린다. 
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} finally {
				try {
					conn.setAutoCommit(true); //기본상태로 되돌려준다. 
					conn.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}//
			}

			request.setAttribute("message", "다시 로그인 해주세요");
			request.setAttribute("path", "../index.do");
			path = "../WEB-INF/views/common/result.jsp";
			e.printStackTrace();
		}

		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}
	//QnAList
	public ActionForward qnaList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/myPage/myQnA.jsp";
		boolean check = true;

		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		QnaSearchMakePage qnaSearchMakePage = new QnaSearchMakePage(curPage, kind, search);
		SearchRow searchRow = qnaSearchMakePage.makeRow(); //페이지에서 첫번째와 마지막번호를 나타내기 위해서 선언
		Connection conn = null;
		ArrayList<QnaDTO> ar = null;
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		try {
			if(memberDTO.getId()!=null) {
				conn = DBConnector.getConnect();
				ar = new ArrayList<QnaDTO>();
				String id = memberDTO.getId();

				int totalCount = qnaDAO.QnaTotalCount(conn, id, searchRow);
				ar = qnaDAO.myQnaList(conn, id, searchRow);
				SearchPager searchPager = qnaSearchMakePage.makePage(totalCount);
				request.setAttribute("pager", searchPager);
				request.setAttribute("qnaList", ar);
				request.setAttribute("total", totalCount);
			}
		}catch (Exception e) {
			path = "../index.do";
			check = true;
			e.printStackTrace();
		}


		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
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
			request.setAttribute("message", "다시 로그인 해주세요");
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
				request.setAttribute("message", "다시 시도해주세요");
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
