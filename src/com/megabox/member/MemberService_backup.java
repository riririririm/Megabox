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

				request.setAttribute("msg", "Login Fail");
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
	public ActionForward update2(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/member/myPersonalPage.jsp");
		/*if(memberDTO2!=null) {
		//개인정보 수정 메서드
		String phone1 = request.getParameter("p1");
		String phone2 = request.getParameter("p2");
		String phone3 = request.getParameter("p3");
		String phone = phone1+"-"+phone2+"-"+phone3;
		String email = request.getParameter("email");
		System.out.println(phone);
		System.out.println(email);
		System.out.println(name);
		System.out.println(id);
		MemberDTO memberDTOck = new MemberDTO();
		memberDTOck.setId(id);
		memberDTOck.setPhone(phone);
		memberDTOck.setEmail(email);
		memberDTOck.setName(name);
		int result = memberDAO.update(conn, memberDTOck);
		if(result>0) {
			actionForward.setPath("../WEB-INF/views/member/myPersonalPage.jsp");
			actionForward.setCheck(true);
		}
	}*/
		return actionForward;
	}
	
	//개인정보 수정
	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/member/myPersonalPage.jsp");
		Connection conn = null;
		String method = request.getMethod();
		if(method.equals("POST")) {
			try {
				HttpSession session = request.getSession();
				MemberDTO memberDTO =(MemberDTO)session.getAttribute("member");
				String pw = request.getParameter("password");
				if(memberDTO.getId()!=null) {
					//PW확인 메서드
					if(pw.equals(memberDTO.getPw())) {
						//로그인
						request.setAttribute("check", 1);
						request.setAttribute("fail", "");
					}else {
						request.setAttribute("fail", "비밀번호를 다시 입력해주세요");
					}
				}
				
			}catch (Exception e) {
				request.setAttribute("msg", "Login Fail");
				request.setAttribute("path", "../index.do");
				actionForward.setCheck(true);
				actionForward.setPath("../WEB-INF/views/common/result.jsp");
				e.printStackTrace();
			}
		}
		return actionForward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

}
