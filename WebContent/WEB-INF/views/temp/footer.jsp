<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#footer {
	height: 208px;
	background-color: #221f1f;
	display: block;
}
#footer .wrap {
    position: relative;
    width: 70%;
    height: 138px;
    margin: 0 auto;
    padding: 30px 0 40px;
    color: #999;
    font-size: 12px;
    line-height: 18px
}
#footer .logo {
    margin-bottom: 17px;
    float : left;
    padding-inline-start: 40px;
}
#footer .logo a {
    display: inline-block;
}
#footer ul {
    margin-bottom: 15px;
	float : left;
	list-style : none;
	font-color : #999;
}
#footer li {
    display: inline-block;
    position: relative;
    margin-right: 12px;
}
#footer li a {
    font-size: 12px;
    color: #999;
}
 #footer li:before  {
    content: "";
    display: block;
    position: absolute;
    top: 4px;
    left: -7px;
    height: 10px;
    border-left: 1px solid #999;
} 
#footer li.footer_company:before {
    border: 0;
}
 .reset{
	clear: both;
}
#footer .wrap .text3 {
    right: 0;
    bottom: 40px;
}
.text1{
	padding-inline-start: 40px;
}
.text2{
	float : right;
	margin-right : 15%;
}
.ars{
	font-size : 20px;
	font-weight : 800;
}
.d{
	font-color : #000;
}
</style>
</head>
<body>
	<!-- Footer -->
	<footer class="text-center" id="footer">
		<div class="wrap">
			<div class="logo">
				<a href="" title="MEGABOX메인으로 가기"> 
					<img src="./images/logo_footer_new.png" alt="MEGABOX">
				</a>
			</div>
			<div class="text2 ars">
				<span>ARS 1544-0070</span>
			</div>
			<div class="reset"></div>
			<ul>
				<li class="footer_company"><a>회사소개</a></li>
				<li><a>채용정보</a></li>
				<li><a>제휴/광고/부대산업 문의</a></li>
				<li><a>이용약관</a></li>
				<li><a>개인정보 처리방침</a></li>
				<li><a>고객센터</a></li>
				<li><a>윤리경영</a></li>
			</ul>
			<div class="reset"></div>
			<div class="text1" style="text-align:left">
				서울특별시 강남구 도산대로 156, 2층 메가박스중앙(주) (논현동, 중앙엠앤비사옥)<br>
				대표자명 김진선  |  개인정보보호 책임자 경영지원실 실장 박영진<br>
				사업자등록번호 211-86-59478  |  통신판매업신고번호 제 833호
			</div>
			<div class="text2"> 
				"Copyright 2014 by MegaboxJoongAng, Inc. All rights reserved"
			</div>
		</div>
		
	</footer>


</body>
</html>