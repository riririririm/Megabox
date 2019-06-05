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
	.step1{
		width:25%;		
		height: 30px;
		background: #555;
	}
	.col-head{
		color:white;
		text-align: center;
		vertical-align: middle;
	}
	.col-head>h3{
		color:white;
	}
</style>
</head>
<body>

	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
		<h1> (일반)상영시간표 리스트 </h1>
		<div class="steps">
			<div class="step1">
				<div class="col-head">
					<h3>영화</h3>
				</div>
				<div class="col-body">
					<!-- 영화선택  or 선택되어 있게 -->
					<div class="movie-list">
						<ul>
							<c:forEach items="${movie}" var="dto">
								<li>${dto.movie_title}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		
		</div> <!-- end of steps -->
	</div>
	
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>