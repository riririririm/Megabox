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
          	<h4 id="s_title"></h4>
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
				<span class="total_price pull-right"><strong id="store_balance"></strong>원</span>
		  </div>
		  <div class="store_payment_row">
				<h5 class="pull-left">결제수단선택</h5>
				<span class="f pull-right">
					<input type="radio"> KaKaoPay
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
							<input type="text" id="receiver-mobileNo1" name="receiver-mobileNo1" title="휴대폰 번호 첫번째 자리 입력" value="010" maxlength="3" allowtype="number" validate="number" fieldname="받는 분 휴대폰 번호" required=""> -
							<input type="text" id="receiver-mobileNo2" name="receiver-mobileNo2" title="휴대폰 번호 두번째 자리 입력" value="4111" maxlength="4" allowtype="number" validate="number" fieldname="받는 분 휴대폰 번호" required=""> -
							<input type="text" id="receiver-mobileNo3" name="receiver-mobileNo3" title="휴대폰 번호 세번째 자리 입력" value="1520" maxlength="4" allowtype="number" validate="number" fieldname="받는 분 휴대폰 번호" required="">
						</dd>
				</dl>
			</div>
		  	
		  	<div class="store_btn_wrap">
				<button class="btn-l btn-st2" data-dismiss="modal" aria-hidden="true" onclick="cancelStorePay()">취소</button>
				<button class="btn-l btn-st1" id="check_module">결제</button>
			</div>
          
        </div><!-- end of modal2-body -->
        
 </body>