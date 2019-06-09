<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp" />
<style type="text/css">
.container {
	width: 100%;
	height: 2000px;
	padding-top: 50px;
	padding-left: 0px;
	padding-right: 0px;
}
.store_main {
	width: 100%;
}
.store_main img {
	width: 100%;
	height: 400px;
	position: absolute;
	z-index: 1;
}
.store_sub {
	margin-top: 360px;
	position: absolute;
	width: 100%;
	padding-left: 12%;
	padding-right: 15%;
	z-index: 2;
	background: url("../images/sub_menu_bg.png") repeat-x;
}
.store_sub li {
	padding-top: 8px;
	padding-bottom: 8px; 
	font-size: 15px;
	float: left;
	z-index: 3;
	padding-right: 50px;
	list-style: none
}
.blind {
	padding-top: 150px;
	padding-left: 15%;
	padding-right: 15%;
	color: white;
	z-index: 4;
	position: absolute;
	font-size: 20px;
}
.sub_menu{
	margin-top: 400px;
	padding-left: 15%;
	padding-right: 15%;
}
.ticket{
	font-weight : bold;
	padding-top: 20px;
	font-size: 500;
}
.ticket_list li{
	list-style: none;
	float : left;
	margin-right: 30px;
	height : 320px;
	border: 1px solid black;
}
.ticket_list img{
	width: 200px;
	height: 200px;
}
.ticket_info{
	padding-top: 10px;
	padding-left : 10px;
	font-size: 18px;
	font-weight: bold;
	width : 200px;
	word-wrap: break-word;
}
.ticket_price{
	padding-right : 8px;
	font-size: 18px;
	font-weight: bold;
	float : right;
}
.tt{
	height: 285px;
}
.chance{
	font-weight : bold;
	margin-top : 50px;
	font-size: 500;
}
</style>
</head>
<body>
	<jsp:include page="../temp/header.jsp" />
	<div class="container">
		<div class="store_main">
			<img src="../images/store_bg.png">
			<div class="content_wrap">
				<div class="blind">
					<strong>MEGABOX </strong>STORE<br> 더 즐거운 영화감상을 하는방법!<br>
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
		<div class="reset"></div>
		<div class="sub_menu">
			<div class="ticket">메가티켓</div>
			<div class="ticket">
				<div class="ticket_list">
					<ul>
						<li>
						<div class="tt">
							<a href=""><img alt="" src="../images/ticket1.jpg" ></a>
							<div class="ticket_info">
								일반관람권(2D)
							</div>
						</div>
							<div class="ticket_price">
								10,000원
							</div>
						</li>
						<li>
						<div class="tt">
							<img alt="" src="../images/ticket2.jpg">
							<div class="ticket_info">
								[특별관] MX관 전용관람권(2D)
							</div>
						</div>
							<div class="ticket_price">
								12,000원
							</div>
						</li>
						<li>
						<div class="tt">
							<img alt="" src="../images/ticket3.jpg">
							<div class="ticket_info">
								[특별관] 더 부티크 전용관람권
							</div>
						</div>
							<div class="ticket_price">
								12,000원
							</div>
						</li>
						<li>
						<div class="tt">
							<img alt="" src="../images/ticket4.jpg" >
							<div class="ticket_info">
								[특별관] 더 부티크 스위트 전용관람권
							</div>
						</div>
							<div class="ticket_price">
								35,000원
							</div>
						</li>
					</ul>
				</div>
			</div> 
			<div class="reset"></div>
			<div class="chance">메가찬스</div>
			<div class="ticket">
				<div class="ticket_list">
					<ul>
						<li>
						<div class="tt">
							<a href=""><img alt="" src="../images/chance1.jpg" ></a>
							<div class="ticket_info">
								[맨 인 블랙 인터내셔널] 1+1 관람권
							</div>
						</div>
							<div class="ticket_price">
								9,000원
							</div>
						</li>
						<li>
						<div class="tt">
							<img alt="" src="../images/chance2.jpg">
							<div class="ticket_info">
								[로켓맨] 1+1 관람권
							</div>
						</div>
							<div class="ticket_price">
								9,000원
							</div>
						</li>
						<li>
						<div class="tt">
							<img alt="" src="../images/chance3.jpg">
							<div class="ticket_info">
								[멕스맨 다크피닉스] 1+1 관람권
							</div>
						</div>
							<div class="ticket_price">
								9,000원
							</div>
						</li>
						<li>
						<div class="tt">
							<img alt="" src="../images/chance4.jpg" >
							<div class="ticket_info">
								[상봉] 킹 오브 프리즘 패키지
							</div>
						</div>
							<div class="ticket_price">
								14,000원
							</div>
						</li>
					</ul>
				</div>
			</div> 
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
</body>
</html>