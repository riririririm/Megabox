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
		margin:0;
	}
	.btn{
		padding:4px 8px;
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
		width:100%;		
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
	.btn span.fa-check {    			
		opacity: 0;				
	}
	.btn.active span.fa-check {				
		opacity: 1;				
	}
	
	.person_screen {
		border:1px solid #9999;
		height:175px;
		width:100%;
	}
	
	.number_of_person{
		width:50%;
		float:left;
		border-right:1px solid #9999;
		margin-top: 10px;
	}
	.t{
		margin-bottom: 10px;
	}
	.tt{
		float:left;
		margin-left: 60px;
	}
	.number_of_radio{
		margin-left:160px;
		
	}

	


</style>

</head>
<body>

	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
	<div class="all_list">
		<div class="steps">
			<div class="step1">
				<div class="col-head">
					<p>인원/좌석</p>
				</div>
				<div class="col-body">
					<div class="person_screen">
						<div class="number_of_person">
							<div class="t">
								<div class="tt">일반</div>
								<div class="number_of_radio" data-toggle="buttons">
								<c:forEach var="i" begin="0" end="8" step="1">
									<label class="rbtn btn btn-default">
										<input type="radio" name=auditorium value="${i}">${i}
										<span class="fa fa-check"></span>
									</label>
								</c:forEach>
								</div>
							</div>
							<div class="t">	
								<div class="tt">청소년</div>
								<div class="number_of_radio" data-toggle="buttons">
								<c:forEach var="i" begin="0" end="8" step="1">
									<label class="rbtn btn btn-default">
										<input type="radio" name=auditorium value="${i}">${i}
										<span class="fa fa-check"></span>
									</label>
								</c:forEach>
								</div>
							</div>
							<div class="t">	
								<div class="tt">어린이</div>
								<div class="number_of_radio" data-toggle="buttons">
								<c:forEach var="i" begin="0" end="8" step="1">
									<label class="rbtn btn btn-default">
										<input type="radio" name=auditorium value="${i}">${i}
										<span class="fa fa-check"></span>
									</label>
								</c:forEach>
								</div>
							</div>
							<div class="t">	
								<div class="tt">우대</div>
								<div class="number_of_radio" data-toggle="buttons">
								<c:forEach var="i" begin="0" end="8" step="1">
									<label class="rbtn btn btn-default">
										<input type="radio" name=auditorium value="${i}">${i}
										<span class="fa fa-check"></span>
									</label>
								</c:forEach>
								</div>
							</div>
						</div>
							
						<div class="section_of_screen">
						
						</div>
					</div>
				</div>
			
			</div>
		</div> 
		<!-- end of steps -->
		
	</div>
	<!-- end of all_list -->
	</div>
	<!-- end of container -->
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>