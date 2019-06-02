<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어</title>
<jsp:include page="../temp/bootstrap.jsp"/>

<style type="text/css">
	.container{
		margin-top: 40px;
		min-height:800px;
	}
</style>
</head>
<body>
	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
		<h1> 스토어 리스트 페이지 </h1>
		<a href="./storeReg" class="btn btn-primary">상품등록</a>
	</div>
	
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>