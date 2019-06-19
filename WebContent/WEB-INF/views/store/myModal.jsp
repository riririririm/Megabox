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
		padding-top:10px;
		padding-bottom:20px;
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
		var num;
		var price=$("#total_price").attr("title")*1;
		var total_price=0;
		var sname="";
		var scategory="";
		var speriod="";
		var buy_count=1;
		
		$("#btn_subtrac").click(function() {
			num=$("#itemCnt").val()*1;
			if(num>1){
				num--;
				$("#itemCnt").val(num);
				buy_count=num;
				$("#store_total_price").val(price*num);
				$("#total_price").text(price*num+"원");
				
			}
		});
		
		$("#btn_plus").click(function() {
			num=$("#itemCnt").val()*1;
			if(num<8){
				num++;
				$("#itemCnt").val(num);
				buy_count=num;
				$("#store_total_price").val(price*num);
				$("#total_price").text(price*num+"원");
			
			}
		});
		
		//구매하기 버튼 눌렀을때
		$(".btn_buy").click(function() {		
			$("#store_buy_count").val(buy_count);
			$("#store_total_price").val(price*buy_count*1);
			
			var queryString = $("form[name=myModal_form]").serialize() ;
			
			$.ajax({
				url:"./myModal2",
				type:"POST",
				data: queryString,
				success: function(res) {
					$("#myModal2Cont").html(res);
					$("#myModal2").modal("show"); 
				},
				error:function(request, status, error) {
		            console.log("ajax call went wrong:" + request.responseText);
		        }
			});
			
		}); 
		
	});//end of script
	
	
</script>
</head> 
<body>
  <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${storeDTO.store_category }</h4>
        </div>
        <div class="modal-body">
        <div class="modal-body22">
          	<div class="left">
          		<img alt="img" src="../storeUpload/${store_img }">
          	</div>
          	<div class="right">
          		<form id="myModal_form" name="myModal_form">
          			<input type="hidden" id="store_category" name="store_category" value="${storeDTO.store_category }">
          			<input type="hidden" id="store_num" name="store_num" value="${storeDTO.store_num }">
          			<input type="hidden" id="store_name" name="store_name" value="${storeDTO.store_name}">
          			<input type="hidden" id="store_period" name="store_period" value="${storeDTO.store_period }">
          			<input type="hidden" id="store_buy_count" name="store_buy_count" >
          			<input type="hidden" id="store_price" name="store_price" value="${storeDTO.store_price }">
          			<input type="hidden" id="store_total_price" name="store_total_price" >
          		<div class="row2">
          			<p class="right_title">${storeDTO.store_name}</p>
          		</div>
          		<div class="row2 row2_cont">
          			<ul class="font2">
          				<li><span class="font1">사용가능 영화관 : </span>전체영화관</li>
          				<li><span class="font1">사용제외 지점 : </span>
          					<c:forEach items="${store_noTheaters }" var="noTh">
          						<span>${noTh} </span>
          						<input type="hidden" name="store_noTheaters" value="${noTh}">
          					</c:forEach>
          				</li>
          				<li>
          					<span class="font1">유효기간 : </span>
          					예매 가능 유효기간은 구매일로부터 ${storeDTO.store_period }개월입니다.
          				</li>
          				<li>
          					<span class="font1">판매수량 : </span>
          					1회 ${storeDTO.store_count}개 구매가능
          				</li>
          				<li>
          					<span class="font1">구매 후 취소 : </span>
          					${storeDTO.store_cancel }
          				</li>
          			</ul>
          		</div>
          		</form>
          		<div class="row2">
          			<ul class="font2">
          				<li>
          					<span class="font1">스토어 판매가 : </span>
          					<span class="alignRight">${storeDTO.store_price } 원</span>
          				</li>
          				<li>
          					<span class="font1">수량 : </span>
          					<span class="alignRight">
								<p class="num_btn_box">
								<button id="btn_subtrac" title="수량 1 감소">-</button>
								<input type="text" title="티켓 수량 입력" value="1" id="itemCnt" style="width:30px; text-align: center;">
								<button id="btn_plus" title="수량 1 증가">+</button>
							</p>
							</span>
          				</li>
          			</ul>
          		</div>
          		<div class="row2">
          			<ul class="font2">
          				<li>
          					<span class="font1">총 상품 금액 : 
          					<span class="alignRight font3" id="total_price" title="${storeDTO.store_price }">${storeDTO.store_price }원</span>
          				</li>
          			</ul>
          			<div class="row">          			
          				<div class="btn_info alignLeft">* 구매 전 사용가능 영화관을 꼭 확인해주세요.</div>
          				<div class="alignRight"><button class="btn_buy" data-toggle="modal" data-target="#myModal2">구매하기</button></div>
          			</div>
          		</div>
          	</div><!-- end of right -->
          	</div>
          	<div class="bottom">
          		<img alt="info" src="../images/store_announce.png">
          	</div>
          	<div class="bottom">
          		<img alt="info" src="../images/store_announce2.png" style="margin-bottom:50px;">
          	</div>
          	<div class="bottom">
          		<a href="./storeUpdate?store_num=${storeDTO.store_num }" class="btn">상품수정</a>
          		<a href="./storeDelete?store_num=${storeDTO.store_num }" class="btn">상품삭제</a>
          	</div>
        </div><!-- end of body -->

	<!-- modal 2 -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" id="myModal2Cont"></div>

		</div>
	</div>
	<!-- end of modal2 -->
</body>