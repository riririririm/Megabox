package com.megabox.board.notice;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;

import com.megabox.board.BoardDTO;
import com.megabox.page.SearchMakePage;
import com.megabox.page.SearchPager;
import com.megabox.page.SearchRow;
import com.megabox.upload.UploadDAO;
import com.megabox.upload.UploadDTO;
import com.megabox.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class NoticeService implements Action{
	private NoticeDAO noticeDAO;
	private UploadDAO uploadDAO;

	public NoticeService() {
		noticeDAO = new NoticeDAO();
		uploadDAO = new UploadDAO();
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {

		ActionForward actionForward = new ActionForward();

		int curPage=1;
		try {
			curPage= Integer.parseInt(request.getParameter("curPage"));
		}catch (Exception e) {
			// TODO: handle exception
		}

		String kind = request.getParameter("kind");
		String search = request.getParameter("search");


		/////////////////////////////////////////////////////////////
		SearchMakePage s = new SearchMakePage(curPage, kind, search);

		//1. row
		SearchRow searchRow = s.makeRow();
		List<BoardDTO> ar=null;
		Connection con = null;
		try {
			con = DBConnector.getConnection();
			ar = noticeDAO.selectList(searchRow, con);
			//2. page
			int totalCount= noticeDAO.getTotalCount(searchRow, con);
			SearchPager searchPager = s.makePage(totalCount);

			request.setAttribute("pager", searchPager);
			request.setAttribute("list", ar);
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/notice/noticeList.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "Sever Error");
			request.setAttribute("path", "../index.do");
			actionForward.setCheck(true);
			actionForward.setPath("../WEB-INF/views/common/result.jsp");
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return actionForward;
	}




	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();

		BoardDTO boardDTO=null;
		List<UploadDTO> ar = null;
		Connection con = null;
		try {
			con = DBConnector.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			boardDTO = noticeDAO.selectOne(num, con);
			ar = uploadDAO.selectList(num, con);
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
		String path="";
		if(boardDTO != null) {
			request.setAttribute("dto", boardDTO);
			request.setAttribute("upload", ar);
			path ="../WEB-INF/views/notice/noticeSelect.jsp";
		}else {
			request.setAttribute("message", "No Data");
			request.setAttribute("path", "./noticeList");
			path="../WEB-INF/views/common/result.jsp";
		}
		//글이 있으면 출력
		//글이 없으면 삭제되었거나 없는 글입니다.(alert) 리스트로 
		actionForward.setCheck(true);
		actionForward.setPath(path);
		return actionForward;

	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/notice/noticeWrite.jsp");
		String method = request.getMethod();
		if(method.equals("POST")) {
			String saveDirectory = request.getServletContext().getRealPath("upload");
			File f = new File(saveDirectory);
			if(!f.exists()) {
				f.mkdirs();
			}
			int maxPostSize=1024*1024*100;
			Connection con = null;
			try {
				MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
				Enumeration<String> e= multipartRequest.getFileNames();//파일의 파라미터 이름들
				ArrayList<UploadDTO> ar = new ArrayList<UploadDTO>();
				while(e.hasMoreElements()) {
					String s = e.nextElement();
					String fname = multipartRequest.getFilesystemName(s);
					String oname = multipartRequest.getOriginalFileName(s);
					UploadDTO uploadDTO = new UploadDTO();
					uploadDTO.setFname(fname);
					uploadDTO.setOname(oname);
					ar.add(uploadDTO);
				}
				NoticeDTO noticeDTO = new NoticeDTO();
				noticeDTO.setTitle(multipartRequest.getParameter("title"));
				noticeDTO.setWriter(multipartRequest.getParameter("writer"));
				noticeDTO.setContents(multipartRequest.getParameter("contents"));

				con = DBConnector.getConnection();

				//1.시퀀스번호
				int num = noticeDAO.getNum();
				noticeDTO.setNum(num);
				con.setAutoCommit(false);
				//2. notice insert
				num = noticeDAO.insert(noticeDTO, con);

				//3. upload insert
				for(UploadDTO uploadDTO:ar) {
					uploadDTO.setNum(noticeDTO.getNum());
					num = uploadDAO.insert(uploadDTO, con);
					if(num<1) {
						throw new Exception();
					}
				}

				con.commit();

			} catch (Exception e) {
				e.printStackTrace();
				// TODO Auto-generated catch block
				try {
					con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}finally {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			actionForward.setCheck(false);
			actionForward.setPath("./noticeList");

		}//post끝



		return actionForward;
	}


	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		BoardDTO boardDTO = null;
		Connection conn = null;
		boolean check=true;
		String path="";
		if(method.equals("POST")) {
			String saveDirectory = request.getServletContext().getRealPath("upload");
			File f = new File(saveDirectory);
			if(!f.exists()) {
				f.mkdirs();
			}
			int maxPostSize=1024*1024*100;
			boardDTO = new BoardDTO();
			//noticeDAO.update(boardDTO, conn);
			MultipartRequest multipartRequest;
			try {
				multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
				boardDTO.setNum(Integer.parseInt(multipartRequest.getParameter("num")));
				boardDTO.setTitle(multipartRequest.getParameter("title"));
				boardDTO.setContents(multipartRequest.getParameter("contents"));

				int result=0;
				try {
					conn=DBConnector.getConnection();
					result=noticeDAO.update(boardDTO, conn);

					if(result>0) {
						actionForward.setCheck(false) ;
						actionForward.setPath("./noticeList");
					}else {
						request.setAttribute("message", "Update Fail");
						request.setAttribute("path", "./noticeSelect");
						check=true;
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
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}


		}else {
			List<UploadDTO> ar = null;
			int num = Integer.parseInt(request.getParameter("num"));

			try {
				conn = DBConnector.getConnection();
				boardDTO = noticeDAO.selectOne(num, conn);
				ar = uploadDAO.selectList(num, conn);
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
			request.setAttribute("dto", boardDTO);
			request.setAttribute("upload",ar);
			actionForward.setCheck(true) ;
			actionForward.setPath("../WEB-INF/views/notice/noticeUpdate.jsp");
		}


		return actionForward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {

		ActionForward actionForward = new ActionForward(); 
	//	String method = request.getMethod();
		Boolean check=true;
		String path="";

			
			Connection conn = null;
			int result=0;
			BoardDTO boardDTO = new BoardDTO();
			int num= Integer.parseInt(request.getParameter("num"));
			
			try {
				conn = DBConnector.getConnection();
				result=noticeDAO.delete(num, conn);
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
			
			if(result>0) {
				request.setAttribute("message", "삭제성공");
				request.setAttribute("path", "./noticeList");
				check=true;
				path="../WEB-INF/views/common/result.jsp";
			}else {
				request.setAttribute("message", "삭제실패");
				request.setAttribute("path", "./noticeList");
				check=true;
				path="../WEB-INF/views/common/result.jsp";
			}
			
			actionForward.setCheck(true) ;
			actionForward.setPath(path);

		return actionForward;
	}

}