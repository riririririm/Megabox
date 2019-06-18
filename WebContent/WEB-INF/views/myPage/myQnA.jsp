<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp" />
<style type="text/css">
	.container {
	width: 100%;
	height: 1500px; padding : 3% 0 0 0; position : relative;
	overflow: hidden;
	padding: 3% 0 0 0;
	position: relative;
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

.myQnA h4{
	margin: 50px 0px 30px 0px;
	letter-spacing: 2px;
}
.qna_content{
	margin-top:100px;
	border-collapse: collapse;
	border-top: 3px solid #503396;
	border-bottom: 1px solid #e1e1e1;
}

.qna_content tr:last-child{
	text-align: center;
	height: 300px;
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
		<!-- 나의 메가박스 -->
		<div class="myPage">
			<div class="myPage_nav">
				<ul style="padding-left: 0px;">
					<li><a
						href="${pageContext.request.contextPath}/myPage/bookPage"> <img
							src="../images/book.PNG"></a></li>
					<li><a href="./myStorePage"></a> <img
						src="../images/store.PNG"></li>
					<li><img src="../images/personal_info.PNG"></li>
					<li>
						<a href="./myQnA">
						<img src="../images/qna.PNG" style="margin-right: 0px;"></a>
					</li>
				</ul>
			</div>
			<div class="reset"></div>
			<div>
				<div class="myQnA">
					<h4>나의 문의내역</h4>
					<ul>
						<li>고객센터에서 남겨주신 문의내역을 모두 확인하실 수 있습니다.</li>
						<li>문의하시기 전에 FAQ를 확인하시면 궁금점을 더욱빠르게 해결하실 수 있습니다.</li>
					</ul>
					<div>
						<button>1:1문의</button>
						<select>
							<option>전체</option>
							<option>미답변</option>
							<option>답변완료</option>
							<option>답변완료(메일+SMS)</option>
							<option>답변완료(메일)</option>
							<option>답변완료(SMS)</option>
						</select>
						<input placeholder="검색어를 입력하세요" type="text">
					</div>
					<table class="qna_content table">
						<tr>
							<td>NO</td>
							<td>제목</td>
							<td>답변상태</td>
							<td>등록일</td>
						</tr>
						<tr>
							<td colspan="8" style="padding-top: 130px;">조회된 문의내역이 없습니다.</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
</body>
</html>