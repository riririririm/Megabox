<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영시간표</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<style type="text/css">
	.container{
		min-height: 800px;
		margin-top: 50px;
	}
</style>
</head>
<body>

	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
		<h1> (관리자)상영시간표 리스트 </h1>
		<a href="./movieReg" class="btn btn-primary">영화등록</a>
		<table class="table table-hover">
			<tr>
				<td>영화코드</td>
				<td>카테고리</td>
				<td>영화명</td>
				<td>극장</td>
				<td>상영관</td>
				<td>상영일</td>
				<td>상영시간</td>		
			</tr>

			<c:forEach items="${movie}" var="dto" varStatus="i">
				<tr>
					<td>${dto.movie_code}</td>
					<td>${dto.movie_kind}</td>
					<td>${dto.movie_title}</td>
					<td>${dto.theater}</td>
					<td>${dto.auditorium}</td>
					<td>${dto.view_date}</td>
					<td>
						<c:forEach items="${showtime}" var="st" varStatus="j">
							<c:if test="${i.index eq j.index }">
							<c:forEach items="${st}" var="sdto" varStatus="k">
								${sdto.show_time}
							</c:forEach>
							
							</c:if>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>