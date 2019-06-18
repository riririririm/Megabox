<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp" />
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
.store_sub li >a{
	text-decoration: none;
	color: white;
	font-weight: bold;
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
	clear: both;
	font-weight : bold;
	padding-top: 20px;
	font-size: 500;
}
.ticket_list li{
	list-style: none;
	float : left;
	margin-right: 30px;
	height : 320px;
	border: 1px solid #9999;
	text-decoration: none;
	color: #333;
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
.ticket_category{
	display: none;
}
.tt{
	height: 285px;
}
.chance{
	clear:both;
	font-weight : bold;
	padding-top : 50px;
	font-size: 500;
}
.modal-header, .close {
    background-color: white;
    color: black !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-body{
  	min-height:1000px;
  	width:100%;
  	padding:0px;
  	border-top: 2px solid #503396;
  }
  .modal2-body{
  	min-height:500px;
  	width:100%;
  	padding:20px;
  	border-top: 2px solid #503396;
  }
  .modal-title, .modal2-title{
  	float:left;
  	color:#503396;
  	font-weight: bold;
  }
 
  .left{
  	float:left;
  	width:45%;
  	min-height:560px;
  	text-align:center;
  	border-right: 1px solid #e5e5e5;
  	
  }
  .right{
  	float:right;
  	width:55%;
  	min-height:560px;
  }
  .row2{
  	margin: 0px;
  	padding: 25px 40px 20px 30px;
  	color:black;
  	border: 1px solid #9999;
  	
  }
  .row2_cont{
  
  }
  .btn_buy{
  	width:204px;
  	height: 60px;
  	background-color: #503396;
  	border:0px;
  	color:white;
  	font-size: 18px;
  	font-weight: bold;
  	letter-spacing: 1px;
  }
  .store_title{
  	border-radius:3px;
  	border: 5px solid #e1e1e1;
  }
  .store_title >h4{
  	margin:0px;
  	padding:19px 20px 7px;
   	border-bottom: 1px solid #e1e1e1;
   	font-size: 14px;
   	font-weight:bold;
   	color:#333;
  }
  .store_title >dl{
  	margin:0px;
  	padding:8px 20px 17px;
   	font-size: 12px;
   	color:#333;
  }
  .store_title >dl>dt{
  	font-weight: normal;
  	float:left;
  }
  .store_payment_row{
  	border: 1px solid #ccc;
  	margin-top: 15px;
    border-radius: 2px;
    height: 45px;
  }
  .store_payment_row > .pull-left{
  	padding-left: 18px;
  	line-height: 23px;
    color: #503396;
    font-weight: bold;
  }
  .store_payment_row > .pull-right{
  	padding-right: 15px;
  	line-height: 43px;
    color: #503396;
    font-weight: bold;
    font-size:24px;
    text-align: center;
  }
  .store_payment_row > .f{
  	font-size:14px;
  	color:black;
  }
  .store_sms_info{
    margin-top: 15px;
    padding: 0 20px;
    border-radius: 2px;
    border: 1px solid #ccc;
    background-color: #f2f2f2;
  }
  .store_sms_info > dl {
    padding: 11px 0 12px;
    margin: 0px;
  }
  .store_sms_info dl:first-child {
    border-bottom: 1px dashed #999;
  }
  .store_sms_info > dl > dt {
    float: left;
    font-size: 13px;
  }
  .store_sms_info > dl > dd {
    float: right;
  }
  input[readonly="readonly"], input[readonly], input[text] {
    color: #666 !important;
    border: 1px solid #c2c2c2 !important;
    background: #f2f2f2 !important;
    width:65px;
    text-align: center;
    font-size: 12px;
    height: 26px;
  }
  .receiver > input{
  	color: #666 !important;
    border: 1px solid #c2c2c2 !important;
    background: white !important;
    width:65px;
    text-align: center;
    font-size: 12px;
    height: 26px;
  }
  .store_btn_wrap {
    padding: 30px 0;
    text-align: center;
    line-height: 49px;
  }
  .btn-l {
    float: none;
    width: 200px !important;
    text-align: center;
    font-weight: bold;
    font-size: 18px;
    line-height: 56px;
    margin-left: 0 !important;
    border-radius: 3px;
  }
  .btn-st2 {
    color: #351F66;
    border: 1px solid #351F66;
    background-color: #fff;
  }
  .btn-l.btn-st1 {
    border: 2px solid #503396;
 }
 .btn-st1 {
    color: #fff;
    border: 1px solid #351F66;
    background-color: #503396;
 }
 .reg_btn{
 	float:right;
 }
 .btn-info{
 	text-align: center;
 	width:50px;
 }
</style>
<script type="text/javascript">
	$(function() {
		var store_num;
		var store_name;
		var store_category;
		var store_period;
		var store_count;
		var store_price;
		var result="";
		//상품명 클릭시 모달창 뜨기
		$(".alink").click(function() {
			store_num= $(this).attr("title");
			store_name = $("#name"+store_num).text().trim();
			store_category = $("#cate"+store_num).text().trim();
			store_period = $("#per"+store_num).text().trim();
			//store_count= $("#count"+store_num).text();
			store_price= $("#price"+store_num).text().trim();
			$(".modal-title").text(store_category);
			$(".right_title").text(store_name);
			
			//$("#myModal").modal({remote:'myModal.jsp'});
			
			result={"store_num":store_num, "store_name":store_name, "store_category":store_category,"store_period":store_period,
					"store_count":store_count, "store_price":store_price,"modal_title":store_category,"right_title":store_name};
			$.ajax({
				url:"./myModal",
				type:"POST",
				data: result;
				success: function(res) {
					$("#myModalCont").html(res);
					$("#myModal").modal("show"); 
				},
				error:function(request, status, error) {
		            console.log("ajax call went wrong:" + request.responseText);
		        }
			});
		});
		
		//구매하기 버튼 눌렀을때
		$(".btn_buy").click(function() {
			$("#s_title").text(store_name);
			var str="";
			if(store_category=="메가티켓"){
				str="예매 가능 유효기간은 구매일로부터 "+store_period/12+"년입니다"
			}else if(store_category=="메가찬스"){
				str="＜주말/공휴일 사용가능, 종영시 사용 불가＞"
			}else if(store_category=="팝콘/음료/굿즈"){
				str="ooo부터~ooo까지";
			}
			$(".s_dd").text(str);
			$("#store_balance").text(store_price);
		}); 
		
		//kakaopay
		$("#check_module").click(function () {
         	var IMP = window.IMP; // 생략가능
        	IMP.init('imp72232577');// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       	IMP.request_pay({
        	pg: 'kakao', // version 1.1.0부터 지원.
         	/*'kakao':카카오페이,  	html5_inicis':이니시스(웹표준결제)   	'nice':나이스페이       	'jtnet':제이티넷       	'uplus':LG유플러스       	'danal':다날
        		'payco':페이코        	'syrup':시럽페이        	'paypal':페이팔*/
        	pay_method: 'card',
	       	merchant_uid: 'merchant_' + new Date().getTime(),
        	name: '주문명:'+store_name,
        	//결제창에서 보여질 이름
        	amount: store_price,
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
        	$.post("./storePurchase",{
        		id: "${sessionScope.member.id}",
       	   	 	category: store_category,
       	     	store_name: store_name,
       	     	buy_count: "1",
       	     	store_price: store_price,
       	     	store_period: store_period
       	     	
        		}, function(data){
        	         result="success";
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
			<div class="reg_btn">
				<a href="./storeReg" class="btn btn-primary">상품등록</a>
			</div>
			
			<div class="ticket">
				<div class="ticket_list">
					<ul>
						<c:forEach items ="${megaTicket}" var="dto" varStatus="i">
						<a href="" class="alink" data-toggle="modal" data-target="#myModal" title="${dto.store_num}">
						<li>
							<div class="tt">
								<img alt="" src="../images/ticket${i.count}.jpg" >
								<div class="ticket_info" id="name${dto.store_num}">
									${dto.store_name}
								</div>
							</div>
							<div class="ticket_price" id="price${dto.store_num}">
								${dto.store_price}
							</div>	
							<div class="ticket_category" id="cate${dto.store_num}"> <!-- display none -->
								${dto.store_category}
							</div>							
							<div class="ticket_category" id="per${dto.store_num}"> <!-- display none -->
								${dto.store_period}
							</div>	
							<div class="ticket_category" id="price${dto.store_num}"> <!-- display none -->
								${dto.store_price}
							</div>										
						</li>
						</a>
						</c:forEach>
						
					</ul>
				</div>
			</div> 
			
			<div class="chance">메가찬스</div>
			<div class="ticket">
				<div class="ticket_list">
					<ul>
						<c:forEach items ="${megaChance}" var="dto" varStatus="i">
						<a href="" class="alink" data-toggle="modal" data-target="#myModal" title="${dto.store_num}">
						<li>
							<div class="tt">
								<img alt="" src="../images/chance${i.count}.jpg" >
								<div class="ticket_info" id="name${dto.store_num}">
									${dto.store_name}
								</div>
							</div>
							<div class="ticket_price" id="price${dto.store_num}">
								${dto.store_price}
							</div>	
							<div class="ticket_category" id="cate${dto.store_num}"><!-- display none -->
								${dto.store_category}
							</div>		
							<div class="ticket_category" id="per${dto.store_num}"> <!-- display none -->
								${dto.store_period}
							</div>	
							<div class="ticket_category" id="price${dto.store_num}"> <!-- display none -->
								${dto.store_price}
							</div>										
						</li>
						</a>
						</c:forEach>
						
					</ul>
				</div>
			</div>
			
			<div class="chance">팝콘/음료/굿즈</div>
			<div class="ticket">
				<div class="ticket_list">
					<ul>
						<c:forEach items ="${goods}" var="dto" varStatus="i">
						<a href="" class="alink" data-toggle="modal" data-target="#myModal" title="${dto.store_num}">
						<li>
							<div class="tt">
								<img alt="" src="../images/pop${i.count}.jpg" >
								<div class="ticket_info" id="name${dto.store_num}">
									${dto.store_name}
								</div>
							</div>
							<div class="ticket_price" id="price${dto.store_num}">
								${dto.store_price}
							</div>	
							<div class="ticket_category" id="cate${dto.store_num}"> <!-- display none -->
								${dto.store_category}
							</div>	
							<div class="ticket_category" id="per${dto.store_num}"> <!-- display none -->
								${dto.store_period}
							</div>	
							<div class="ticket_category" id="price${dto.store_num}"> <!-- display none -->
								${dto.store_price}
							</div>	
							<div class="ticket_category" id="count${dto.store_num}"> <!-- display none -->
								${dto.store_count}
							</div>	
							<div class="ticket_category" id="cancel${dto.store_num}"> <!-- display none -->
								${dto.store_cancel}
							</div>																
						</li>
						</a>
						</c:forEach>
						
					</ul>
				</div>
			</div>
		</div>
		<!-- end of sub_menu -->
	</div>
	
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" id="myModalCont">
      
      </div>
    </div>
  </div>
  
  
  <!-- modal 2 -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal2-title">결제하기</h4>
        </div>
        <div class="modal2-body">
          <div class="store_title">
          	<h4 id="s_title"></h4>
          	<dl class="s_period">
          		<dt>유효기간: </dt>
          		<dd class="s_dd"></dd>
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
      </div>
      
    </div>
  </div><!-- end of modal2 -->
	
	<jsp:include page="../temp/footer.jsp" />
</body>
</html>