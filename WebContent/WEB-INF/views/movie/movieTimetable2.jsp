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
	p{
		font-size: 20px;
	}
	.movie-list>ul>li{
		list-style: none;
		border-bottom: 1px solid #9999;
		height: 40px;
		align-items: center;
	}
	.container{
		min-height:2000px;
		margin-top: 50px;
	}
	.step1{
		width:25%;		
		float: left;
	}
	.col-head{
		color:white;
		text-align: center;
		vertical-align: middle;
		background-color: #555;
	}
	.col-body {
	height: 500px;
	overflow: auto;
	}
	.col-body>ul{
		width: :100%;
	}
	

</style>
<script type="text/javascript">
	$(function() {
		var m="";//movie
		var th=""; //theater
		var d=""; //date
		var sh=""; //showtime
	
		$(".movie").click(function() {
			m = $(this).text().trim();
			alert(m);
		});
		$(".theater").click(function() {
			th = $(this).text().trim();
			alert(th);
		});
		$(".date").click(function() {
			d = $(this).text().trim();
			alert(d);
		});
		$(".showtime").click(function() {
			sh = $(this).text().trim();
			alert(sh);
		});
	});
</script>
</head>
<body>

	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
		<h1> (일반)상영시간표 리스트 </h1>
		<div class="steps">
			<div class="step1">
				<div class="col-head">
					<p>영화</p>
				</div>
				<div class="col-body">
					<!-- 영화선택  or 선택되어 있게 -->
					<div class="movie-list">
						<ul>
							<c:forEach items="${movie}" var="dto">
								<li class="movie">${dto.movie_title}(${dto.movie_kind})</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!---------step1 영화 ---------->
			
			<div class="step1">
				<div class="col-head">
					<p>극장</p>
				</div>
				<div class="col-body">
					<div class="movie-list">
						<ul>
							<c:forEach items="${theater}" var="dto">
								<li class="theater">${dto.theater_name}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!----------step2 극장---------->
			
			
			<div class="step1">
				<div class="col-head">
					<p>날짜</p>
				</div>
				<div class="col-body">
					<div class="movie-list">
						<ul>
							<c:forEach items="${dates}" var="date">
								<li class="date">${date }</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!----------step3 날짜---------->
			
			<div class="step1">
				<div class="col-head">
					<p>시간</p>
				</div>
				<div class="col-body">
					<div class="movie-list">
						<ul>
							<c:forEach items="${dates}" var="date">
								<li class="showtime">${date }</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!----------step4 시간---------->
		
		</div> 
		<!-- end of steps -->
		
		<form action="" method="post" id="bookInfo">
			<input type="hidden" class="form-group" id="movie_code" name="movie_code">
			<input type="hidden" class="form-group" id="movie_title" name="movie_title">
			<input type="hidden" class="form-group" id="theater" name="theater">
			<input type="hidden" class="form-group" id="view_date" name="view_date">
			<input type="hidden" class="form-group" id="auditorium" name="auditorium">
			<input type="hidden" class="form-group" id="show_time" name="show_time">
		</form>
	</div>
	
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>