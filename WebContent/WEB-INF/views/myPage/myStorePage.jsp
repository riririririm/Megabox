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
#store_table{
	height: 500px;
}
.store_content{
	border-collapse: collapse;
	border-top: 3px solid #503396;
	border-bottom: 1px solid #e1e1e1;
}

#store_table h4{
	margin: 50px 0px 30px 0px;
	letter-spacing: 2px;
}
.store_content tr:last-child{
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
					<li>
						<a href="${pageContext.request.contextPath}/myPage/bookPage">
						<img src="../images/book.PNG"></a>
					</li>
					<li>
						<a href="./myStorePage"></a>
						<img src="../images/store.PNG">
					</li>
					<li>
						<a href="./">
						<img src="../images/personal_info.PNG"></a>
					</li>
					<li>
						<a href="./myQnA">
						<img src="../images/qna.PNG" style="margin-right: 0px;"></a>
					</li>
				</ul>
			</div>
			<!-- 이미지 div -->
			<div class="reset"></div>
			<div id="store_table" >
				<h4 >스토어 구매내역</h4>
				<table class="store_content table">
					<tr>
						<td>구분</td>
						<td>구매일</td>
						<td>상품명</td>
						<td>사용횟수</td>
						<td>구매수량</td>
						<td>결제내역</td>
						<td>쿠폰정보</td>
						<td>취소가능일</td>
					</tr>
					<tr>
						<td colspan="8" style="padding-top: 130px;">등록된 구매내역이 없습니다.</td>
					</tr>
				</table>
				<div>
					<ul class="">
						<li>스토어 상품은 부분 환불이 불가합니다.<br>(ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다.)</li>
						<li>MMS(모바일 상품권) 재전송은 최대 3회까지만 가능하며, 재전송 시에는 SMS형태로 전송됩니다.</li>
					</ul>
				</div>
				<h4 >취소내역</h4>
				<table class="store_content table">
				<c:forEach items="${list}" var="dto">
					<c:if test="${dto.state} eq 0">
						<tr>
							<td>구매일</td>
							<td>상품명</td>
							<td>구매수량</td>
							<td>결제내역</td>
							<td>취소일시</td>
						</tr>
					</c:if>
					<c:if test="${dto.state} eq null">
						<tr>
							<td colspan="5" style="padding-top: 130px;">등록된 취소내역이 없습니다.</td>
						</tr>
					</c:if>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
</body>
</html>