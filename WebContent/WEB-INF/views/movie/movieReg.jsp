<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<style type="text/css">
	.container{
		margin-top: 50px;
	}
	.btn span.fa-check {    			
	opacity: 0;				
}
.btn.active span.fa-check {				
	opacity: 1;				
}
</style>
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
			<input type="text" class="form-control" id="theater" name="theater" value="동대문" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="theater">상영관</label> 
			
		</div>
      	<div class="form-group">
			<label for="view_date">상영일:</label> 
			<input type="text" class="form-control" id="view_date" name="view_date" placeholder="상영일을 입력하세요">
		</div>
		<div>
			<label for="show_time">상영시간:</label> 
			<div class="form-group" data-toggle="buttons">
				<label class="btn btn-default ">
					<input type="checkbox">09:00
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="checkbox">11:00
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" >13:00
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" >15:00
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" >19:00
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" >21:00
					<span class="fa fa-check"></span>
				</label>
				<label class="btn btn-default ">
					<input type="checkbox" >22:00
					<span class="fa fa-check"></span>
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