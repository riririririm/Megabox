<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../temp/bootstrap.jsp" />
<style type="text/css">
.container {
	width: 100%;
	height: 1500px;
	padding: 3% 0 0 0;
	position: relative;
	overflow: hidden;
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

.book_table{
	height: 500px;
}
.book_content{
	border-collapse: collapse;
	border-top: 3px solid #503396;
	border-bottom: 1px solid #e1e1e1;
}
.note{
	margin : 0px 20px 0px 20px;
	padding : 0px 10px 0px 10px;
	border: 3px solid #e1e1e1;
}
.note li{
	font-size : 18px;
	list-style: none;
	line-height: 30px;
}

 .nav-tabs li.active a {
    color: #555 !important;
   border: 1px solid #ddd;
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
					<li><a href="${pageContext.request.contextPath}/myPage/bookPage"><img src="../images/book.PNG"></a></li>
					<li><a href="./myStorePage"><img src="../images/store.PNG"></a></li>
					<li><img src="../images/personal_info.PNG"></li>
					<li>
						<a href="./myQnA">
						<img src="../images/qna.PNG" style="margin-right: 0px;"></a>
					</li>
				</ul>
			</div>
			<div class="reset"></div>
			<div class="book">
				<div style=" margin: 30px 0px 15px 0px;">
					<strong>예매 확인/취소</strong> &nbsp;&nbsp; 예매하신 영화 내역과 취소 내역을 확인할 수
					있습니다.
				</div>

				<div class="reset"></div>
				<!-- 내역 tab start-->
				<div class="mt-3">
					<!--내역 content start-->
					<div class="tab" style="margin-bottom: 20px;">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#reserve" style="width: 120px;">예매 내역</a></li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#pass" style="width: 120px;">지난 내역</a></li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#cancel" style="width: 120px;">취소 내역</a></li>
						</ul>
					</div>
					<!-- 내역 content end-->
					
					<div class="tab-content book_table">
						<!-- 예매내역 start-->
						<div id="reserve" class="tab-pane active">
							<table class="book_content table">
								<tr>
									<td>NO</td>
									<td>예매번호</td>
									<td>영화명</td>
									<td>영화관</td>
									<td>상영일시</td>
									<td>예매일</td>
									<td>예매취소</td>
								</tr>
							</table>
						</div>
						<!-- 예매내역 end-->
						<!-- pass start-->
						<div id="pass" class=" tab-pane fade">
							<table class="book_content table">
								<tr>
									<td>NO</td>
									<td>예매번호</td>
									<td>영화명</td>
									<td>영화관</td>
									<td>상영일시</td>
									<td>예매일</td>
									<td>예매취소</td>
								</tr>
							</table>
						</div>
						<!-- pass end-->
						<!-- cancel start-->
						<div id="cancel" class="tab-pane fade">
							<table class="book_content table">
								<tr>
									<td>NO</td>
									<td>예매번호</td>
									<td>영화명</td>
									<td>영화관</td>
									<td>상영일시</td>
									<td>예매일</td>
									<td>예매취소</td>
								</tr>
							</table>
						</div>
						<!-- cancel end-->
					</div>
				</div>
				<!-- 내역 tab end-->
				<p>&gt; 자세한 내용은 아래 유의사항을 확인 해 주세요.</p>
				<div class="mt-3">
					<!-- Nav tabs-->
					<div class="tab">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#home" style="width: 120px;">예매 및 결제</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#menu1" style="width: 120px;">티켓 교환방법</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#menu2" style="width: 120px;">취소 및 환불규정</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#menu3" style="width: 120px;">관람유의사항</a></li>
						</ul>
					</div>
					<!-- Tab panes-->
					<div class="tab-content">
						<div id="home" class="tab-pane active">
							<div class="note">
							<ul class="icon_list mypage" style="padding-left: 0px;">
								<li>관람 등급을 반드시 확인해주시기 바랍니다.</li>
								<li>만 4세(48개월) 이상부터는 영화티켓을 반드시 구매하셔야 입장 가능합니다.</li>
								<li>홈페이지 예매 현황이 매진인 경우에도 영화관 현장에 잔여석이 남아있는 경우, 현장에서 구매
									가능합니다.</li>
								<li>할인 카드로 결제 시, 할인 내역은 청구서에서 확인 가능합니다.</li>
								<li>예매 변경은 불가능하며, 취소 후 재 예매를 하셔야만 합니다.</li>
								<li>영수증은 상영일 기준 약 3개월까지 '나의 메가박스'에서 출력하실 수 있습니다. 단, 신용카드로
									예매하신 경우만 한합니다.</li>
								<li>상영시간 이후 관람하신 영화의 영수증 출력을 원하실 경우, 관람하신 영화관에서 출력 가능합니다.</li>
								<li>취소하신 내역이 나타나지 않거나 궁금하신 사항이 있으시면, <strong
									class="c_purple">고객센터 &gt; 1:1문의</strong> 또는 ARS(1544-0070
									09:00~21:00)로 문의해 주시기 바랍니다.
								</li>
							</ul>
							</div>
						</div>
						<!-- 예매 및 결제-->
						<div id="menu1" class=" tab-pane fade">
							<div class="note">
							<ul class="icon_list mypage" style="padding-left: 0px;">
								<li>무인 발매기(키오스크)에서 발권하실 경우 예매번호를 입력하시면 티켓을 편하게 발권하실 수 있습니다.</li>
								<li>매표소에서 발권하실 경우 티켓교환권을 출력하여 매표소에 방문하시면 티켓으로 교환하실 수 있습니다.</li>
								<li>(티켓교환권 출력이 어려운 경우, 예매번호와 신분증을 지참하시면 매표소에서 티켓을 수령하실 수
									있습니다.)</li>
							</ul>
							</div>
						</div>
						<div id="menu2" class="tab-pane fade">
							<div class="note">
							<ul class="icon_list mypage" style="padding-left: 0px;">
								<li>현장 취소를 하는 경우 상영시간 이전까지만 가능하며, 상영시간 이후 취소나 환불은 되지 않습니다.</li>
								<li>홈페이지 또는 모바일에서 예매한 내역을 취소 할 경우 부분 취소는 불가능합니다.</li>
								<li>온라인(홈페이지/모바일) 예매 취소는 상영시간 20분전까지 입니다.</li>
								<li>위탁 예매 사이트 이용 시 취소 및 환불 규정은 해당 사이트 규정을 따릅니다.</li>
								<li>LIVE 공연 콘텐트는 취소 기준은 아래와 같습니다.</li>
								<li class="no_bg_tab_tx">- 관람 4일전 : 취소 가능</li>
								<li class="no_bg_tab_tx">- 관람 3일 ~ 1일전 : 취소 수수료 부담 후 취소 가능</li>
								<li class="no_bg_tab_tx">- 관람 당일 : 취소 및 환불 불가</li>
								<li>공연 관람시 시작 시간 이후에는 입장이 제한 됩니다.</li>
								<li><strong class="c_purple">발권된 티켓은 상영시간 전까지 현장
										방문 시에만 취소가 가능합니다.</strong></li>
							</ul>
							</div>
						</div>
						<div id="menu3" class="tab-pane fade">
							<div class="note">
							<ul class="icon_list mypage" style="padding-left: 0px;">
								<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
								<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
							</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../temp/footer.jsp" />
</body>
</html>