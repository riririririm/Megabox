<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	  .dropdown {
	  position: relative;
	  display: inline-block;
	   width:80px;
    	text-align:center;
   		 padding:15px 0px 15px 0px;
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  padding: 12px 16px;
	  cursor : hand;
	}
	
	.dropdown:hover .dropdown-content {
	  display: block;
	}
	
	.member_drop{
		width: 250px;
		height: 250px;
	}
	
	.member_hand{
		cursor: pointer;
	}
	
	.join_title Strong{
		color: #6E2FC7;
	}
	.join_title h5 {
		font-weight: bold;
	}

</style>
</head>
<body>
	<div class="dropdown">
		<c:if test="${sessionScope.member eq null }">
			<a class="member_hand" style="text-decoration: none; color: #777">로그인</a>
		</c:if>
		<c:if test="${sessionScope.member ne null }">
			<a class="member_hand" style="text-decoration: none; color: #777">${member.id}</a>
		</c:if>
		<div class="dropdown-content">
			<div class="member_drop">
				<c:if test="${sessionScope.member ne null }">
					<h3>${member.id}</h3>
					<a href="${pageContext.request.contextPath}/myPage/myPage">MyPage</a>
					<a href="<%=application.getContextPath()%>/member/memberLogout">Logout</a>
				</c:if>
				<c:if test="${sessionScope.member eq null}">
					<div>
						<form method="post" action="${pageContext.request.contextPath}/member/memberLogin">
							<div class="join_title">
								<h5><Strong>MEGABOX</Strong> Login</h5>
							</div>
							<div class="join_content">
								<input type="text" placeholder="아이디" id="member_id" name="id" value="${cookie.ckbox.value}" >
								<input type="password" placeholder="비밀번호" id="member_pw" name="pw">
							</div>
							<div class="join_content">
								<button>LOGIN</button>
								<input type="checkbox" id="remember" name="remember">ID기억
							</div>
								
						</form>
					</div>
					<div>
						<hr>
						<a href="${pageContext.request.contextPath}/member/memberCheck">회원가입</a>
						<a>ID/PW찾기</a>
					</div>
				</c:if>
			</div>
			<!-- dropdown부분 -->
		</div>
	</div>
	<!-- dropdown login 부분 -->
</body>
</html>