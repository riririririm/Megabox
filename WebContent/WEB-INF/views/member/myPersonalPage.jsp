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
table tr th{
	border: 1px solid black; 
}

table{
	margin: auto;
	width: 800px;
	height: 250px;
	border-collapse: collapse;
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
					<li><a href="./myPersonalPage"><img src="../images/personal_info.PNG"></a></li>
					<li><a href="../myPage/myQnA"> <img src="../images/qna.PNG"
							style="margin-right: 0px;"></a></li>
				</ul>
			</div>
			<!-- 마이메가박스, 이미지 창부분 -->
			<div>
				<div>
					<h4><strong>개인정보 수정</strong></h4>
				</div>
				<!-- 비밀번호 확인하는 부분 -->
				<div class="personal" style="display: block;">
					
					<table  class="personal_table"style="margin-top: 70px">
						<tr>
							<th colspan="2">
							<div style="float : right">
								<input type="button" id="pwChange" value="비밀번호 변경">
								<input type="button" id="dropMember" value="회원탈퇴">
							</div>
							</th>
						</tr>
						<tr>
							<th><div>*아이디</div></th>
							<th><div>${member.id}</div></th>
						</tr>
						<tr>
							<th class="p1">*비밀번호</th>
							<th><input type="password" name="password" id="pw"></th>
						</tr>
						
						<tr>
							<th colspan="2"><div class="pw_text" ></div>
						</tr>
						<tr>
							<th colspan="2">
							<div>
							<input type="button" id="btn" value="개인정보 수정">
							</div>
							</th>
						</tr>
					</table>
				</div>
				<!-- 비밀번호 확인하는 부분 -->

				<!-- 회원정보 수정하는 부분 -->
				<div class="updateForm" style="display: none">
					<form action="./myPersonalUpdate" method="post" onsubmit="return update()">
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
								<th><input type="text" class="phone1" title="phone" name="phone1" value="${member.phone.substring(0, 3)}" maxlength="3">-
								<input type="text" class="phone2" title="phone" name="phone2" value="${member.phone.substring(4, 8)}" maxlength="4">-
								<input type="text" class="phone3" title="phone" name="phone3" value="${member.phone.substring(9, 13)}" maxlength="4"></th>
							</tr>
							<tr>
								<th>이메일</th>
								<th><input type="text" class="email"name="email" value="${member.email}"></th>
							</tr>
							<tr>
								<th><input type="submit" value="확인" id="ddddd"></th>
								<th><input type="button" id="updateCancel" value="취소"></th>
							</tr>
						</table>
					</form>
				</div>
				<!-- 회원정보 수정하는 부분 -->
				
				<!-- 비밀번호 수정 -->
				<div class="pwChage1" style="display:none">
				<form action="./myPwChange" method="post" onsubmit="return pwChange()">
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

	//onsubmit -> return pwChange 비밀번호확인 function
	function pwChange(){
		var pw1 = $('#changePW').val();
		var len = $('#changePW').val().length;
		var pattern1 = /[0-9]/; 
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*><]/;
		if(len<10||!pattern1.test(pw1)||!pattern2.test(pw1)||!pattern3.test(pw1)){
			alert("비밀번호는 영문, 숫자, 특수문자 조합 10자 이상");
			return false;
		}else{
			return true;
		}
	}
	
	//onsubmit -> return check 개인정보수정 확인 function
	function update() {
		var phone1 = $('.phone1').val().length;
		var phone2 = $('.phone2').val().length;
		var phone3 = $('.phone3').val().length;
		var email = $('.email').val();
		var n = email.indexOf("@");
		var dot = email.indexOf(".");
		if(phone1 != '3'){
			alert("번호 다시 입력");
			return false;
		}else if(phone2!='4'){
			alert("번호 다시 입력");
			return false;
		}else if(phone3!='4'){
			alert("번호 다시 입력");
			return false;
		}else if(n==-1 || dot ==-1){
			alert("이메일 형식으로 입력");
			return false;
		}else{
			return true;
		}
	}
	
		$('#updateCancel').click(function() {
			$('.personal').attr('style', 'display:block');
			$('#pw').val("");
			$('.updateForm').attr('style', 'display:none');
		});
		
		
		//비밀번호 확인 후 회원정보 수정하려는 소스
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
		//비밀번호 확인 후 회원정보 수정하려는 소스
		
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
