<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="personal" style="display: block;">
					
					<table>
						<tr>
							<th>*아이디</th>
							<th>${member.id}</th>
						</tr>
						<tr>
							<th>*비밀번호</th>
							<th><input type="password" name="password" id="pw"></th>
						</tr>
						<tr>
							<th><div class="pw_text" ></div>
						</tr>
						<tr>
							<th><input type="button" id="btn" value="확인"></th>
							<th><input type="button" value="비밀번호 변경" id="pwChange"></th>
							<th><input type="button" value="회원탈퇴" id="dropMember"></th>
						</tr>
					</table>
				</div>
				<!-- 비밀번호 확인하는 부분 -->

				<!-- 회원정보 수정하는 부분 -->
				<div class="updateForm" style="display: none">
					<form action="./myPersonalUpdate" method="post">
						<table>
							<tr>
								<th>아이디</th>
								<th>${member.id}</th>
							</tr>
							<tr>
								<th>이름</th>
								<th>${member.name}</th>
							</tr>
							<tr>
								<th>휴대폰</th>
								<th><input type="text" name="phone" value="${member.phone}"></th>
							</tr>
							<tr>
								<th>이메일</th>
								<th><input type="text" name="email" value="${member.email}"></th>
							</tr>
						</table>
						<input type="submit" value="확인">
						<input type="button" id="updateCancel" value="취소">
					</form>
				</div>
				<!-- 회원정보 수정하는 부분 -->
				
				<!-- 비밀번호 수정 -->
				<div class="pwChage1" style="display:none">
				<form action="./myPwChange" method="post">
					<table>
						<tr>
							<th>현재비밀번호</th>
							<th><input type="password" id="curpw" name="pw"></th>
						</tr>
						<tr>
							<th>새 비밀번호</th>
							<th><input type="text" id="changePW" name="new_pw"></th>
						</tr>
						<tr>
							<th>새 비밀번호 확인</th>
							<th><input type="text" id="newChangePW" name="new_pwck"></th>
						<tr>
						<tr>
							<th><input type="submit" value="확인"></th>
							<th><input  type="button" id="backBtn" value="취소"></th>
						</tr>
					</table>
				</form>
				</div>
				<!-- 비밀번호 수정 -->
				
				<!-- 회원탈퇴 폼 -->
				<div class="memberDrop" style="display:none">
					<form action="./dropMember" method="post">
						<table>
							<tr>
								<th>비밀번호 입력</th>
								<th><input type="password" id="dropPw" name="dropPw"></th>
							</tr>
							<tr>
								<th><input type="submit" value="탈퇴"></th>
							</tr>
						</table>
					</form>
				</div>
				<!-- 회원탈퇴 폼 -->
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
	<script type="text/javascript">
		$('#updateCancel').click(function() {
			$('.personal').attr('style', 'display:block');
			$('#pw').val("");
			$('.updateForm').attr('style', 'display:none');
		});
		$('#btn').click(function() {
			$.post("./myPersonalPage", {
				pw : $('#pw').val()
			}, function(data) {
				if(data.trim()=='0'){
					$('.pw_text').html("비밀번호를 다시 입력해주세요");
				}
				//0이면 display : none;
				//1이면 display : block;
				if (data.trim() == '1') {
					$('.personal').attr('style', 'display:none')
					$('.updateForm').attr('style', 'display:block');
				}
			});
		});
		
		$('#pwChange').click(function() {
			$('.personal').attr('style', 'display:none')
			$('.pwChage1').attr('style', 'display:block');
		});
		
		$('#dropMember').click(function() {
			$('.personal').attr('style', 'display:none');
			$('.memberDrop').attr('style', 'display:block');
		});
		
		$('#backBtn').click(function() {
			$('.personal').attr('style', 'display:block');
			$('.pwChage1').attr('style', 'display:none');
		});
	</script>
</body>
</html>











