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
	.btn2{
		padding:4px 4px;
		width:25px;
		height:25px;
		border: 1px solid white;
		font-weight:bold;
		font-size:12px;
		background-image: url("../images/seat.png");
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
		height: 1000px;
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
	.section_of_screen{
		width:50%;
		float:left;
		padding:25px;
	}
	.info_header >span{
		font-size: 20px;
		font-weight:300;
	}	
	.screen_con_wrapper{
		width:100%;
	}
	.screen_wrapper{
		width:80%;
		float:left;
		text-align: center;
	}
	.screen_wrapper> .screen{
		background-color: #9999;
		height:30px;
		margin-top: 10px;
		padding-top:5px;
		font-weight: bold;
	}
	.screen_wrapper >.seat_wrap{
		width:100%;
		height:400px;
		text-align: center;
		border-left: 1px solid #9999;
    	border-bottom: 1px solid #9999;
	}
	.tb_seat{
		width:60%;
		margin: 20px 0px 0px 183px;
		
	}
	.td_font{
		color:#333;
		font-weight: bold;
	}
	.seat_info_wrapper{
		float: right;
		width:20%;
		height:450px;
		border: 1px solid #9999;
		margin-top: 10px;
		padding:20px;
	}
	#go_pay{
		margin-top: 185px;
		margin-left: 80px;
	}
	.mtop{
		font-size: 13px;
		margin-bottom: 3px;
	}
	.sp{
		font-size:20px;
	}
	.rbtn{
		text-align: center;
		width:30px;
		height:30px;
	}
	.adult{
		display: none;
	}
	.btn3 span.fa-check {    			
	opacity: 0;				
	}
	.btn3.active span.fa-check {				
		opacity: 1;				
	}
</style>
<script type="text/javascript">
	$(function() {
		var seat_num="";
		var seat_count=0;
		var adult=0;
		var teen=$("#teen").val();
		var children=$("#children").val();
		var other=$("#other").val()*1;
		
		$(".snum_btn").click(function() {
			seat_count=adult+teen+children+other;
			alert(adult);alert(teen);alert(children);alert(other);
			
			if(seat_count>0){
				seat_num=$(this).attr("title");
				$(this).css("background-image",'url("../images/seat_selected.png")');	
				seat_count--;
			}else{
				alert("좌석을 모두 선택하셨습니다.");
			}
			
		});
		$(".num_of_adult input:radio").change(function() {
		    adult = $(this).val();
		    alert(adult);
		});
		/* $(".adult_label").on("click",".adult",function(){
			$(this).attr("checked",true);
			adult= $(this).val()*1;
			alert(adult);
		}); */
		/*  $(".adult").click(function() {
			adult= $(this).val()*1;
			$(this).
			alert(adult); 
		});
		$(".teen").click(function() {
			teen= $(this).val()*1;			
			alert(teen);
		});
		$(".children").click(function() {
			children= $(this).val()*1;
			alert(children);

		});
		$(".other").click(function() {
			other= $(this).val()*1;
			alert(other);
		});  */
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
					<p>인원/좌석</p>
				</div>
				<div class="col-body">
					<div class="person_screen">
						<div class="number_of_person">
							<div class="t">
								<div class="tt">일반</div>
								<div class="number_of_radio">
								<div class="num_of_adult" data-toggle="buttons">
									<c:forEach var="i" begin="0" end="8" step="1">
										
										<%--  <label class="btn btn-primary adult_label">
    										<input type="radio" class="adult" id="adult${i}" value="${i }">${i }
  										</label> --%>
  										<label class="btn btn-primary">
  											<input type="radio" class="adult" name="adult" value="${i }">${i } 
  										</label>
									</c:forEach>
								</div>
								</div>
							</div>
							<div class="t">	
								<div class="tt">청소년</div>
								<div class="number_of_radio">
									<c:forEach var="i" begin="0" end="8" step="1">
										<button class="teen btn" value="${i }">${i }</button>
									</c:forEach>
								</div>
							</div>
							<div class="t">	
								<div class="tt">어린이</div>
								<div class="number_of_radio">
									<c:forEach var="i" begin="0" end="8" step="1">
										<button class="children btn" value="${i }">${i }</button>
									</c:forEach>
								</div>
							</div>
							<div class="t">	
								<div class="tt">우대</div>
								<div class="number_of_radio">
									<c:forEach var="i" begin="0" end="8" step="1">
										<button class="other btn" value="${i }">${i }</button>
									</c:forEach>
								</div>
							</div>
						</div>
							
						<div class="section_of_screen">
							<div class="info_header">
								<p style="font-weight:bold; font-size:25px;">${bookDto.movie_title}</p>
								<span class="sp theater">[${bookDto.theater}]</span>
								<span class="sp auditorium">${bookDto.auditorium}</span>
							</div>
							<div class="info_body">
								<p style="font-weight:300; font-size:15px;">${bookDto.view_date} ${bookDto.show_time}</p>
							</div>
						</div>
					</div>
					<!-- end of peson_screen -->
					
					<div class="screen_con_wrapper">
						<div class="screen_wrapper">
							<div class="screen">SCREEN</div>
							<div class="seat_wrap">
								<table class="tb_seat">
									<c:forEach items="${seatInit}" var="i">
										<tr>
											<td class="td_font">${i}</td>
											<c:forEach var="j" begin="1" end="17">
												<td>
													<button class="btn btn2 snum_btn" title="${i}${j}" id="${i}${j}" value="${i}${j}">${j}</button>
												</td>
											</c:forEach>
										</tr>
								</c:forEach>
								</table>
							</div>				
						</div>
						<!-- screen_wrapper -->
						<div class="seat_info_wrapper">
							<div style="font-size:15px; margin-bottom:3px;">좌석안내</div>
							<div class="mtop"><img alt="selected" src="../images/seat_selected.png"> 선택좌석</div>
							<div class="mtop"><img alt="booked" src="../images/seat_booked.png"> 예매완료</div>
							<div class="mtop"><img alt="cant_selected" src="../images/seat_cant_select.png"> 선택불가</div>
							<div class="mtop"><img alt="seat" src="../images/seat.png"> 일반석</div>
							<div class="mtop"><img alt="wheel" src="../images/seat_wheel.png"> 장애인/휠체어석</div>
							
							<div><img id="go_pay" src="../images/go_pay.png"></div>
						</div>
					</div>
					<!-- end of screen_con_wrapper -->
				</div>
				<!-- end of col-body -->
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