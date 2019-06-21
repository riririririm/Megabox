package com.megabox.qna;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.upload.UploadDAO;
import com.megabox.board.BoardDTO;
import com.megabox.member.MemberDTO;
import com.megabox.page.SearchMakePage;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.megabox.upload.UploadDTO;

public class QnaService implements Action {
	private QnaDAO qnaDAO;
	private UploadDAO uploadDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
		uploadDAO = new UploadDAO();
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int curPage=1;
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		SearchMakePage searchMakePage = new SearchMakePage(curPage);
		
		//row
		 SearchRow searchRow = searchMakePage.makeRow();
		//page
		 int totalCount=0;
		 Connection con = null;
		try {
			con = DBConnector.getConnect();
			totalCount = qnaDAO.getTotalCount(searchRow, con);
			List<QnaDTO> ar = qnaDAO.selectList(searchRow, con);
			request.setAttribute("list", ar);
			request.setAttribute("board", "qna");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 SearchPager searchPager = searchMakePage.makePage(totalCount);
		 request.setAttribute("pager", searchPager);
		 
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/qna/qnaList.jsp");
		
		return actionForward;
	}
	
	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		QnaDTO qnaDTO = null;
		List<UploadDTO> ar = null;
		Connection con = null;
		String id = null;
		try {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
		}catch (Exception e){
			
		}
		finally {
			try {
				con = DBConnector.getConnect();
				int num = Integer.parseInt(request.getParameter("num"));
				qnaDTO = qnaDAO.selectOne(num, con);
				ar = uploadDAO.selectList(num, con);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		String path="";
		if(qnaDTO != null) {
			request.setAttribute("dto", qnaDTO);
			request.setAttribute("upload", ar);
			request.setAttribute("id", id);
			path = "../WEB-INF/views/qna/qnaSelect.jsp";
		}else {
			request.setAttribute("message", "No Data");
			request.setAttribute("path", "./qnaList");
			path = "../WEB-INF/views/common/result.jsp"; 
		}
		
		actionForward.setCheck(true);
		actionForward.setPath(path);
		return actionForward;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		
		boolean check=true;
		String path="../WEB-INF/views/qna/qnaWrite.jsp";
		
		if(method.equals("POST")) {
			
			Connection con=null;
			try {
				
			 	QnaDTO qnaDTO = new QnaDTO();
			 	qnaDTO.setWriter(request.getParameter("writer"));
			 	qnaDTO.setTitle(request.getParameter("title"));
			 	qnaDTO.setContents(request.getParameter("contents"));
			 	qnaDTO.setPost_pw(request.getParameter("pw"));
			 	System.out.println(qnaDTO.getPost_pw());
			 	int result=0;
			 	con=DBConnector.getConnect();
			 	result=qnaDAO.insert(qnaDTO, con);
			 	
			 	if(result>0) {
			 		request.setAttribute("message", "성공");
					request.setAttribute("path", "./qnaList");
					check=true;
					path="../WEB-INF/views/common/result.jsp";
			 	}else {
					request.setAttribute("message", "실패");
					request.setAttribute("path", "./qnaList");
					path="../WEB-INF/views/common/result.jsp";
				}
			 	
			 
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			}finally {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
			
		}//post끝
		actionForward.setCheck(check);
		actionForward.setPath(path);
		
		return actionForward;
	}
	
	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		QnaDTO qnaDTO = null;
		Connection conn = null;
		boolean check=true;
		String path="";
		if(method.equals("POST")) {
			
			
			qnaDTO= new QnaDTO();
			qnaDTO.setTitle(request.getParameter("title"));
			qnaDTO.setContents(request.getParameter("contents"));
			qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));

			int result=0;
			try {
				conn=DBConnector.getConnect();
				result=qnaDAO.update(qnaDTO, conn);

				if(result>0) {
					request.setAttribute("message", "성공");
					request.setAttribute("path", "./qnaList");
					check=true;
					path="../WEB-INF/views/common/result.jsp";
				}else {
					request.setAttribute("message", "실패");
					request.setAttribute("path", "./qnaList");
					path="../WEB-INF/views/common/result.jsp";
				}
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
			request.setAttribute("dto", qnaDTO);
			actionForward.setCheck(check);
			actionForward.setPath(path);

		}else {
			int num = Integer.parseInt(request.getParameter("num"));
			try {
				conn=DBConnector.getConnect();
				qnaDTO = qnaDAO.selectOne(num, conn);
				System.out.println(qnaDTO.getTitle());
				System.out.println(qnaDTO.getContents());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			request.setAttribute("dto", qnaDTO);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/qna/qnaUpdate.jsp");
			
			
		}
		
		
	

		return actionForward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path="";
		boolean check= true;
		//qnaDAO.delete() 이거 호출하기
		
		Connection conn=null;
		BoardDTO boardDTO = new BoardDTO();
		int num = Integer.parseInt(request.getParameter("num"));
		int result = 0;
		try {
			conn = DBConnector.getConnect();
			result = qnaDAO.delete(num, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(result>0) {
			request.setAttribute("message", "삭제성공");
			request.setAttribute("path", "./qnaList");
			check=true;
			path="../WEB-INF/views/common/result.jsp";
		}else {
			request.setAttribute("message", "삭제실패");
			request.setAttribute("path", "./qnaList");
			path="../WEB-INF/views/common/result.jsp";
		}
		
		actionForward.setCheck(true);
		actionForward.setPath(path);
		return actionForward;
	}

}
