 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.font1{
		font-weight: bold;
	}
	.font2{
		color:#333;
	}
	.font3{
		font-weight: bold;
		font-size: 20px;
		color: #503396;
	}
	.alignRight{
		float:right;
	}
	.alignLeft{
		float:left;
		width:40%;
		padding-left: 20px;
	}
	.btn_info{
		font-size: 13px;
		text-align: center;
		
	}
	.bottom{
		text-align: center;
		padding-top:50px;
	}
	.left{
		padding-top:60px;
		/* border-bottom: 1px solid #9999; */
	}
	.modal-body22{
		border-bottom: 1px solid #9999;
		min-height: 501px;
	}
	.right_title{
		font-size: 24px;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$(function() {
		var store_num="";
		var store_name="";
		var store_category="";
		var store_period="";
		var store_count="";
		var store_price="";
		
		//kakaopay
		$("#check_module").click(function () {
			var queryString = $("form[name=payForm]").serialize() ;
			store_name=$("#kakao_store_name").val().trim();
			store_count=$("#kakao_total_price").val().trim();
			alert(store_name);
			alert(store_count);
         	var IMP = window.IMP; // 생략가능
        	IMP.init('imp72232577');// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       	IMP.request_pay({
        	pg: 'kakao', // version 1.1.0부터 지원.
         	/*'kakao':카카오페이,  	html5_inicis':이니시스(웹표준결제)   	'nice':나이스페이       	'jtnet':제이티넷       	'uplus':LG유플러스       	'danal':다날
        		'payco':페이코        	'syrup':시럽페이        	'paypal':페이팔*/
        	pay_method: 'card',
	       	merchant_uid: 'merchant_' + new Date().getTime(),
        	name: '주문명:'+$("#kakao_store_name").val().trim(),
        	//결제창에서 보여질 이름
        	amount: $("#kakao_total_price").val().trim(),
        	//가격
         	buyer_email: '${sessionScope.member.email}',
        	buyer_name: '${sessionScope.member.id}',
        	buyer_tel: '${sessionScope.member.phone}',
        	//buyer_addr: '서울특별시 강남구 삼성동',
        	//buyer_postcode: '123-456',
         	m_redirect_url: 'http://localhost/Megabox/store/storeList'
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
        	
        	
        	/////////
        	/* $.post("./storePurchase",queryString, function(data){
        	         result="success";
        	}); */
        	
			$.ajax({
				url:"./storePurchase",
				type:"POST",
				data: queryString,
				success: function(res) {
					 result="success";
				},
				error:function(request, status, error) {
		            console.log("ajax call went wrong:" + request.responseText);
		        }
			});
			
        	} else {
        		var msg = '결제에 실패하였습니다.';
        		msg += '에러내용 : ' + rsp.error_msg;
        		result="fail";
        	}
        	
        /* 	if(result=="success"){
        		//window.location.href="../index.do"
        		
        	}else{
        		alert(msg);
        	} */
    		location.reload();
    		alert(msg);
        	}); 
        	
		});
	
	}); 
</script>
</head> 
<body>
	 <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal2-title">결제하기</h4>
        </div>
        <div class="modal2-body">
          <div class="store_title">
          	<h4 id="s_title">${storeDTO.store_name }</h4>
          	<dl class="s_period">
          		<dt>유효기간: </dt>
          		<c:choose >
          			<c:when test="${storeDTO.store_category eq '메가티켓' }">
          				<dd class="s_dd">예매 가능 유효기간은 구매일로부터 ${storeDTO.store_period }개월 입니다.</dd>
          			</c:when>
          			<c:when test="${storeDTO.store_category eq '메가찬스' }">
          				<dd class="s_dd">주말/공휴일 사용가능, 종영시 사용 불가</dd>
          			</c:when>
          			<c:when test="${storeDTO.store_category eq '팝콘/음료/굿즈' }">
          				<dd class="s_dd">사용가능 기간은 구매일로부터 ${storeDTO.store_period }개월 입니다.</dd>
          			</c:when>
          		</c:choose>
          	</dl>
          </div>
          <div class="store_payment_row">
				<h5 class="pull-left">총 결제금액</h5>
				<span class="total_price pull-right"><strong id="store_balance">${store_total_price}</strong>원</span>
		  </div>
		  <div class="store_payment_row">
				<h5 class="pull-left">결제수단선택</h5>
				<span class="f pull-right">
					<input type="radio" checked> KaKaoPay
				</span>
		  </div>
		  <div class="store_sms_info">
				<dl class="clearfix">
					<dt><label for="sender-mobileNo1">보내는 분 <span class="sel_line"></span></label></dt>
					<dd>
						<input type="text" id="sender-mobileNo1" name="sender-mobileNo1" title="휴대폰 번호 첫번째 자리 입력" maxlength="3" allowtype="number" validate="number" fieldname="보내는 분 휴대폰 번호" required="" value="1544" readonly="readonly"> -
						<input type="text" id="sender-mobileNo2" name="sender-mobileNo2" title="휴대폰 번호 두번째 자리 입력" maxlength="4" allowtype="number" validate="number" fieldname="보내는 분 휴대폰 번호" required="" value="0070" readonly="readonly">
					</dd>
				</dl>
				<dl class="clearfix">
					<dt><label for="receiver-mobileNo1">받는 분 <span>(쿠폰번호가 전송됩니다)</span></label></dt>
						<dd class="receiver">
							<input type="text" id="receiver-mobileNo1" name="receiver-mobileNo1" title="휴대폰 번호 첫번째 자리 입력" value="${phones[0] }" maxlength="3" allowtype="number" validate="number" fieldname="받는 분 휴대폰 번호" required=""> -
							<input type="text" id="receiver-mobileNo2" name="receiver-mobileNo2" title="휴대폰 번호 두번째 자리 입력" value="${phones[1] }" maxlength="4" allowtype="number" validate="number" fieldname="받는 분 휴대폰 번호" required=""> -
							<input type="text" id="receiver-mobileNo3" name="receiver-mobileNo3" title="휴대폰 번호 세번째 자리 입력" value="${phones[2] }" maxlength="4" allowtype="number" validate="number" fieldname="받는 분 휴대폰 번호" required="">
						</dd>
				</dl>
			</div>
		  	
		  	<div class="store_btn_wrap">
				<button class="btn-l btn-st2" data-dismiss="modal" aria-hidden="true" onclick="cancelStorePay()">취소</button>
				<button class="btn-l btn-st1" id="check_module">결제</button>
			</div>
          	<form id="payForm" name="payForm">
          			<input type="hidden" id="kakao_id" name="kakao_id" value="${sessionScope.member.id}">
          			<input type="hidden" id="kakao_category" name="kakao_category" value="${storeDTO.store_category }">
          			<input type="hidden" id="kakao_store_name" name="kakao_store_name" value="${storeDTO.store_name}">
          			<input type="hidden" id="kakao_store_period" name="kakao_store_period" value="${storeDTO.store_period }">
          			<input type="hidden" id="kakao_buy_count" name="kakao_buy_count" value="${storeDTO.store_count}">
          			<input type="hidden" id="kakao_total_price" name="kakao_total_price" value="${store_total_price}">
          	</form>
        </div><!-- end of modal2-body -->
        
 </body>