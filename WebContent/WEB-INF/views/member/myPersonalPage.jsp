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
				<!-- 비밀번호 확인하는 부분 -->
				<div>
					<form method="post" action="./myPersonalPage">
						<table>
							<tr>
								<th>*아이디</th>
								<th>${member.id}</th>
							</tr>
							<tr>
								<th>*비밀번호</th>
								<th><input type="password" name="password"></th>
							</tr>
							<tr>
								<th><button type="submit" id="btn" value="0">확인</button></th>
								<th><div class="pwck" title="${check}">${pwCheck}</div>
							</tr>
						</table>
					</form>
				</div>
				<!-- 비밀번호 확인하는 부분 -->
				<div>
				
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
	<script type="text/javascript">
			var pwck = $('.pwck').attr('title');
			var id = '${member.id}';
			var pw = '${member.pw}';
			var name = '${member.name}';
			var phone = '${member.phone}';
			var email = '${member.email}';
			$('#btn').click(function() {
				if(pwck=='1'){
					$.post("./myPersonalUpdate", 
						{
							
						}, function(data) {
						

						});
					
				}
			});
	</script>
</body>
</html>











