package com.megabox.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	//개인정보 수정 
	public int update(Connection conn, MemberDTO memberDTO)throws Exception{
		int result=0;
		String sql = "update member set phone=? and email=? and name=? where id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, memberDTO.getPhone());
		st.setString(2, memberDTO.getEmail());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getId());
		
		result = st.executeUpdate();
		st.close();
		return result;
	}
	//비밀번호 확인
	public MemberDTO pwCheck(Connection conn, String id, String pw) throws Exception{
		MemberDTO memberDTO = null;
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		st.setString(2, pw);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			memberDTO = new MemberDTO();
			memberDTO.setId(rs.getNString("id"));
			memberDTO.setPw(rs.getString("pw"));
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("Email"));
			memberDTO.setPhone(rs.getString("phone"));
		}
		rs.close();
		st.close();
		return memberDTO;
	}
	
	//로그인
	public MemberDTO memberLogin(Connection conn, MemberDTO memberDTO) throws Exception{
		MemberDTO member = null; //로그인 성공 실패를 가르기 위해서 새로운 객체생성
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			member = new MemberDTO();
			member.setId(rs.getNString("id"));
			member.setPw(rs.getString("pw"));
			member.setName(rs.getString("name"));
			member.setEmail(rs.getString("Email"));
			member.setPhone(rs.getString("phone"));
		}
		rs.close();
		st.close();
		return member;
	}
	
	//아이디 중복 찾기
	public int idCheck(Connection conn, String id)throws Exception{
		int result = 1;
		String sql = "select * from member where id=?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			result = 0;
		}
		rs.close();
		st.close();
		return result; //0이면 아이디를 사용할 수 있다. 
	}
	//회원가입
	public int memberJoin(Connection conn, MemberDTO memberDTO) throws Exception {
		int result = 0;
		String sql = "insert into member values (?, ?, ?, ?, ?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		result = st.executeUpdate();
		st.close();
		return result;
	}
	
	
}
