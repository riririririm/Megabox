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
	
</style>
<script type="text/javascript">
	$(function() {
		$(".select").click(function(){
			
			
		}); 
		
	});





</script>


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


<script type="text/javascript">
	$(function() {
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