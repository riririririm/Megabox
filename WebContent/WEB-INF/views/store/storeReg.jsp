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
	<form id="store" action="./storeReg" method="post">
		<div class="form-group">
			<label for="store_category">카테고리:</label> 
			<input type="text" class="form-control" id="store_category" name="store_category" placeholder="상품카테고리를 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_num">상품코드:</label> 
			<input type="text" class="form-control" id="store_num" name="store_num" placeholder="상품코드를 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_name">상품명:</label> 
			<input type="text" class="form-control" id="store_name" name="store_name" placeholder="상품명을 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_theater">사용가능 영화관:</label> 
			<input type="text" class="form-control" id="store_theater" name="store_theater" value="전체영화관" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="store_noTheater">사용불가능 영화관:</label> 
			<input type="text" class="form-control" id="store_noTheater" name="store_noTheater"  placeholder="사용불가능한 영화관을 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_period">유효기간:</label> 
			<input type="text" class="form-control" id="store_period" name="store_period" placeholder="구매일로부터 유효한  개월 수를 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_count">1회 구매가능 수량:</label> 
			<input type="text" class="form-control" id="store_count" name="store_count" placeholder="1회에 구매 가능한 수량을 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_cancel">구매 후 취소:</label> 
			<input type="text" class="form-control" id="store_cancel" name="store_cancel" placeholder="구매 후 취소 가능여부를 입력하세요">
		</div>
		<div class="form-group">
			<label for="store_price">스토어 판매가:</label> 
			<input type="text" class="form-control" id="store_price" name="store_price" placeholder="상품 가격을 입력하세요">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	</div>
	
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>