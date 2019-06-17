<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<jsp:include page="../temp/bootstrap.jsp"/>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<script type="text/javascript">
	$(function() {
		/* var id, movie_code, movie_title, theater, auditorium, seat_cout;
		var show_time, view_date, price;
		 */
		$("#payBtn").click(function() {
			var movie_title= $(".mCode").text().trim();
			var price=$(".price").attr("title").trim();
			var queryString = $("form[name=bookInfo]").serialize() ;
			//alert(queryString);
			//alert(price);
			
			var result="";
			var IMP = window.IMP; // 생략가능
        	IMP.init('imp72232577');// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       	IMP.request_pay({
        	pg: 'kakao', // version 1.1.0부터 지원.
         	/*'kakao':카카오페이,  	html5_inicis':이니시스(웹표준결제)   	'nice':나이스페이       	'jtnet':제이티넷       	'uplus':LG유플러스       	'danal':다날
        		'payco':페이코        	'syrup':시럽페이        	'paypal':페이팔*/
        	pay_method: 'card',
	       	merchant_uid: 'merchant_' + new Date().getTime(),
        	name: '주문명:'+movie_title,
        	//결제창에서 보여질 이름
        	amount: price,
        	//가격
         	buyer_email: '${sessionScope.member.email}',
        	buyer_name: '${sessionScope.member.id}',
        	buyer_tel: '${sessionScope.member.phone}',
        	//buyer_addr: '서울특별시 강남구 삼성동',
        	//buyer_postcode: '123-456',
         	m_redirect_url: 'http://localhost/Megabox/index.do'
        	/*
        	모바일 결제시,
        	결제가 끝나고 랜딩되는 URL을 지정
        	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
        	*/
        	 }, function (rsp) {
             	console.log(rsp);
            	if (rsp.success) {
            	var msg = '결제가 완료되었습니다.';
            	msg += '고유ID : ' + rsp.imp_uid;
            	msg += '상점 거래ID : ' + rsp.merchant_uid;
            	msg += '결제 금액 : ' + rsp.paid_amount;
            	msg += '카드 승인번호 : ' + rsp.apply_num;
           		result="success";
            	/////////
            	
            	$.ajax({
                	type : 'post',
                	url : '../book/bookPay',
                	data : queryString,
                	dataType : 'json',
                	error: function(xhr, status, error){
                	    //alert(error);
                	},
               		success : function(data){
                    //alert(data)
                    
               		},
            	});

            	
            	} else {
            		var msg = '결제에 실패하였습니다.';
            		msg += '에러내용 : ' + rsp.error_msg;
            		
            		result="fail"
            	}
            	
            	if(result=="success"){
            		alert("결제가 완료되었습니다.");
            		window.location.href="../index.do";
            	}
            	else{
            		alert(msg);		
            	}
    		});
    		
		});
	});		
</script>
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
							<div class="ff mCode" >${movie.movie_title }</div>
							<p></p>
							<div class="f mTheather" >[${movie.theater }]${movie.auditorium }</div>
							<div class="f mViewDate" >${movie.view_date } ${movie.show_time}</div>
							<div class="f">좌석: 
							<c:forEach items="${seat_num }" var="seat">
								<span class="f">${seat}</span>
							</c:forEach>
							<div class="fff price" title="${movie.price }">${movie.price }<span>원</span></div>
							</div>
						</div>
						
						<div class="pay_btn">
						
						<form name="bookInfo" id="bookInfo">
						<input type="hidden" id="id"  name="id" value="${sessionScope.member.id }"> 
						<input type="hidden" id="movie_code"  name="movie_code" value="${movie.movie_code }"> 
						<input type="hidden" id="movie_title" name="movie_title" value="${movie.movie_title }"> 
						<input type="hidden" id="theater" name="theater" value="${movie.theater }"> 
						<input type="hidden" id="aditorium" name="auditorium" value="${movie.auditorium}"> 
						<input type="hidden" id="view_date" name="view_date" value="${movie.view_date }"> 
						<input type="hidden" id="show_time" name="show_time" value="${movie.show_time }"> 
						<c:forEach items="${seat_num }" var="seat">
							<input type="hidden" id="seat_num" name="seat_num" value="${seat}"> 
						</c:forEach>
						<input type="hidden" id="price" name="price" value="${movie.price }"> 
						<input type="hidden" id="seat_count" name="seat_count" value="${movie.seat_count }"> 					
							<img id="payBtn" alt="pay" src="../images/pay_btn.png">
						</form>
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