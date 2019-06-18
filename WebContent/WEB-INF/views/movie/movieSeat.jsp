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
	.btn2_1{
		padding:4px 4px;
		width:25px;
		height:25px;
		border: 1px solid white;
		font-weight:bold;
		font-size:12px;
		background-image: url("../images/seat_booked.png");
		background-position: center;
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
    	padding-top: 80px;
	}
	.tb_seat{
		width:40%;
		margin: 0 auto;
		
		
	}
	.td_font{
		color:#333;
		font-weight: bold;
	}
	.seat_info_wrapper{
		float: right;
		width:20%;
		height:430px;
		border: 1px solid #9999;
		margin-top: 10px;
		padding:20px;
	}
	#go_pay{
		margin-top: 160px;
		margin-left: 90px;
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
		var seat_nums =[];
		var adult=0;
		var teen=0;
		var children=0;
		var other=0;
		
	
		$(".num_of_adult input:radio").change(function() {
		    adult = $(this).val()*1;
		    initSeat();
		});
		$(".num_of_teen input:radio").change(function() {
		    teen = $(this).val()*1;
		    initSeat();
		});
		$(".num_of_children input:radio").change(function() {
			children = $(this).val()*1;
		    initSeat();
		});
		$(".num_of_other input:radio").change(function() {
			other = $(this).val()*1;
		    initSeat();
		});
		
		function getSeatCount(){ //인원수(좌석수) 계산
			seat_count=adult+teen+children+other;
		
		}
		function initSeat(){ //인원 재선택시 좌석 선택한거 초기화
			seat_nums=[];
			seat_num=0;
			seat_count=0;
		    getSeatCount();
		   /*  for(int i=0;i<8;i++){
		    	for(int j=0;j<10;j++){
		    		if($(".snum_btn")})
				    $(".snum_btn").css("background-image",'url("../images/seat.png")');
		    		
		    	}
		    } */
		}
		
		function alertMsg(){
			alert("선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?");
		}
		$(".snum_btn").click(function() {
			if(seat_count>0){
				seat_num=$(this).attr("title");
				seat_nums.push(seat_num);
				seat_count--;
				$(this).css("background-image",'url("../images/seat_selected.png")');	
			}else{
				alert("좌석 선택이 완료되었습니다.");
				$(".seats").text(seat_nums);
				alert(seat_nums);
			}
		});
		
		
		var mtitle, mCode, theater,auditorium,show_time,view_date;
		
		$("#go_pay").click(function(){
			mCode= $(".mtitle").attr("id").trim();
			mtitle= $(".mtitle").text().trim();
			theater= $(".theater").attr("title").trim();
			auditorium= $(".auditorium").attr("title").trim();
			view_date= $(".vs").attr("id").trim();
			show_time= $(".vs").attr("title").trim(); 
			
			//form의 value값들	
			$("#movie_code").val(mCode);		
			$("#movie_title").val(mtitle);
			$("#theater").val(theater);
			$("#view_date").val(view_date);
			$("#auditorium").val(auditorium);
			$("#show_time").val(show_time);
			$("#adult_count").val(adult);			//성인 좌석 선택 수 --10000
			$("#teen_count").val(teen); 			//청소년 좌석 선택 수--9000
			$("#children_count").val(children);	//어린이 좌석 선택 수  --8000
			$("#other_count").val(other); 		//우대 좌석 선택 수--7000
			
			for(var i=0;i<seat_nums.length;i++){
				$("#bookInfo").append('<input type="hidden" class="form-group" name="seat_no" value="'+seat_nums[i]+'">');
			}  
			$("#bookInfo").submit();
		
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
									<div class="num_of_teen" data-toggle="buttons">
									<c:forEach var="i" begin="0" end="8" step="1">
  										<label class="btn btn-primary">
  											<input type="radio" class="teen" name="teen" value="${i }">${i } 
  										</label>
									</c:forEach>
									</div>
								</div>
							</div>
							<div class="t">	
								<div class="tt">어린이</div>
								<div class="number_of_radio">
									<div class="num_of_children" data-toggle="buttons">
									<c:forEach var="i" begin="0" end="8" step="1">
  										<label class="btn btn-primary">
  											<input type="radio" class="children" name="children" value="${i }">${i } 
  										</label>
									</c:forEach>
									</div>
								</div>
							</div>
							<div class="t">	
								<div class="tt">우대</div>
								<div class="number_of_radio">
									<div class="num_of_other" data-toggle="buttons">
									<c:forEach var="i" begin="0" end="8" step="1">
  										<label class="btn btn-primary">
  											<input type="radio" class="other" name="other" value="${i }">${i } 
  										</label>
									</c:forEach>
									</div>
								</div>
							</div>
						</div>
							
						<div class="section_of_screen">
							<div class="info_header">
								<p style="font-weight:bold; font-size:25px;" class="mtitle" id="${bookDto.movie_code}">${bookDto.movie_title}</p>
								<span class="sp theater" title="${bookDto.theater}">[${bookDto.theater}]</span>
								<span class="sp auditorium" title="${bookDto.auditorium}">${bookDto.auditorium}</span>
							</div>
							<div class="info_body">
								<p style="font-weight:300; font-size:15px;" class="vs" id="${bookDto.view_date}" title="${bookDto.show_time}">${bookDto.view_date} ${bookDto.show_time}</p>
								<p style="font-weight:300; font-size:15px;">좌석:<span class="seats"></span></p>
							</div>
						</div>
					</div>
					<!-- end of peson_screen -->
					
					<div class="screen_con_wrapper">
						<div class="screen_wrapper">
							<div class="screen">SCREEN</div>
							<div class="seat_wrap">
								<table class="tb_seat">
									<c:forEach items="${seatInit}" var="ch" varStatus="i">
										<tr>
											<td class="td_font">${ch}</td>
											<c:forEach var="j" begin="0" end="9">
												<td>
												<%-- ${seatStatus[i.index*10+j]}  --%>
												<c:choose>
													<c:when test="${seatStatus[i.index*10+j] eq 1 }">
														<button class="btn btn2 snum_btn" title="${ch}${j+1}" id="${ch}${j+1}" value="${ch}${j+1}">${j+1}</button> 
													</c:when>
													<c:when test="${seatStatus[i.index*10+j] eq 0 }">
														<button class="btn btn2_1 snum_btn" title="${ch}${j+1}" id="${ch}${j+1}" value="${ch}${j+1}"></button> 
													</c:when>
												</c:choose>
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
	
	<form action="./movieReadyPay" method="post" id="bookInfo">
		<input type="hidden" class="form-group" id="movie_code" name="movie_code">
		<input type="hidden" class="form-group" id="movie_title" name="movie_title">
		<input type="hidden" class="form-group" id="theater" name="theater">
		<input type="hidden" class="form-group" id="view_date" name="view_date">
		<input type="hidden" class="form-group" id="auditorium" name="auditorium">
		<input type="hidden" class="form-group" id="show_time" name="show_time">
		<input type="hidden" class="form-group" id="adult_count" name="adult_count">
		<input type="hidden" class="form-group" id="teen_count" name="teen_count">
		<input type="hidden" class="form-group" id="children_count" name="children_count">
		<input type="hidden" class="form-group" id="other_count" name="other_count">
	</form>
	
	<jsp:include page="../temp/footer.jsp"/>

</body>
</html>