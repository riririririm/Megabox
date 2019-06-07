<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<style type="text/css">
	.container {
		width: 100%;
		height: 1235px;
		padding-top:50px;
		padding-left:0px;
		padding-right: 0px;
	}
	.store_main {
		width:100%;
	}
	
	.store_main img {
		width : 100%;
		height: 400px;
		position: absolute;
		z-index: 1;
	}
	.store_sub{
		margin-top: 360px;
		position: absolute;
		width: 100%;
		padding-left: 22%;
		padding-right: 22%;
		z-index : 2;
		background: url("../images/sub_menu_bg.png") repeat-x;
	}
	
	.store_sub li{
		padding-top : 8px;
		padding-bottom : 8px;
		list-style : none;
		font-size: 15px;
		float : left;
		z-index:3;
		padding-left: 50px;
	}
	
	.blind{
		padding-top:150px;
		padding-left: 27%;
		padding-right: 22%;
		color: white;
		z-index : 4;
		position: absolute;
		font-size: 20px;
	}
	.store_text1{
		font-size: 10px;
		padding-top: 30px;
	}
	.menu1{
	width:100%;
	margin-top : 420px;
		padding-left: 27%;
		padding-right: 22%;
		background-color: pink;
		height: 30%;
	}
	#store_list li{
		list-style: none;
	}
	#store_list img{
		width: 230px;
		height: 200px;
		
	}
	.ticket{
		background-color: white;
		width : 25%;
		
		
	}
</style>
</head>
<body>
<jsp:include page="../temp/header.jsp"/>
<div class="container">
	<div class="store_main">
		<img src="../images/store_bg.png">
		<div class="content_wrap">
			<div class="blind">
				<strong>MEGABOX </strong>STORE<br>
				 더 즐거운 영화감상을 하는방법!<br>
				  스토어의 다양한 상품과 함께 하세요!<br>
				<div class="store_text1">메가박스의 고객을 위한 다양한 상품을 제공합니다.</div>
			</div>
		</div>
		<div class="store_sub">
			<ul>
				<li><a>메가티켓</a></li>
				<li><a>메가찬스</a></li>
				<li><a>팝콘/음료/굿즈</a></li>
			</ul>
		</div>
	</div>
	<div class="menu1">
		<div id="store_list">
			<h3>메가티켓</h3>
			<ul>
				<li>
					<div class="ticket">
						<div class="sotre_img"><img src="../images/ticket1.jpg"></div>
						<div class="ticket1"><h3>일반관람권(2D)</h3></div>
						<div class="ticket1">10.000원</div>
					</div>
					
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="../temp/footer.jsp"/>
</body>
</html>