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
		height : 1500px;
		padding : 3% 0 0 0 ;
		position : relative;
		overflow : hidden;
}
.sub_navi {
	
    background-color: #f2f2f2;
    border-top: 1px solid #e1e1e1;
    border-bottom: 3px solid #503396;
	}
	
	.sub_navi .sub_navi_wrap {
    position: relative;
    width: 970px;
    margin: 0 auto;
	}
	.clearfix li{
		list-style: none;
	}
	.join_form {
		margin-top: 20px;
	}
	.join_form p{
		font-size: 20px;
		
	}
	.myPage{
		width: 970px;
    	margin: 0 auto;
    	border: 1px solid black;
    	height : 1300px;
	}
	.myPage_nav li{
		list-style: none;
		margin-top : 40px;
		
	}
	
	.myPage img{
		margin-right : 120px;
		float : left;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<jsp:include page="../temp/header.jsp" />
	<div class="container">
		<div class="sub_navi">
			<div class="sub_navi_wrap">
				<ul class="clearfix join_form" style="padding-left: 22px;">
					<li>
						<p>나의 메가박스</p>
					</li>
				</ul>
			</div>
		</div>
		<div class="myPage">
			<div class="myPage_nav">
				<ul style="padding-left: 0px;">
					<li><a href="./bookPage"><img src="../images/book.PNG"></a></li>
					<li><img src="../images/store.PNG"></li>
					<li><img src="../images/personal_info.PNG"></li>
					<li><img src="../images/qna.PNG" style="margin-right: 0px;"></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>