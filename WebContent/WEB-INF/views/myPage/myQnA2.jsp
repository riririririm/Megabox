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
	height:1000px;
	padding: 3% 0 0 0;
	position: relative;
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

.myQnA h4 {
	margin: 50px 0px 30px 0px;
	letter-spacing: 2px;
}

.qna_content {
	margin-top: 100px;
	border-collapse: collapse;
	border-top: 3px solid #503396;
	border-bottom: 1px solid #e1e1e1;
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
					<li><a href="./myStorePage"> <img
							src="../images/store.PNG"></a></li>
					<li><a href="../member/myPersonalPage"><img
							src="../images/personal_info.PNG"></a></li>
					<li><a href="./myQnA"> <img src="../images/qna.PNG"
							style="margin-right: 0px;"></a></li>
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
					<form action="./myQnA?kind=${pager.search.kind}&search=${pager.search.search}">
						<div>
							<select name="kind" id="select">
								<option value="all">전체</option>
								<option value="no">미답변</option>
								<option value="ok">답변완료</option>
							</select> <input placeholder="검색어를 입력하세요" type="text" name="search"
								id="search">
							<button id="btn">검색</button>
						</div>
					</form>
					<table class="qna_content table">
						<tr>
							<td>NO</td>
							<td>제목</td>
							<td>답변상태</td>
							<td>등록일</td>
						</tr>
						<c:if test="${qnaList eq null}">
							<tr>
								<td colspan="8" style="padding-top: 130px; text-align: center; height: 300px;">
								조회된 문의내역이 없습니다.</td>
							
							</tr>
						</c:if>
						<c:if test="${qnaList ne null}">
							<c:forEach items="${qnaList}" var="qna">
							<tr>
								<td>${qna.num}</td>
								<td>${qna.title}</td>
								<td>${qna.state}</td>
								<td>${qna.reg_date}</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
					<!-- 페이지 나누는 부분 -->
					<c:if test="${qnaList ne null}">
						<div>
							<ul class="pager">
								<c:if test="${pager.curBlock gt 1}">
								<li class="previous">
									<a href="./myQnA?curPage=${pager.startNum-1}&kind=${pager.search.kind}&search=${pager.search.search}">Previous</a>
								</li>
								</c:if>
								<li>
									<ul class="pagination">
										<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i" step="1">
											<li><a href="./myQnA?curPage=${i}&kind=${pager.search.kind}&search=${pager.search.search}">${i}</a></li>
										</c:forEach>
									</ul>
								</li>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
								<li class="next">
									<a href="./myQnA?curPage=${pager.lastNum+1}&kind=${pager.search.kind}&search=${pager.search.search}">Next</a>
								</li>
								</c:if>
							</ul>
						</div>
					</c:if>
					<!-- 페이지 나누는 부분 -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
	<script type="text/javascript">
		
	</script>
</body>
</html>