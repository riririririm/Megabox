<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어</title>
<jsp:include page="../temp/bootstrap.jsp"/>

<style type="text/css">
	h2{
		margin:0px;
	}
	.container{
		margin-top: 40px;
		min-height:800px;
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
  .row{
  	margin: 0px;
  	padding: 25px 40px 20px 30px;
  	color:black;
  	
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
		
		//상품명 클릭시 모달창 뜨기
		$(".alink").click(function() {
			store_num= $(this).attr("title");
			store_name = $("#num"+store_num).text();
			store_category = $("#cate"+store_num).text();
			store_period = $("#per"+store_num).text();
			store_count= $("#count"+store_num).text();
			store_price= $("#price"+store_num).text();
			$(".modal-title").text(store_category);
			$(".right_title").text(store_name);
		});
		
		//구매하기 버튼 눌렀을때
		$(".btn_buy").click(function() {
			$("#s_title").text(store_name);
			var str="";
			if(store_category=="메가티켓"){
				str="예매 가능 유효기간은 구매일로부터 "+store_period/12+"년입니다"
			}else if(store_category=="메가찬스"){
				str="＜주말/공휴일 사용가능, 종영시 사용 불가＞"
			}else{
				str="ooo부터~ooo까지";
			}
			$(".s_dd").text(str);
			$("#store_balance").text(store_count*store_price);
		}); 
		
	});
</script>
</head>
<body>
	<jsp:include page="../temp/header.jsp"/>
	<div class="container">
		<h1> 스토어 리스트 페이지 </h1>
		<a href="./storeReg" class="btn btn-primary">상품등록</a>
		<table class="table table-hover">
			<tr>
				<td>상품코드</td>
				<td>카테고리</td>
				<td>상품명</td>
				<td>사용가능매장</td>
				<td>사용불가매장</td>
				<td>유효기간</td>
				<td>1회 구매가능 횟수</td>
				<td>취소가능여부</td>
				<td>가격</td>
				
			</tr>

			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.store_num}</td>
					<td id="cate${dto.store_num}">${dto.store_category}</td>
					<td id="num${dto.store_num }">
						<c:catch>
						<c:forEach begin="1" end="${dto.depth}" varStatus="i">
						--
						<c:if test="${i.last}">&gt;</c:if>
						</c:forEach>
						</c:catch>
						<a href="" class="alink" data-toggle="modal" data-target="#myModal" title="${dto.store_num }">${dto.store_name}</a></td>
					<td>${dto.store_theater}</td>
					<td>${dto.store_noTheater}</td>
					<td id="per${dto.store_num}">${dto.store_period}</td>
					<td id="count${dto.store_num}">${dto.store_count}</td>
					<td>${dto.store_cancel}</td>
					<td id="price${dto.store_num}">${dto.store_price}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          	<div class="left">
          		<h3>image</h3>
          	</div>
          	<div class="right">
          		<div class="row">
          			<h2 class="right_title"></h2>
          		</div>
          		<div class="row">
          			<button class="btn_buy" data-toggle="modal" data-target="#myModal2">구매하기</button>
          		</div>
          	</div>
        </div>
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
          
        </div><!-- end of modal2-body -->
      </div>
      
    </div>
  </div>
	
	
	<jsp:include page="../temp/footer.jsp"/>
</body>
</html>