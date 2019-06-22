<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#noticeArea{
	margin:0 auto;
	width:500px;
}
.imgs{
	margin-top:100px;
	height:200px;
	
}

.table{
	margin-top:100px;
}
.agreement{
	margin-top:120px;

}
.h{
	font-size:15px;
	color:black;
}
.agreeradio{
	float:right;
}
.text{
	height:165px;
	padding:15px;
	border:1px solid #e8e7e7;
	overflow:hidden;
	overflow-y:scroll;
}
#registration{
	background-color:#330066;
	color:white;
	margin-left:560px;
}

textarea{
	width:900px;
	height:200px;
	resize:none;
}

#title{
	width:900px;
}





</style>
<script type="text/javascript">

</script>
<c:import url="../temp/bootstrap.jsp"/> 
</head>
<body>
	<c:import url="../temp/header.jsp" />
	<div class="container">
		<div class="imgs">
			<div class="top"
				style="height: 40px; background: #e6e6e6; margin-bottom: 10px">
				<p
					style="font-size: 15px; color: #330066; font-weight: bold; padding-top: 10px">고객센터</p>
				<div class="top2" style="height: 3px; background: purple;"></div>
			</div>

			<a href="<%=application.getContextPath()%>/notice/noticeList"><img
				src="../images/notice.PNG" alt="notice"></a> <a
				href="<%=application.getContextPath()%>/qna/qnaList"><img
				src="../images/qna1.PNG" alt="qna"></a> <img
				src="../images/dreamcenter.PNG" alt="dreamcenter"
				style="float: right">


			<p
				style="font-size: 20px; margin-top: 10px; font-weight: bold; color: #000000;">문의/접수</p>
			<p style="font-size: 13px;">
				-메가박스에서 문의하실 사항이 있다면 '문의/접수'를 통해 접수해주세요<br> -접수하신 글은 비밀글로 등록되어
				작성자와 관리자만 확인 가능합니다
			</p>
			<!-- <p style="font-size:15px; font-weight:bold;">개인정보수집에 대한 동의</p>  -->
		</div>

		<div class="agreement">
			<div class="user_wrap">

				<!-- <p style="font-size:15px; font-weight:bold;">개인정보수집에 대한 동의</p> -->
				<h3 class="h">개인정보수집에 대한 동의</h3>
				<div class="text" tabindex="0">
					<dl>

						<dd>귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집.이용에 대한 본인동의가 필요한 항목입니다.</dd>
						<br>
						<dt id="a1">개인정보의 수집 및 이용목적</dt>
						<dd>회사는 문의/접수 내역의 확인, 요청사항 처리 또는 완료시 원활한 의사소통 경로 확보를 위해 수집하고
							있습니다</dd>
						<br>
						<dt id="a2">수집하는 개인정보의 항목</dt>
						<dd>이름, 연락처, 이메일주소</dd>
						<br>
						<dt id="a3">개인정보의 보유기간 및 이용기간</dt>
						<dd>
							문의접수 ~ 처리 완료 후 6개월<br> (단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는
							관계법령에 따라 보존)<br> 자세한 내용은 개인정보 처리방침을 확인하시기 바랍니다.
						</dd>
					</dl>
				</div>


				<p>
					개인정보 수집에 동의하십니까?<br> ※ 원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우
					서비스를 이용하실 수 없습니다.
				</p>
				<div class="agreeradio">
					<label><input type="radio" name="rdbox" checked="checked">동의함</label>
					<label><input type="radio" name="rdbox">동의하지않음</label>
				</div>



				<div class="table">
					<form method="post" action="./qnaWrite">
						<table class="table">
							<tr>
								<td style="background: #e6e6e6; width: 220px">이름</td>
								<td><input type="text" id="writer" name="writer" value="${sessionScope.member.id }"
									class="contents" readonly="readonly"></td>
							</tr>
							<tr>
								<td style="background: #e6e6e6; width: 220px">제목</td>
								<td><input type="text" id="title" name="title"
									class="contents"></td>
							</tr>
							<tr>
								<td style="background: #e6e6e6; width: 220px">내용</td>
								<td><textarea id="contents" name="contents"></textarea></td>
							</tr>
							<tr>
								<td style="background: #e6e6e6; width: 220px">비밀번호</td>
								<td><input type="text" id="pw" name="pw" class="contents">
								<td>
							</tr>

						</table>
						<input type="submit" value="등록" id="registration" class="btn">
					</form>

				</div><!-- end of table -->
			</div>
		</div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
</html>