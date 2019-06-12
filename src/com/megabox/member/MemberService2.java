package com.megabox.member;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.util.DBConnector;


public class MemberService implements Action{

	MemberDAO memberDAO;

	public MemberService() {
		memberDAO = new MemberDAO();
	}
	
	//비밀번호 바꿈
	public ActionForward myPwChange(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/common/result.jsp";
		boolean check = true;
		
		int result = 0;
		Connection conn = null;
		String method = request.getMethod();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(method.equals("POST")) {
			try {
				conn = DBConnector.getConnect();
				String id = memberDTO.getId();
				String new_pw = request.getParameter("new_pw");
				String new_pwck = request.getParameter("new_pwck");
				String pw = request.getParameter("pw");
				
				if(new_pw.equals(new_pwck)) {
					result = memberDAO.updatePw(conn, id, pw, new_pw);
				}else {
					request.setAttribute("message", "새로운 비밀번호가다름");
					request.setAttribute("path","./myPersonalPage" );
				}
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
				request.setAttribute("result", result);
				path = "./myPseronalPage";
				check = false;
			}else {
				request.setAttribute("message", "비밀번호 변경 실패");
				request.setAttribute("path", "./myPersonalPage");
			}
			
		}
		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}
	public ActionForward logout(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		request.getSession().invalidate();
		actionForward.setCheck(false);
		actionForward.setPath("../index.do");
		return actionForward;

	}
	public ActionForward idCheck(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String id =  request.getParameter("id");
		Connection conn = null;
		int result = 0;
		try {
			conn = DBConnector.getConnect();
			result = memberDAO.idCheck(conn, id); //0이면 아이디를 사용할 수 있다. 
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
		request.setAttribute("result", result);
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/common/result2.jsp");
		return actionForward;
	}
	public ActionForward memberCheck(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/member/memberCheck.jsp");
		return actionForward;
	}

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		String path = "../index.do";
		boolean check = true;
		HttpSession session=null;

		if(method.equals("POST")) {
			Connection conn = null;
			MemberDTO memberDTO = null;
			try {
				conn = DBConnector.getConnect();
				memberDTO = new MemberDTO();
				memberDTO.setId(request.getParameter("id"));
				memberDTO.setPw(request.getParameter("pw"));
				memberDTO = memberDAO.memberLogin(conn, memberDTO);
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

			if(memberDTO!=null) {
				session = request.getSession();
				session.setAttribute("member", memberDTO);
				path = "../index.do";
				check = false;
			}else {
				session = request.getSession();

				request.setAttribute("message", "Login Fail");
				request.setAttribute("path", "../index.do");
				check=true;
				path="../WEB-INF/views/common/result.jsp";
			}

			String ckbox = request.getParameter("remember");
			String id = request.getParameter("id");
			if(ckbox!=null) {
				//Cookie 변수 = new Cookie(이름, 값); -> 인스턴스 생성
				Cookie c = new Cookie("ckbox", id);
				c.setPath("/"); //root밑으로 다 사용할 것이다.
				c.setMaxAge(60*60); //유효기간 설정하기;
				response.addCookie(c);  //쿠키 저장하기.
			}else {
				Cookie c = new Cookie("ckbox", "");
				c.setPath("/"); //root밑으로 다 사용할 것이다.
				response.addCookie(c);
			}
		}
		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward =new ActionForward();
		boolean check = true;
		String path = "../WEB-INF/views/member/memberJoin.jsp";
		String method = request.getMethod();
		if(method.equals("POST")) {
			Connection conn = null;
			MemberDTO memberDTO = null;
			int result = 0;
			try {
				conn = DBConnector.getConnect();
				memberDTO = new MemberDTO();
				String phone1 = request.getParameter("phone1");
				String phone2 = request.getParameter("phone2");
				String phone3 = request.getParameter("phone3");
				String phone = phone1 + "-" + phone2 + "-" + phone3;
				memberDTO.setId(request.getParameter("id"));
				memberDTO.setPw(request.getParameter("pw1"));
				memberDTO.setName(request.getParameter("name"));
				memberDTO.setPhone(phone);
				memberDTO.setEmail(request.getParameter("email"));
				result = memberDAO.memberJoin(conn, memberDTO);
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
				check = false;
				path = "../index.do";
			}else {
				request.setAttribute("msg", "Join Fail");
				request.setAttribute("path", "./memberJoin");
				path = "../WEB-INF/views/common/result.jsp";
				check = true;

			}
		}
		actionForward.setCheck(check);
		actionForward.setPath(path);

		return actionForward;
	}

	//비밀번호 확인
	public ActionForward pwcheck(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = ("../WEB-INF/views/member/myPersonalPage.jsp");
		boolean check = true;
		
		String method = request.getMethod();
		
		if(method.equals("POST")) {
			try {
				HttpSession session = request.getSession();
				MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
				String pw = request.getParameter("pw");
				
				if(memberDTO.getId()!=null) {
					if(pw.equals(memberDTO.getPw())){
						request.setAttribute("result", 1);
					}else {
						request.setAttribute("result", 0);
					}
					
					path = "../WEB-INF/views/common/result2.jsp";
				}
			}catch (Exception e) {
				request.setAttribute("result", 0);
				path = "../WEB-INF/views/common/result2.jsp";
			}
		}
		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}

	
	//개인정보 수정
	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/common/result.jsp";
		boolean check = true;
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		MemberDTO memberDTO2 = (MemberDTO)session.getAttribute("member");
		Connection conn = null;
		MemberDTO memberDTO = null;
		int result = 0;
		try {
			conn = DBConnector.getConnect();
			memberDTO = new MemberDTO();
			memberDTO.setId(memberDTO2.getId());
			memberDTO.setPhone(phone);
			memberDTO.setEmail(email);
			result = memberDAO.update(conn, memberDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			memberDTO2.setPhone(memberDTO.getPhone());
			memberDTO2.setEmail(memberDTO.getEmail());
			path = "./myPersonalPage";
			check = false;
		}else {
			request.setAttribute("message", "수정실패");
			request.setAttribute("path", "./myPersonalPage");
		}
		
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}

	//회원 탈퇴
	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String path = "../WEB-INF/views/common/result.jsp";
		boolean check = true;
		String method = request.getMethod();
		Connection conn = null;
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = 0;
		String pw = null;
		String id = memberDTO.getId();
		if(method.equals("POST")) {
			pw = request.getParameter("dropPw");
			
			try {
				conn = DBConnector.getConnect();
				if(pw!=null) {
					result = memberDAO.delete(conn, id, pw);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(result>0) {
			session.invalidate();
			request.setAttribute("result", result);
			path = "../index.do";
			check = false;
		}else {
			request.setAttribute("message", "회원 탈퇴 실패");
			request.setAttribute("path", "./myPersonalPage");
		}
		actionForward.setPath(path);
		actionForward.setCheck(check);
		return actionForward;
	}

}
