<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
	.container{
		margin-top: 50px;
		min-height: 800px;
	}
	.btn span.fa-check {    			
	opacity: 0;				
}
.btn.active span.fa-check {				
	opacity: 1;				
}
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}
</style>

<script type="text/javascript">
	$(function(){
		$("#datepicker").datepicker();
		$.datepicker.setDefaults({
		    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		});

		$.datepicker.setDefaults({
		    showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		    ,minDate: "D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전) 
		    ,showMonthAfterYear: true
		    ,dateFormat: 'yy/mm/dd'
		});

	});
</script>
</head>
<body>
	<jsp:include page="../temp/header.jsp"/>
	
	<div class="container">
		<h1> 상영시간표 등록 </h1>
		<form id="movieTimeTable" action="./movieReg" method="post">
		<div class="form-group">
			<label for="movie_code">영화코드:</label> 
			<input type="text" class="form-control" id="movie_code" name="movie_code" placeholder="영화코드를 입력하세요">
		</div>
		<div class="form-group">
			<label for="movie_title">영화제목:</label> 
			<input type="text" class="form-control" id="movie_title" name="movie_title" placeholder="영화제목을 입력하세요">
		</div>
		<div class="form-group">
      		<label for="movie_kind">종류:</label>
      		<select class="form-control" id="movie_kind" name="movie_kind">
        		<option>2D</option>
        		<option>3D</option>
        		<option>더빙</option>
       			<option>자막</option>
      		</select>
      	</div>
      	<div class="form-group">
			<label for="theater">극장</label> 
			<select class="form-control" id="theater" name="theater">
				<c:forEach items="${theaters}" var="th">
					<option>${th.theater_name}</option>			
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="auditorium">상영관</label> 
			<div class="form-group" data-toggle="buttons">
				<label class="btn btn-default ">
					<input type="radio" name=auditorium value="1관">1관
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="radio" name=auditorium value="2관">2관
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="radio" name=auditorium value="3관">3관
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="radio" name=auditorium value="4관">4관
					<span class="fa fa-check"></span>
				</label>
			</div>
		</div>
      	<div class="form-group">
			<label for="view_date">상영일:</label> 
			<div class="input-group date">
            	<input type="text" id="datepicker" name="view_date">
        	</div>
		</div>
		<div>
			<label for="show_time">상영시간:</label> 
			<div class="form-group" data-toggle="buttons">
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="09:00">09:00
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="11:00">11:00
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="13:00">13:00
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="15:00">15:00
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="19:00">19:00
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="21:00">21:00
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" class="show_time" name="show_time" value="22:00">22:00
				</label>
			</div>
			
		</div>
      	
      	
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	</div>
		
	</div>
	
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>