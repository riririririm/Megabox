<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<style type="text/css">
	.container{
		width:60%;
		margin-top: 40px;
	}
</style>
</head>
<body>
	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
	<h2>상품등록페이지</h2>
	<form>
		<div class="form-group">
			<label for="sname">상품명:</label> 
			<input type="text" class="form-control" id="sname" placeholder="상품명을 입력하세요">
		</div>
		<div class="form-group">
			<label for="snum">상품코드:</label> 
			<input type="text" class="form-control" id="snum" placeholder="상품코드를 입력하세요">
		</div>
		<div class="form-group">
			<label for="stheather">사용가능 영화관:</label> 
			<input type="text" class="form-control" id="stheather" value="전체영화관" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="not_stheather">사용불가능 영화관:</label> 
			<input type="text" class="form-control" id="not_stheather" placeholder="사용불가능한 영화관을 입력하세요">
		</div>
		<div class="form-group">
			<label for="speriod">유효기간:</label> 
			<input type="text" class="form-control" id="speriod" placeholder="구매일로부터 유효한  개월 수를 입력하세요">
		</div>
		<div class="form-group">
			<label for="scount">1회 구매가능 수량:</label> 
			<input type="text" class="form-control" id="scount" placeholder="1회에 구매 가능한 수량을 입력하세요">
		</div>
		<div class="form-group">
			<label for="scancel">구매 후 취소:</label> 
			<input type="text" class="form-control" id="scancel" placeholder="구매 후 취소 가능여부를 입력하세요">
		</div>
		<div class="form-group">
			<label for="sprice">스토어 판매가:</label> 
			<input type="text" class="form-control" id="sprice" placeholder="상품 가격을 입력하세요">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	</div>
	
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>