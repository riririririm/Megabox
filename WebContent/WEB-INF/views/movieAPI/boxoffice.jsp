<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootstrap.jsp"></c:import>
<c:import url="../temp/header.jsp"></c:import>
<style type="text/css">
	#myPage {
		
	}

	#content_wrap {
		width: 100%;
		min-height: 2000px;
	}
	#sub_button_wrap{
		width: 970px;
		height: 61px;
		margin: 0 auto;
		margin-bottom: 25px;
		margin-top: 51px;
	}
	#sub_navi {
		width: 100%;
		height: 54px;
		border-top: 1px solid #e1e1e1;
		background-color: #f2f2f2;
		border-bottom: 3px solid #503396;
	}
	#sub_navi_wrap {
		width: 970px;
		height: 50px;
		margin: 0 auto;
	}
	#sub_menu {
		width: 970px;
		height: 50px;
		padding: 0;
		margin: 0 auto;
		padding : 0px 150px ;
	}
	
	#sub_menu > li {
		width: 70px;
		height : 50px;
		margin-left: 40px;
		margin-right: 100px;
		list-style: none;
		float: left;
		line-height: 3.5em;
	}

	#sub_menu >li > a {
		text-decoration: none;
		color : #cccccc;
		font-size: 14px;
		font-weight: bold;
	}
	
	#main_content {
		width: 100%;
		min-height: 2000px;
	}
	#main_container {
		width: 100%;
		min-height: 2000px;
		margin-top: 7px;
		margin-bottom: 85px;
	}
	#full{
		width: 100%;
		
		padding: 0 11px;
	}
	#flip_wrap{
		width: 80%;
		min-height: 2000px;
		margin: 0 auto;
	}
	#util_wrap {
		width: 100%;
		height: 27px;
		padding: 30px 7px 0;
	}
	#movie_list {
		width: 100%;
		min-height: 2000px;
		list-style: none;
		padding: 0px;
		margin
	
	}
	.box_movie {
		width: 232px; height: 458px;
		background: #fff; border: 1px solid #e5e5e5;
		margin: 7px; float: left; display: block;
	}

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
		height: 20px;
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
		width: 91px; height: 46px; display: block;
		float: left; margin-left: 6px; border: 1px solid white;
		text-decoration: none; text-align: center;
	}
	.film_title {
		height : 30px;
		overflow: hidden;
	}
	.film_box {
		overflow : hidden;
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
		width: 100%; height: 100%; padding:20px 50px; display : table-cell;
		border-bottom: 1px solid #e5e5e5; overflow: hidden; float: left;
		
	}
	.cell_content {
		width: 780px; height: 97px;
	}
	.cell_member_id {
		height: 20px; margin-bottom: 1px; float: left;
	}
	.cell_data {
	 height: 17px;
	}
	.cell_data > span {
		float: right; margin: 0 30px;
	}
	.cell_content > p {
		height: 20px; margin-bottom: 35px; margin-left: 30px;
		margin-right: 0 30px;
	
	}
