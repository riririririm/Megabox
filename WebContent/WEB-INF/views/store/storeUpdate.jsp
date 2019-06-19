<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		min-height: 1000px;
	}
	.store_noTheater{
		width:150px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		
	});
</script>
</head>
<body>
	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
	<h2>상품수정페이지</h2>
	<form id="store" action="./storeUpdate" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="store_category">카테고리:</label> 
			<select class="form-group" id="store_category" name="store_category" value="${storeDTO.store_category}">
				<option value="메가티켓">메가티켓</option>
				<option value="메가찬스">메가찬스</option>
				<option value="팝콘/음료/굿즈">팝콘/음료/굿즈</option>
			</select>
		</div>
		<div class="form-group">
			<input type="hidden" class="form-control" id="store_num" name="store_num" value="${storeDTO.store_num }">
		</div> 
		<div class="form-group">
			<label for="store_name">상품명:</label> 
			<input type="text" class="form-control" id="store_name" name="store_name" value="${storeDTO.store_name }">
		</div>
		<div class="form-group">
			<label for="store_theater">사용가능 영화관:</label> 
			<input type="text" class="form-control" id="store_theater" name="store_theater" value="전체영화관" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="store_noTheater">사용불가능 영화관:</label> 
			<div class="form-group" data-toggle="buttons">
				<c:forEach items="${theaters}" var="th">
					<label class="btn btn-default store_noTheater">
						<input type="checkbox" class="store_noTheater" name="store_noTheater" value="${th.theater_name}">${th.theater_name}
					</label>
				</c:forEach>
			</div>
		</div>
		<div class="form-group">
			<label for="store_period">유효기간:</label> 
			<input type="text" class="form-control" id="store_period" name="store_period" value="${storeDTO.store_period }">
		</div>
		<div class="form-group">
			<label for="store_count">1회 구매가능 수량:</label> 
			<input type="text" class="form-control" id="store_count" name="store_count" value="${storeDTO.store_count }">
		</div>
		<div class="form-group">
			<label for="store_cancel">구매 후 취소:</label> 
			<input type="text" class="form-control" id="store_cancel" name="store_cancel" value="${storeDTO.store_cancel }">
		</div>
		<div class="form-group">
			<label for="store_price">스토어 판매가:</label> 
			<input type="text" class="form-control" id="store_price" name="store_price" value="${storeDTO.store_price }">
		</div>
		<div class="form-group" id="addFile">
			<label for="store_price">스토어 이미지:</label> 
			<input type="file" class="form-control" id="file" name="file" value="${uploadDTO.oname }">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	</form>
	</div>
	
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>