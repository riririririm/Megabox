<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../temp/bootstrap.jsp" />
<style type="text/css">
.container {
	width: 100%;
	height: 1500px; padding : 3% 0 0 0; position : relative;
	overflow: hidden;
	padding: 3% 0 0 0;
	position: relative;
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

.clearfix li {
	list-style: none;
}

.join_form {
	margin-top: 20px;
}

.join_form p {
	font-size: 20px;
}

.myPage {
	width: 970px;
	margin: 0 auto;
	height: 1300px;
}

.myPage_nav li {
	list-style: none;
	margin-top: 40px;
}

.myPage img {
	margin-right: 120px;
	float: left;
	border: 1px solid #ddd;
}
#store_table{
	height: 500px;
}
.store_content{
	border-collapse: collapse;
	border-top: 3px solid #503396;
	border-bottom: 1px solid #e1e1e1;
}

#store_table h4{
	margin: 50px 0px 30px 0px;
	letter-spacing: 2px;
}
.store_content td{
	text-align: center;
}

.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}

.modal {
        text-align: center;
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
		<!-- 나의 메가박스 -->
		<div class="myPage">
			<div class="myPage_nav">
				<ul style="padding-left: 0px;">
					<li>
						<a href="${pageContext.request.contextPath}/myPage/bookPage">
						<img src="../images/book.PNG"></a>
					</li>
					<li>
						<a href="./myStorePage"></a>
						<img src="../images/store.PNG">
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/member/myPersonalPage">
						<img src="../images/personal_info.PNG"></a>
					</li>
					<li>
						<a href="./myQnA">
						<img src="../images/qna.PNG" style="margin-right: 0px;"></a>
					</li>
				</ul>
			</div>
			<!-- 이미지 div -->
			<div class="reset"></div>
			<div id="store_table" >
				<h4 >스토어 구매내역</h4>
				<form >
					<table class="store_content table">
						<tr>
							<td>구분</td>
							<td>구매일</td>
							<td>상품명</td>
							<td>구매수량</td>
							<td>취소가능일</td>
						</tr>
						<c:if test="${buyList.size() eq 0}">
							<tr>
								<td colspan="8" style="padding-top:130px; text-align: center; height: 300px;">등록된 구매내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${buyList}" var="buy" varStatus="i"> <!-- list안에 있는 것을 하나 꺼내서 DTO에 집어 넣는다 -->
							<c:if test="${buy.state eq 0}">
								<tr>
									<td>${buy.category}</td>
									<td>${buy.buy_date}</td>
									<td>${buy.store_name}</td>
									<td>${buy.buy_count}</td>
									<td>
										${buy.expiry_date}까지
										<button type="button" title="${buy.history_num}" style="margin-left: 10px" id="btn_modal" data-toggle="modal"class="btn_buy" data-target="#myModal">취소</button>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</form>
				<c:if test="${buyList.size() ne 0}">
				<div >
						<ul class="pager">
							<c:if test="${pager.curBlock gt 1}">
								<li class="previous"><a href="./myStorePage?curPage=${pager.startNum-1}">Previous</a></li>
							</c:if>
							<li>
								<ul class="pagination">
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
									<li><a href="./myStorePage?curPage=${i}">${i}</a></li>
								</c:forEach>
								</ul>
							</li>
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<li class="next"><a href="./myStorePage?curPage=${pager.lastNum+1}">Next</a></li>
							</c:if>
						</ul>
				</div>
				</c:if>
				<div>
					<ul class="">
						<li>스토어 상품은 부분 환불이 불가합니다.<br>(ex. 3개의 쿠폰을 한 번에 구매하신 경우, 3개 모두 취소만 가능하며, 그 중 사용하신 쿠폰이 있는 경우 환불이 불가합니다.)</li>
						<li>MMS(모바일 상품권) 재전송은 최대 3회까지만 가능하며, 재전송 시에는 SMS형태로 전송됩니다.</li>
					</ul>
				</div>
				<h4 >취소내역</h4>
				<table class="store_content table">
					<tr>
						<td>구분</td>
						<td>구매일</td>
						<td>상품명</td>
						<td>구매수량</td>
						<td>취소일시</td>
					</tr>
					<c:if test="${cancelList.size() eq 0}">
						<tr>
							<td colspan="5" style="padding-top: 130px; text-align: center; height: 300px;">등록된 취소내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${cancelList}" var="cancel">
						<c:if test="${cancel.state eq 1}">
							<tr>
								<td>${cancel.category}</td>
								<td>${cancel.buy_date}</td>
								<td>${cancel.store_name}</td>
								<td>${cancel.buy_count}</td>
								<td>${cancel.cancel_date}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<c:if test="${cancelList.size() ne 0}">
				<div >
						<ul class="pager">
							<c:if test="${cancelPager.curBlock gt 1}">
								<li class="previous"><a href="./myStorePage?cancelPage=${cancelPager.startNum-1}">Previous</a></li>
							</c:if>
							<li>
								<ul class="pagination">
								<c:forEach begin="${cancelPager.startNum}" end="${cancelPager.lastNum}" step="1" var="i">
									<li><a href="./myStorePage?cancelPage=${i}">${i}</a></li>
								</c:forEach>
								</ul>
							</li>
							<c:if test="${cancelPager.curBlock lt cancelPager.totalBlock}">
								<li class="next"><a href="./myStorePage?cancelPage=${cancelPager.lastNum+1}">Next</a></li>
							</c:if>
						</ul>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- modal창 띄우기 -->
	<div id="myModal" class="modal fade" role="dialog" style="margin: auto;width: 517px;height: 500px;">
	<div class="modal-diaglod">
		<!-- Modal Content -->
		<div class="modal-content" style="width:500px">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">상품구매취소</h4>
			</div><!-- modal-header -->
			<div class="modal-body">
				<p class="m_text" >상품구매 취소를 하시겠습니까?</p>
				<div style="margin-top: 50px">
					<button type="button" id ="cancelStore" class="btn btn-default" title="" data-dismiss="modal">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
		<!-- modal-content -->
	</div>
</div>
	<jsp:include page="../temp/footer.jsp" />
	
	<script type="text/javascript">
		$('.btn_buy').click(function() { //유효기간옆에 있는 취소버튼
			var cancel = $(this).attr('title');
			$('#cancelStore').attr('title', cancel);
		});
		$('#cancelStore').click(function(){
			history_num = $('#cancelStore').attr('title');
			//alert($('#cancelStore').attr('title'));
			$.get("./storeCancel?history_num="+history_num, function(data){
				
			});
			location.reload();
		});
		
	</script>
</body>
</html>