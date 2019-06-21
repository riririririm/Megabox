<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#noticeArea {
	margin: 0 auto;
	width: 500px;
}

.imgs {
	margin-top: 100px;
	height: 200px;
}

.table {
	margin-top: 90px;
}

.container {
	min-height: 500px;
}
</style>
<c:import url="../temp/bootstrap.jsp" />
<script type="text/javascript">

</script>
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

			<p style="font-size: 20px; margin-top: 10px; font-weight: bold; color: #000000;">공지사항,
				메가박스의 최신소식을 알려드립니다</p>
		</div>
		<div class="table">
			<table class="table">

				<tr>
					<td>NO</td>
					<td>제목</td>
					<td>등록일</td>
				</tr>


				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.num}</td>
						<td><c:catch>
								<c:forEach begin="1" end="${dto.depth}" varStatus="i">
						--
						<c:if test="${i.last}">&gt;</c:if>
								</c:forEach>
							</c:catch> <a href="./noticeSelect?num=${dto.num}">${dto.title}</a></td>

						<td>${dto.reg_date}</td>

					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="container">
			<ul class="pager">
				<c:if test="${pager.curBlock gt 1}">
					<li class="previous"><a
						href="./noticeList?curPage=${pager.startNum-1}">Previous</a></li>
				</c:if>

				<li>
					<ul class="pagination">
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i" step="1">
							<li><a
								href="./noticeList?curPage=${i}">${i}</a></li>
						</c:forEach>
					</ul>
				</li>

				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li class="next"><a
						href="./noticeList?curPage=${pager.lastNum+1}">Next</a></li>
				</c:if>
			</ul>



			<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
           <input type="button" value="Write" style="float:right">
            <%} %> --%>
            
            <c:if test="${id eq 'admin' }">
            
			<a href="<%=application.getContextPath()%>/notice/noticeWrite">
				<input type="button" value="글작성" style="float: right" >
			</a>
			</c:if>
		</div>
	</div>
	<c:import url="../temp/footer.jsp" />
</body>
</html>