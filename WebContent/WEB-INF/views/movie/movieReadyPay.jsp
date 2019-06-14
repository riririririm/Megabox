<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<style type="text/css">
	.container{
		min-height:900px;
		margin-top: 150px;
	}
	.col-head{
		color:white;
		text-align: center;
		vertical-align: middle;
		background-color: #555;
		height:30px;
		font-size: 18px;
	}
	.col-body {
		height: 1000px;
		overflow: auto;
		width:100%;
	}
	.method_pay{
		height:400px;
		width:80%;
		float:left;
		border: 1px solid #9999;
	}
	.book_info{
		height:400px;
		width:20%;
		float: right;
		border-right: 1px solid #9999;
		border-bottom: 1px solid #9999;
	}
	.radiobtn{
		height:30px;
		border-bottom: 1px solid #9999;
		padding-left:30px;
		color: #333;
	}
	.step_of_kakao{
		padding:50px;
		color: #333;
		letter-spacing: -0.5px;
	}
	.kfont{
		margin-top: 70px;
		text-align: center;
	}
	.kfont>p{
	color:red;
	font-weight: 600;
	font-size: 14px;
	}
	.pay_btn{
		padding-left: 4px;
		
	}
	.f{
		font-size: 14px;
		color:#333;
	}
	.ff{
		font-size: 20px;
		color:#333;
		font-weight: bold;
	}
	.fff{
		color:#503396;
		font-size: 25px;
		font-weight: 700;
		margin-top: 120px;
		padding-left: 85px;
	}
	.book_info2{
		padding:30px 20px 5px 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../temp/header.jsp"/>
	<!--header -->
		
	<div class="container">
	<div class="all_list">
		<div class="steps">
			<div class="step1">
				<div class="col-head">
					<p>결제수단</p>
				</div>
				<div class="col-body">
					<div class="method_pay">
						<div class="radiobtn">
							<input type="radio" value="kakao" id="kakao" class="kakao" checked> kakaopay					
						</div>
						<div class="step_of_kakao">
							<p style="font-weight:bold; font-size:16px; margin-bottom:10px;">kakaopay 결제 순서</p>
							<p>1. 우측 하단에 있는 "결제하기"버튼을 클릭해주세요.</p>
							<p>2. 예매내역 확인 후 결제하기 버튼 클릭 시 'KakaoPay' 결제 인증창이 뜹니다.</p>
							<p>3. 'kakaopay'결제 인증창에서 정보를 입력하신 후 결제해주세요.</p>
							<div class="kfont">
								<p>'kakaopay'는 신용카드 선할인과 카드사 포인트는 이용이 불가능하며,</p>
								<p>신용카드별 청구할인은 이용이 가능합니다.</p>
							</div>
						</div>
					</div>
					<div class="book_info">
						<div class="book_info2">
							<div class="ff">${movie.movie_title }</div>
							<p></p>
							<div class="f">[${movie.theater }]${movie.auditorium }</div>
							<div class="f">${movie.view_date } ${movie.show_time}</div>
							<div class="f">좌석: 
							<c:forEach items="${seat_num }" var="seat">
								<span class="f">${seat}</span>
							</c:forEach>
							<div class="fff">${movie.price }<span>원</span></div>
							</div>
						</div>
						<div class="pay_btn">
							<img alt="pay" src="../images/pay_btn.png">
						</div>
					</div>
					
					
				</div>
				<!-- end of col-body -->
			</div>
		</div> 
		<!-- end of steps -->
		
	</div>
	<!-- end of all_list -->
	</div>
	<!-- end of container -->



	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>