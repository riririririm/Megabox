<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.list_tab{
		border-bottom: 1px solid #9999;
	}
	.list_tab >a{
		font-size: 15px;
		color:#333;
		text-decoration: none;
	}
</style>
</head>
<body>

	<ul>
		<c:forEach items="${noticeList }" var="n">
			<li class="list_tab">
				<a href="./notice/noticeSelect?num=${n.num}">${n.title}</a>
				<span style="float:right">${n.reg_date}</span>
			</li>
		</c:forEach>
	</ul>


</body>
</html>