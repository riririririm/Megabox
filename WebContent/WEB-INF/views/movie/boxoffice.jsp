<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header.jsp"></c:import>
<style type="text/css">
	#myPage {
		
	}

	#content_wrap {
		width: 100%;
		min-height: 2000px;
	}
	#sub_button_wrap{
		width: 970px;
		height: 61px;
		margin: 0 auto;
		margin-bottom: 25px;
		margin-top: 51px;
	}
	#sub_navi {
		width: 100%;
		height: 54px;
		border-top: 1px solid #e1e1e1;
		background-color: #f2f2f2;
		border-bottom: 3px solid #503396;
	}
	#sub_navi_wrap {
		width: 970px;
		height: 50px;
		margin: 0 auto;
	}
	#sub_menu {
		width: 970px;
		height: 50px;
		padding: 0;
		margin: 0 auto;
		padding : 0px 150px ;
	}
	
	#sub_menu > li {
		width: 70px;
		height : 50px;
		margin-left: 40px;
		margin-right: 100px;
		list-style: none;
		float: left;
		line-height: 3.5em;
	}

	#sub_menu >li > a {
		text-decoration: none;
		color : #cccccc;
		font-size: 14px;
		font-weight: bold;
	}
	
	#main_content {
		width: 100%;
		min-height: 2000px;
	}
	#main_container {
		width: 100%;
		min-height: 2000px;
		margin-top: 7px;
		margin-bottom: 85px;
	}
	#full{
		width: 100%;
		
		padding: 0 11px;
	}
	#flip_wrap{
		width: 78%;
		min-height: 2000px;
		margin: 0 auto;
	}
	#util_wrap {
		width: 100%;
		height: 27px;
		padding: 30px 7px 0;
	}
	#movie_list {
		width: 100%;
		min-height: 2000px;
		list-style: none;
		padding: 0px;
	
	}
	.item {
		width: 230px;
		height: 505px;
		border: 1px solid #d9d9d9;
		display: block;
		float: left;
		margin: 7px;
	
	}

	
	
</style>
<script type="text/javascript">
	$(function() {
		$(".select").click(function(){
			
			
		}); 
		
	});





</script>


</head>
<body>
<div id ="content_wrap">
	<div id="sub_button_wrap">
	
	</div>
	<div id="sub_navi">
		<div id="sub_navi_wrap">
			<ul id="sub_menu">
				<li><a href="#" class="select" id="sub1">박스오피스</a></li>
				<li><a href="#" class="select" id="sub2">최신개봉작</a></li>
				<li><a href="#" class="select" id="sub3">♥ 보고싶어</a></li>
				
				
			</ul>
		</div>
	</div>
	<div id="main_content">
		<div id="main_container">
			<div id="full">
				<div id="flip_wrap">
					<div id="util_wrap">
					</div>
					<ul id="movie_list">
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>
						<li class="item"> </li>

					</ul>
				</div>
			
			
			</div>
		
		</div>
	
	
	
	</div>
	
	</div>









<jsp:include page="../temp/footer.jsp"/>
</body>
</html>