</style>
</head>
<body>
<div id ="content_wrap">
	<div id="sub_button_wrap">
	
	</div>
	<div id="sub_navi">
		<div id="sub_navi_wrap">
			<ul id="sub_menu">
				<li><a href="#" class="select" id="sub1">박스오피스</a></li>
				<li><a href="#" class="select" id="sub2">최신개봉작</a></li>
				<li><a href="#" class="select" id="sub3">♥ 보고싶어</a></li>
				
				
			</ul>
		</div>
	</div>
	<div id="main_content">
		<div id="main_container">
			<div id="full">
				<div id="flip_wrap">
					<div id="util_wrap">
					</div>
					
					
					<ul id="movie_list">
					<c:forEach begin="1" end="24" var="i">
						<li class="box_movie"> 
							<div id="thumb_flip">
  								<div class="upper">
  									<span class ="boxoffice_num"><strong> ${i }</strong> </span>		<!-- number -->
  									<div class="film_img1" id="box_poster${i }"> 
  									</div>           <!----- 영화 포스터 ------>			
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
			
			
			</div>
		
		</div>
	
	
	
	</div>
	
	</div>

	<!------------------------ 상세정보 Modal ------------------------------->
	<c:forEach begin="1" end="500" var="modal">
	
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
											
											
											
											
							<!-------------- 리뷰 등록 폼 ------------->	
							
								<div class="review_input">
									<div class="review_rate">
									</div>
									
									<div class="review_area" id="code_hidden${modal }" title="movie_code">
									
									</div>
										<textarea class="write_textarea" id="contents"> </textarea>					
										
									<div class="review_btn">
										<button type="button" id="writeCode${modal }" class="writeBtn btn btn-primary">등록</button>
									
									</div>
								</div>
						</div>
					</div>			<!------------ modal_review_wrap end----------->
					<div class="review_list_wrap">
						<ul>
							<li><a>최신순</a></li>
							<li><a>추천순</a></li>
							<li><a>평점순</a></li>
						</ul>
						
						<!--------------------- 리뷰 리스트   --------------------->
						
						<div class="review_list">
		
					
			<div id="pager_wrap">
			<ul class="pager">
				<c:if test="${pager.curBlock gt 1}">
	    		<li class="previous"><a href="./reviewList?curPage=${pager.startNum-1}&reviewKind=${pager.search.communityKind}&search=${pager.search.search}">Previous</a></li>
	    		</c:if>
	    		<li>
	    			<ul class="pagination">
					   <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					    	<li><a href="./reviewList?curPage=${i}&reviewKind=${pager.search.communityKind}&search=${pager.search.search}">${i}</a></li>
					    </c:forEach>
					   
					</ul>
	    		
	    		</li>
	    		<c:if test="${pager.curBlock lt pager.totalBlock}">
	    		<li class="next"><a href="./reviewList?curPage=${pager.lastNum+1}&reviewKind=${pager.search.communityKind}&search=${pager.search.search}">Next</a></li>
	    		</c:if>
	  		</ul>
		</div>
						
						
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
	

<script type="text/javascript">
	$(function() {
		/*=================== 리뷰 등록 ======================*/
		$('.writeBtn').click (function() {
			var id = "${sessionScope.member.id}";
			var contents = $("#contents").val();
			var movie_code = $(this).val();
			
			$.get("../review/reviewWrite" ,{
				movie_code:movie_code,		
				id:id,
				contents:contents
			}, function(data) {
				data=data.trim();
				if(data=="1"){
					alert("등록되었습니다.");
				} else {
					alert("fail");
					alert ("data :" + data);
					alert ("id :" + id);
					alert ("movie_code :" + movie_code);
					alert ("contents :" + contents);
				}
				location.reload();
			});
		});

				/*================= List ajax ================= */
		$(".film_btn").click(function() {
			$.ajax({url:"../review/reviewList", success : function(result) {
				
				
				$(".review_list").html(result);
			}});
		});
		
		

		
		
		$.getJSON("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&sort=repRlsDate&1&releaseDte=20190626&listCount=40&ServiceKey=19TKUUT86TYFU6699SQ4", function(data) {
			var num=1;
			data.Data.forEach(function(d) {
				d.Result.forEach(function(r) {
					var n = r.posters.indexOf("jpg")+3;
					var url = r.posters.substring(0,n);
		
					var img = '<img src="'+url+'" onError=javascript:this.src="../images/img_alt.jpg" border=0 class="api_img1">';
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
					$('#writeCode'+num).val(movie_code);
					$('#code_hidden'+num).append('<input type="hidden" title="' + movie_code + '" name="movie_code" class="movie_code" >');
					
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
		
		
	});
	
	




</script>






<jsp:include page="../temp/footer.jsp"/>
</body>
</html>