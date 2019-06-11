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
	.all_list{
		height:550px;
		background-color: #f2f2f2;
	}
	.form-div{
	margin-top:20px;
	background-color: #1b1b1b;
	width: 100%;
	height:150px;
	align-items: center;
	}
	.form-div >img{
		padding-top: 20px;
		padding-right: 20px;
	}
	.movie-list>ul>li{
		list-style: none;
		border-bottom: 1px solid #9999;
		height: 40px;
		align-items: center;
	}
	.container{
		min-height:900px;
		margin-top: 150px;
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
	.seat_btn{
		padding_top:50px;
		float:right;
	}
	.emp{
		width:212px;
	}
	.steps_img{
		padding-top:60px;
		padding-left:100px;
		float:left;
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
			
		});
		$(".theater").click(function() {
			th = $(this).text().trim();
			getDateList();
			
		});
		
		function getDateList(){
			$.post("./movieViewDate",{
				movie_title: m,
				theater: th
			},function(data){
				data = data.trim();
				$("#date-list").html(data);
			});
		};
		
		
		var date="";	
		$("#date-list").on("click",".date",function() {
			date = $(this).text().trim();
			$.post("./movieShowTime",{
				movie_title: m,
				theater: th,
				view_date:date
			},function(data){
				data = data.trim();
				$("#show_time-list").html(data);
			});
		});
		
	
	});
</script>
</head>
<body>

	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
	<div class="all_list">
		<div class="steps">
			<div class="step1">
				<div class="col-head">
					<p>영화</p>
				</div>
				<div class="col-body">
					<!-- 영화선택  or 선택되어 있게 -->
					<div class="movie-list">
						<ul>
							<c:forEach items="${movieTitle}" var="dto">
								<li ><span class="movie">${dto}</span></li>
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
						<ul id="date-list">
							
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
						<ul id="show_time-list">
							
						</ul>
					</div>
				</div>
			</div>
			<!----------step4 시간---------->
		
		</div> 
		<!-- end of steps -->
		
	</div>
	<!-- end of all_list -->
	<div class="form-div">
		<div class="steps_img">
		<span class="emp"><img src="../images/step_movie.png"></span>
		<span class="emp"><img src="../images/step_theater.png"></span>
		<span class="emp"><img src="../images/step_seat.png"></span>
		<span class="emp"><img src="../images/step_pay.png"></span>
		</div>
		<img class="seat_btn" src="../images/seat_btn1.png">
	</div>
		<form action="" method="post" id="bookInfo">
			<input type="hidden" class="form-group" id="movie_code" name="movie_code">
			<input type="hidden" class="form-group" id="movie_title" name="movie_title">
			<input type="hidden" class="form-group" id="theater" name="theater">
			<input type="hidden" class="form-group" id="view_date" name="view_date">
			<input type="hidden" class="form-group" id="auditorium" name="auditorium">
			<input type="hidden" class="form-group" id="show_time" name="show_time">
			
		</form>
	
	</div>
	<!-- end of container -->
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>