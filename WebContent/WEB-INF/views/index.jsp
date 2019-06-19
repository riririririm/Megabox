<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="./temp/bootstrap.jsp"/>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style type="text/css">
  	.container {
		width: 100%; padding:0; 
	}
	#contents_wrap {
		width:100%;
	}
	#myCarousel {
		display: block;
	}
	.carousel-inner {
		display: block; height:651px; position: absolute;
	}
	.carousel-inner img {
		width : 1600px; height: 651px; position: absolute;
	}
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
		height : 651px;
	}
	.carousel-control {
		width : 15%; display: block; left:0; height: 651px; margin-top: 51px;
	}
	#myCarousel { 
		width: 100%; height: 651px; float: none; margin-top: 51px;
	}
	#section1 {
		width:100%; height: 701px; padding : 70px 0px 80px 0px;
	}
	#flip_wrapper {
		width : 984px; height: 565px; margin: 0 auto;
		white-space: nowrap; word-wrap: break-word;
    	display: block;
	}
	#flip_box { 
	 	width : 984px; height : 565px;
	 	}
	#flip_dl {
		height: 565px; padding : 0; margin: 0;
		list-style: none;
		position: relative;
	}
	#flip_btn1 {
		left : 340px; position: absolute; display: block;
		width: 160px; height: 50px;
	}
	#flip_btn2 {
		left : 500px; position: absolute;
		width: 160px; height: 50px;
		display: block;
	}
	#box_office {
		width: 100%; height: 100%;
		border : 1px solid gray; background-color: #d9d9d9;
		color : #503396; text-align: center; line-height: 3.2em; text-decoration: none;
		display: block;
	}
	#release_movie {
		width: 100%; height: 100%; border : 1px solid gray;
		text-align: center; line-height: 3.2em; text-decoration: none;
		color : #503396;
		display: block;
	}
	#tab1 {
		width: 984px; height: 485px; position: absolute; top :80px;
	}
	#tab2{
		width: 984px; height: 485px;
		position: absolute; top :80px;
		display: none;      /* ---------숨겨둠--------*/
	}
	.text-right {
		text-align: right; margin-right: 10px;
	}
	#movie_all1 {
		text-decoration: none;
	}
	#movie_all2 {
		text-decoration: none;
	}
	#movie_slide1 {
		width: 984px; height: 485px; position: relative; overflow: hidden;
	}
	#movie_slide2 {
		width: 984px; height: 485px; position: relative; overflow: hidden;
	}
	#movie_list1 { 	/* ul */
		list-style: none;
		width: 1968px; height:472px; margin-left: 0px; padding: 0;
		
	}
	#movie_list2 { 	/* ul */
		list-style: none;
		width: 1968px; height:472px; margin-left: 0px; padding: 0;
		
	}
	.box_movie {
		width: 232px; height: 458px;
		background: #fff; border: 1px solid gray;
		margin: 7px; float: left; display: block;
	}
	.release_movie {
		width: 232px; height: 458px;
		background: #fff; border: 1px solid gray;
		margin: 7px; float: left; display: block;
	}
	#section2 {
		width: 100%; height: 408px; padding: 0 0 80px;
	}
	#section2_wrap {
		width: 970px; height: 328px; margin: 0 auto;
	}
	#main_notice {
		width: 460px; height: 65px; float: left; border-bottom: 1px solid gray;
	}
	#main_notice > h3{
		height: 65px; margin: 0;
	}
	#notice_list {
		width: 460px; height: 235px;
		padding: 0; margin : 0; line-height:1;
	}	
	#notice_list > ul {
		list-style: none; padding: 0;
	}
	.list_tab {
		padding:11px 0px;
	}
	.notice_detail {
		text-decoration: none;
	}
	#main_qna {
		width: 460px; height: 65px;
		float: left; margin-left: 50px; border-bottom: 1px solid gray;
	}
	#main_qna > h3{
		height: 65px; margin: 0;
	}
	#main_banner {
		width: 970px; height: 232px; margin: 0 auto;
	}
	#plus {
		width: 20px; height: 20px; float: right;
	}
	.action_hidden {
		display: none;
	}
	/* ========= 박스오피스 / 최신 개봉작 style =========== */
	.api_img1 {
		width: 230px; height: 336px;
	}
	#thumb_flip {
		width: 100%; height: 336px; position: relative;
	}
	#film_img1 {
		width: 230px; height: 336px;
	}
	.upper {
		width: 100%; height: 336px;
		z-index: 2; position: absolute;
		visibility: visible;
	}
	.film_box {
		margin-top: 20px; margin-left:10px; overflow: hidden;
	}
	
	
	.boxoffice_num{
		width: 44px; height: 39px; position: absolute; top: 8px; 
		padding: 0; margin: 0; line-height:2.3em; font-size :1.2em;
		background-color: hsl(180, 100%, 30%, 0.8); color: white; text-align: center;
	}
	.lower {
		width: 100%; height: 100%;
		z-index: 1; position: absolute;
		visibility: hidden;
	}
	#starScore {
		width: 180px; height: 30px;
		position: absolute; top: 110px; left: 37px;
	}
	.back_wrap {
		width: 212px; padding : 9xp;
		z-index: 1; position: absolute;
	}
	.bg {
		width: 230px; height: 336px; display: block; 
		zoom:1; opacity:.75;
		position: absolute; top:7px;
	}
	.blank {
		overflow: hidden; display: block;
	}
	.blind {
		overflow: hidden;
	}
	.front_info {
		width: 230px; height: 72px;
	}
	.movie_info {
		width: 230px; height: 66px; padding: 0 13px 14px;
	}
	
	.film_btn_wrap {
		width: 204px; height: 0px; margin-top: 20px;
	}

	
	.film_btn {
		width: 91px; height: 46px; display: block; background-color: #d9d9d9;
		float: left; margin-left: 6px; border: 1px solid white;
		text-decoration: none; text-align: center;
	}
	/*------------- modal style -----------------*/
	.modal-dialog{
		margin: 0 auto; width:968px; height: 2000px;
		padding: 90px 0 55px;
	}
	.modal-content {
		width: 968px; height: 100%; margin: 0 auto; 
		padding : 65px 40px 5px;
		background-clip: border-box; border-radius: 0px;
	}
	.close {
		position: absolute; top: -38px; right : 0px;
    	width: 38px !important; height: 38px !important; margin: 0 !important;
    	border: 1px solid #cdcdcd !important; border-bottom:0px;
    	opacity: 1;
	}
	button.close {
		background: white;
	}
	.modal_wrapper {
		width: 968px; height: 100%; margin: 0 auto; padding: 90px 0 55px;
	}
	.modal_contents{
		width: 100%; padding: 65px 40px 5px; background-color: white;
	}
	.modal_detail {
		width: 888px; height: 376px;
	}
	.popupbox1 {
		width: 888px; height: 376px; margin-bottom: 60px;
	}
	.left_wrap{
		width: 230px; height: 376px; float: left;
	}
	.left_wrap > img{
		width: 230px; height: 336px;
	}
	.right_wrap {
		width: 623px; height: 327.5px; float: right;
	}
	.modal_title_wrap {
		width: 623px; height: 68px;
		border-bottom: 1px solid #e5e5e5;
	}
	.modal_text_wrap {
		width: 623px; height: 204.5px; padding-bottom: 19px;
		border-bottom: 1px solid #e5e5e5;
	}
	.reservation_wrap {
		width: 623px; height: 42px; margin-top: 9px;
	}
	.left_p {
		width: 181px; height: 42px; padding-right: 20px;
		position: relative; float: left;
	}
	.divider {
		width: 1px; height: 20px; background: #e1e1e1;
		position: absolute; display: block; right :0; top :10px;
		display: block;
	}
	.right_p {
		width: 181px; height: 42px; padding-left: 20px;
		position: relative; float: left;
	}
	.modalBtn_book {
		width: 121px; height: 40px; padding: 1px 6px;
		float:right; display: block;
	}
	.modal_info_wrap {
		margin-top: 11px; list-style: none; padding: 0;
	}
	.madal_raing {
		width: 623px; height: 44px;
	}
	.popupbox2 {
		width:888px; height : 174px;
		margin-bottom: 60px;
	}
	#summary {
		height: 140px;
	}
	.popupbox3 {
		width:888px; height : 1090px;
		margin-bottom: 60px;
	}
	.modal_review_wrap {
		width: 888px; height: 123px; margin-bottom: 30px;
	}
	.review_write {
		width: 888px; height: 123px;
	}
	.review_id {
		width: 888px; height: 20px; margin: 7px 0 10px;
	}
	.review_form {
		width: 888px; height: 86px;
	}
	.review_input {
		width: 885px; height: 84px; border: 1px solid #e5e5e5;
	}
	.review_rate {
		width: 188px; height: 69.5px; float:left; 
	}
	.write_textarea {
		width: 585px; height: 84px; float: left;
	}
	.writeBtn {
		width : 110px; height : 84px; padding:1px 6px;
		border: none;
	}
	.review_list_wrap {
		width: 888px; height: 864px;
	}
	.review_list_wrap >ul {
		list-style: none; display:block;
		width: 300px; height: 13px; padding-right: 6px; margin-bottom: 15px; right:0;
	}
	.review_list_wrap >ul >li {
		float: right !important; padding-left: 10px; border-left: 1px; margin-left: 10px;
	}
	.review_list_wrap >ul >li >a {
		text-decoration: none;
	}
	.review_list {
		width: 888px; height: 789px;
		border-top: 1px solid #e5e5e5;
	}
	.review_row {
		width: 888px; height: 138px;
	}
	.review_cell:first-child {
		border-right: 1px solid #e5e5e5;
	}
	.review_cell {
		width: 50%; height: 100%; padding:20px 50px; display : table-cell;
		border-bottom: 1px solid #e5e5e5; overflow: hidden; float: left;
		
	}
	.cell_content {
		width: 314px; height: 97px;
	}
	.cell_member_id {
		width: 314px; height: 20px; margin-bottom: 1px;
	}
	.cell_data {
		width: 314px; height: 17px;
	}
	.cell_content > p {
		width: 314px; height: 20px; margin-bottom: 35px;
	
	}
