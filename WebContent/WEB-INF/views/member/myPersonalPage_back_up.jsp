<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp" />
<style type="text/css">
.container {
	width: 100%;
	height: 1500px;
	padding: 3% 0 0 0;
	position: relative;
	overflow: hidden;
}

.sub_navi {
	background-color: #f2f2f2;
	border-top: 1px solid #e1e1e1;
	border-bottom: 3px solid #503396;
}

.sub_navi .sub_navi_wrap {
	position: relative;
	width: 970px;
	margin: 0 auto;
}

.clearfix li {
	list-style: none;
}

.join_form {
	margin-top: 20px;
}

.join_form p {
	font-size: 20px;
}

.myPage {
	width: 970px;
	margin: 0 auto;
	height: 1300px;
}

.myPage_nav li {
	list-style: none;
	margin-top: 40px;
}

.myPage img {
	margin-right: 120px;
	float: left;
	border: 1px solid #ddd;
}

</style>
</head>
<body>
	<jsp:include page="../temp/header.jsp" />
	<div class="container">
		<div class="sub_navi">
			<div class="sub_navi_wrap">
				<ul class="clearfix join_form" style="padding-left: 22px;">
					<li>
						<p>나의 메가박스</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="myPage">
			<div class="myPage_nav">
				<ul style="padding-left: 0px; height: 200px;">
					<li><a
						href="${pageContext.request.contextPath}/myPage/bookPage"><img
							src="../images/book.PNG"></a></li>
					<li><a
						href="${pageContext.request.contextPath}/myPage/myStorePage"><img
							src="../images/store.PNG"></a></li>
					<li><img src="../images/personal_info.PNG"></li>
					<li><a href="./myQnA"> <img src="../images/qna.PNG"
							style="margin-right: 0px;"></a></li>
				</ul>
			</div>
			<!-- 마이메가박스, 이미지 창부분 -->
			<div>
				<div>
					<strong>개인정보 수정</strong> &nbsp;&nbsp;회원님의 정보를 정확히 입력해주세요.
				</div>
				<div>
					<button>비밀번호 변경</button>
					<button>회원탈퇴</button>
				</div>
				<div>
					<form method="post" action="./myPersonalPage">
						<table>
							<tr>
								<th>*아이디</th>
								<th>${member.id}</th>
							</tr>
							<tr>
								<th>*이름</th>
								<th>${member.name}</th>
							</tr>
							<tr>
								<th>*비밀번호</th>
								<th><input type="password" name="password"></th>
								<th><button type="submit" id="btn" value="0">확인</button></th>
								<th><div>${fail}</div>
							</tr>
						</table>
					</form>
					
					<!-- 개인정보 수정창 -->
					<form action="./personalUpdate">
						<table>
							<c:if test="${check eq '1'}">
							<tr class="hiden">
								<th>*휴대폰</th>
								<th><input type="text" name="p1" maxlength="3" value="${member.phone.substring(0, 3)}"></th>
								<th><input type="text" name="p2" maxlength="4" value="${member.phone.substring(4, 8)}"></th>
								<th><input type="text" name="p3" maxlength="4" value="${member.phone.substring(9, 13)}"></th>
							</tr>
							<tr class="hiden">
								<th>*이메일</th>
								<th><input type="text" name="email" maxlength="20" value="${member.email}"></th>
							</tr>
							<tr>
								<th>
									<button type="submit">개인정보 수정</button>
								</th>
							</tr>
							</c:if>
						</table>
					</form>
							
					
						
							
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
	<script type="text/javascript">
		$('.ddd').html("비밀번호를 다시 입력해주세요");
	</script>
</body>
</html>











