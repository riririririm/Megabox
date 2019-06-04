<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영시간표</title>
<jsp:include page="../temp/bootstrap.jsp"/>
</head>
<body>

	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
		<h1> 상영시간표 </h1>
		<a href="./storeReg" class="btn btn-primary">영화등록</a>
		<table class="table table-hover">
			<tr>
				<td>영화코드</td>
				<td>카테고리</td>
				<td>영화명</td>
				<td>극장</td>
				<td>상영관</td>
				<td>상영시간</td>		
			</tr>

			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.store_num}</td>
					<td id="cate${dto.store_num}">${dto.store_category}</td>
					<td id="num${dto.store_num}">
						<c:catch>
						<c:forEach begin="1" end="${dto.depth}" varStatus="i">
						--
						<c:if test="${i.last}">&gt;</c:if>
						</c:forEach>
						</c:catch>
						<a href="" class="alink" data-toggle="modal" data-target="#myModal" title="${dto.store_num}">${dto.store_name}</a></td>
					<td>${dto.store_theater}</td>
					<td>${dto.store_noTheater}</td>
					<td id="per${dto.store_num}">${dto.store_period}</td>
					<td id="count${dto.store_num}">${dto.store_count}</td>
					<td>${dto.store_cancel}</td>
					<td id="price${dto.store_num}">${dto.store_price}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>