</style>

</head>
<body>
<!-- 헤더 -->
<jsp:include page="./temp/header.jsp"/>
	
<!-- 컨테이너 -->
		<!---------- Contents Start ---------->
	<div class="container">
		<div id="contents_wrap">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
 	 		<!-- Indicators -->
  				<ol class="carousel-indicators">
    				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    				<li data-target="#myCarousel" data-slide-to="1"></li>
    				<li data-target="#myCarousel" data-slide-to="2"></li>
    				<li data-target="#myCarousel" data-slide-to="3"></li>
    				<li data-target="#myCarousel" data-slide-to="4"></li>
  				</ol>
  				<!-- Wrapper for slides -->
  					<div class="carousel-inner">
    					<div class="item active">
      						<img src="/Test/images/main1.jpg">
      					</div>
    					<div class="item">
     						<img src="/Test/images/main2.jpg">
    					</div>
    					<div class="item">
     						<img src="/Test/images/main3.jpg">
    					</div>
    					<div class="item">
     						<img src="/Test/images/main4.jpg">
    					</div>
    					<div class="item">
     						<img src="/Test/images/main5.jpg">
    					</div>
  					</div>   
			</div>  <!------------ carousel end -------------->
			
		    <!-- Left and right controls -->
    		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      		<span class="sr-only">Previous</span>
   			</a>
    		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      		<span class="sr-only">Next</span>
    		</a>
    </div>    <!-- contents_wrap end -->
    
    	<div id="section1">
  			<div id="flip_wrapper"> 
  				<div id= "flip_box">
  					<dl id= "flip_dl">
  						<dt id = "flip_btn1">
  							<a href = "#boxOffice" id="box_office">박스 오피스</a>
  						</dt>
  						<dd id="tab1">
  							<p class="text-right"><a href="${pageContext.request.contextPath}/movieAPI/boxoffice" id="movie_all1">박스 오피스 전체보기 </a></p>
  							<div id="movie_slide1">
  							
  								<ul tabindex=0 id="movie_list1">
  									<!-------------- forEach -------------->
  									<c:forEach begin="1" end="4" var="i">
  									<li class="box_movie">
  										<div id="thumb_flip">
  											<div class="upper">
  												<span class ="boxoffice_num"><strong> ${i }</strong> </span>		<!-- number -->

  												<div class="film_img1" id="box_poster${i }"> </div>           <!----- 영화 포스터 ------>
  												
  											</div>
  												
  											<div class="lower">
  												<div class="back_wrap">
  													<div id ="starScore">
  														<input type ="image" src="#" alt="별점 1, 괜히 봤어요"  title = "별점 1, 괜히 봤어요"> &nbsp;
  													
  														<input type = "hidden" name="score">
  													</div>
  													<p> 평점</p>
  													<button type = "button"> 보고싶어 </button>
  												</div>
  												<span class="bg"></span>
  												<a href ="#" class="blank" title="상세보기"> <span class="blind"> 상세보기 </span></a>
  											</div>  <!-- lower end -->
  										
  										</div>       <!-- thumb_flip end -->
										<div class = "front_info">
											<div class="movie_info">
												<h3 class="film_box">
													<a href ="#myModal${i }" data-toggle="modal" class="film_title1 film_title" id="box_title${i }"> </a>    <!---- 영화 타이틀 ---->
												</h3>
								<!---------------- 버튼  ------------------>
												<div class="film_btn_wrap">		
													<button class="film_btn btn btn-primary" title="film_detail" data-toggle="modal" data-target="#myModal${i }">상세정보</button>    
													<button class="film_btn btn btn-primary" title="film_book" data-toggle="modal" data-target="#myModal">예매하기</button>
												</div>
											</div>
										</div>
  							
  									</li>
									</c:forEach>         
  								</ul>
  							
  							</div>
  						</dd>
  			<!-------------- 최신 개봉작 ----------------->
  						<dt id="flip_btn2">
  							<a href="#releseMovie" id="release_movie">최신 개봉작</a>
  						</dt>
  						<dd id="tab2">
  							<p class="text-right"><a href="${pageContext.request.contextPath}/movieAPI/releaseMovie" id="movie_all2">최신 개봉작 전체보기 </a></p>
  							<div id="movie_slide2">
  								<ul tabindex=0 id="movie_list2">
  								<c:forEach begin="1" end="4" var="i">
  									<li class="release_movie">
  										<div id="thumb_flip">
  											<div class="upper">
  												<span class ="boxoffice_num"><strong>${i }</strong> </span>		<!-- number -->
  												<div class="film_img2"> </div>           <!----- 영화 포스터 ------>
  											</div>
  											<div class="lower">
  												<div class="back_wrap">
  													<div id ="starScore">
  														<input type ="image" src="#" alt="별점 1, 괜히 봤어요"  title = "별점 1, 괜히 봤어요"> &nbsp;
  													
  														<input type = "hidden" name="score">
  													</div>
  													<p> 평점</p>
  													<button type = "button"> 보고싶어 </button>
  												</div>
  												<span class="bg"></span>
  												<a href ="#" class="blank" title="상세보기"> <span class="blind"> 상세보기 </span></a>
  											</div>  <!-- lower end -->
  										
  										</div>       <!-- thumb_flip end -->
  										
										<div class = "front_info">
											<div class="movie_info">
												<h3 class="film_box">
													<a href ="#" class="film_title2 film_title"> </a>    <!---- 영화 타이틀 ---->
												</h3>
												<div class="film_btn_wrap">
													
													<button class="film_btn btn btn-primary" title="film_detail" data-toggle="modal" data-target="#myModal${i}">상세정보</button>     
													<button class= "film_btn btn btn-primary" title="film_book">예매하기</button>
												</div>
				
											</div>
										</div>
  										
  									</li>
									</c:forEach>
  								</ul>
  							
  							</div>
  						  					
  					</dl> 		<!------------------- 최신 개봉작 end --------------------->
  				</div>		<!---- flip_box end ---->

  			</div>		<!---- flip_wrapper end ---->

    	</div>		<!-- section1 end -->
    	
    			
    	<div id="section2">
    		<div id="section2_wrap">
    			<div id= "main_notice">
    				<h3>공지사항
    				<a href="#" id="plus"><img src = "./images/plus.png"></a>
    				</h3>
    				<div id="notice_list">
    					<ul>
    						<li class="list_tab">
    							<p><span>| 날짜 </span></p>
    							<a href="#" class="notice_detail"> 공지사항 상세보기 </a>     						
    						</li>
    						<li class="list_tab">
    							<p><span>| 날짜 </span></p>
    							<a href="#" class="notice_detail"> 공지사항 상세보기 </a>     						
    						</li>
    						<li class="list_tab">
    							<p><span>| 날짜 </span></p>
    							<a href="#" class="notice_detail"> 공지사항 상세보기 </a>     						
    						</li>
    						<li class="list_tab">
    							<p><span>| 날짜 </span></p>
    							<a href="#" class="notice_detail"> 공지사항 상세보기 </a>     						
    						</li>
 
    					</ul>
  
    				</div>	<!-- notice_list end -->
  					
    			</div> 		<!-- main_notice end -->
    			<div id="main_qna">
    				<h3>QNA</h3>

					<h1>뭐 넣을지 ?????</h1>
					
    			</div>	<!-- main_qna end -->
    			
    		</div>		<!-- section2_wrap end -->
    		
    	</div> 		<!-- section2 end -->
    	<div id="main_banner">
    		<h1>배너 넣을지 말지</h1>
    	
    	</div>

    </div>	<!-- container end -->
    
	<!------------------------ 상세정보 Modal ------------------------------->
	<c:forEach begin="1" end="4" var="modal">
	
	<div class="modal fade" id="myModal${modal }" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal_detail">
					<div class="popupbox1">
						<div class="left_wrap" id="modal_img${modal }">
							<!---------------- 영화 포스터 ------------------->
						</div>
						<div class="right_wrap">
							<div class="modal_title_wrap">
								<h2>
									<span id="modal_title${modal }"> </span>
								</h2>
							</div>
							<div class="modal_text_wrap">
								<div class="reservation_wrap">
									<p class="left_p">
										<span class="smallStar">
											<span class="fill">	명 참여</span>							
										</span>
									<strong class="averageScore"></strong>
									<span class="divider"></span>
									</p>
									<p class="right_p"> 예매율
										<strong>1</strong> 위 
										<span> %</span>
									</p>
									<button type="button" class="modalBtn_book btn btn-primary">예매하기</button>
								</div>
									<input type="hidden" id="modal_code${modal }">
								<ul class="modal_info_wrap">
									<li id="modal_release${modal }"><strong>개봉일 : </strong></li>
									<li id="director${modal }"><strong>감독 : </strong></li>
									<li id="actors${modal }"><strong>출연진 : </strong></li>
									<li id="movie_type${modal}"><strong>장르 : </strong></li>
								</ul>
							</div>          <!------------- modal_text_wrap end -------------->
							<div class="modal_rating"> 
							</div>		
						</div> 				<!--------------- right_wrap end --------------->
					</div> 						<!------------- popupbox1 end --------------->
					<div class="popupbox2">
						<h3>줄거리</h3>
						<p id="plot${modal}"></p>
						<div id="summary">
						</div>
					<div class="popupbox3">
						<h3>한줄평</h3><span>(0)</span>
					<div class="modal_review_wrap">
						<div class="review_write">
							<div class="review_id">							
							</div>		
											
							<form class="review_form">
								<div class="review_input">
									<div class="review_rate">
									</div>
									<div class="review_area">
										<textarea class="write_textarea"> </textarea>					
									</div>
									<div class="review_btn">
										<button type="submit" class="writeBtn btn btn-primary">등록</button>
									
									</div>
								</div>
							</form>
						</div>
					</div>			<!------------ modal_review_wrap end----------->
					<div class="review_list_wrap">
						<ul>
							<li><a>최신순</a></li>
							<li><a>추천순</a></li>
							<li><a>평점순</a></li>
						</ul>
						<div class="review_list">
							<c:forEach begin="1" end="5">
							<div class="review_row">
								<div class="review_cell">
									<div class="cell_content">
										<div class="cell_member_id">
											<strong>id</strong>
										</div>
										<div class="cell_data">
											<span>2019</span>
											<div class="cell_star">
											
											</div>
										</div>
										<p>
											<span>review content</span>
										</p>
									</div>
								</div> 		<!------------ review_cell end ----------->	
								<div class="review_cell">
									<div class="cell_content">
										<div class="cell_member_id">
											<strong>id</strong>
										</div>
										<div class="cell_data">
											<span>2019</span>
											<div class="cell_star">
											
											</div>
										</div>
										<p>
											<span>review content</span>
										</p>
									</div>
								</div>
														
							</div>			<!----------- review_row end ------------>
							</c:forEach>
						
						</div>
					</div>
					
					
				</div>
				</div>
			</div>
			<button type="button" class="close" class= "modal_close" data-dismiss="modal">&times;</button>

		</div>

	</div>
	</div>
	</c:forEach>
	

	
<!-- 풋터 -->
<jsp:include page="./temp/footer.jsp"/>


<script type="text/javascript">
	$(function() {
		$('#box_office').click(function() {
			$('#tab1').show();
			$('#tab2').hide();
			$("#box_office").css("background", "#d9d9d9");
			$('#release_movie').css("background", "white");
			$('#tab2').addClass("action_hidden");
			$("#tab1").removeClass("action_hidden");
		});
		$('#release_movie').click(function() {
			$('#tab1').hide();
			$('#tab2').show();
			$("#box_office").css("background", "white");
			$('#release_movie').css("background", "#d9d9d9");
			$('#tab1').addClass("action_hidden");
			$("#tab2").removeClass("action_hidden");
		});
		
		/* =========== 박스오피스 API ========= */
		
		$.getJSON("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&sort=repRlsDate&1&releaseDte=20190626&ServiceKey=19TKUUT86TYFU6699SQ4", function(data) {
			var num=1;
			data.Data.forEach(function(d) {
				d.Result.forEach(function(r) {
					var n = r.posters.indexOf("jpg")+3;
					var url = r.posters.substring(0,n);
		
					var img = '<img src="'+url+'" class="api_img1">';
					var title = r.title;
					var modal_img = '<img src="'+url+'" class="modal_img1">';
					var modal_title = r.title;
					var modal_release = r.repRlsDate;
					var movie_type = r.genre;
					var plot = r.plot;
					var movie_code = r.DOCID;
					
						r.director.forEach(function(dir) {
							var director = dir.directorNm;
						
					$('#box_poster'+num).append(img);	// 포스터 이미지
					$('#box_title'+num).append(title);	// 메인 타이틀
					
					
					$('#modal_img'+num).append(modal_img); 	// 모달 포스터 이미지
					$('#modal_title'+num).append(title);	// 모달 영화타이틀
					$('#modal_release' +num).append(modal_release);	// 모달 개봉일
					$('#director'+num).append(director);	// 모달 감독
					$('#movie_type'+num).append(movie_type); // 모달 장르
					$('#plot'+num).append(plot);
					$('#modal_code'+num).append(movie_code);
					
					num=num+1;
					
					});	//director
	
				});		// Result
			});		// Data
			
		/*	
			data.Data.forEach(function(d) {
				d.Result.forEach(function(r) {
					r.actor.forEach(function(act) {
						num=1;
						var actors = act.actorNm;
						
						$('#actors'+num).append(actors);
						num=num+1;
					});
				});
			});
			
			*/
			
		});		//Json
		
	});		// function
	



</script>

</body>
</html>