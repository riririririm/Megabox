<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="./temp/bootstrap.jsp"/>

<style type="text/css">


  	.container {
		width: 100%;
		padding:0;
	}
	#contents_wrap {
		width:100%;
	
	}
	#myCarousel {
		display: block;
	}
	.carousel-inner {
		display: block;
		height:651px;
		position: absolute;
	}
	.carousel-inner img {
		width : 1600px;
		height: 651px;
		position: absolute;
	}
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
	height : 651px;
	}
	
	
	
	.carousel-control {
		width : 15%;
		display: block;
		left:0;	
		height: 651px;
		margin-top: 51px;
		
	}
	#myCarousel { 
		width: 100%;
		height: 651px;
		float: none;
		margin-top: 51px;
	}

	#section1 {
		width:100%;
		height: 701px;
		padding : 70px 0px 80px 0px;
	}
	#flip_wrapper {
		width : 984px;
		height: 565px;
		margin: 0 auto;
		white-space: nowrap;
    	word-wrap: break-word;
    	display: block;
    	
	}
	#flip_box { 
	 	width : 984px;
	 	height : 565px;
	 	}
	
	#flip_dl {
		height: 565px;
		padding : 0;
		margin: 0;
		list-style: none;
		position: relative;
	}
	
	#flip_btn1 {
		left : 340px;
		position: absolute;
		width: 160px;
		height: 50px;
		display: block;
	}
	#flip_btn2 {
		left : 500px;
		position: absolute;
		width: 160px;
		height: 50px;
		display: block;
	
	}
	#box_office {
		display: block;
		width: 100%;
		height: 100%;
		border : 1px solid gray;
		text-align: center;
		line-height: 3.2em;
		text-decoration: none;
		color : #503396;
	}
	
	#release_movie {
		display: block;
		width: 100%;
		height: 100%;
		border : 1px solid gray;
		text-align: center;
		line-height: 3.2em;
		text-decoration: none;
		color : #503396;
	}
	#tab1 {
		width: 984px;
		height: 485px;
		position: absolute;
		top :80px;
	}
	#tab2{
		width: 984px;
		height: 485px;
		position: absolute;
		top :80px;
		display: none;      /* ---------숨겨둠--------*/
	}
	.text-right {
		text-align: right;
		margin-right: 10px;
	}
	#movie_all1 {
		text-decoration: none;
	}
	#movie_all2 {
		text-decoration: none;
	}
	
	#movie_slide1 {
		width: 984px;
		height: 485px;
		position: relative;
		overflow: hidden;
	}
	#movie_slide2 {
		width: 984px;
		height: 485px;
		position: relative;
		overflow: hidden;
	}
	
	#movie_list1 { 	/* ul */
		list-style: none;
		width: 1968px;
		height:472px;
		margin-left: 0px;
		padding: 0;
		
	}
	#movie_list2 { 	/* ul */
		list-style: none;
		width: 1968px;
		height:472px;
		margin-left: 0px;
		padding: 0;
		
	}
	.box_movie {
		width: 232px;
		height: 458px;
		background: #fff;
		border: 1px solid gray;
		margin: 7px;
		float: left;
		display: block;
	}
	.release_movie {
		width: 232px;
		height: 458px;
		background: #fff;
		border: 1px solid gray;
		margin: 7px;
		float: left;
		display: block;
	}
	
	#section2 {
		width: 100%;
		height: 408px;
		padding: 0 0 80px;
	}
	
	#section2_wrap {
		width: 970px;
		height: 328px;
		margin: 0 auto;
	}
	
	#main_notice {
		width: 460px;
		height: 65px;
		float: left;	
		border-bottom: 1px solid gray;
	}
	#main_notice > h3{
		height: 65px;
		margin: 0;
	}
	#notice_list {
		width: 460px;
		height: 235px;
		padding: 0;
		margin : 0;
		line-height:1;
	}	
	#notice_list > ul {
		list-style: none;
		padding: 0;
	}
	.list_tab {
		padding:11px 0px;
	}
	.notice_detail {
		text-decoration: none;
	}
	
	#main_qna {
		width: 460px;
		height: 65px;
		float: left;	
		margin-left: 50px;
		border-bottom: 1px solid gray;
	}
	#main_qna > h3{
		height: 65px;
		margin: 0;
	}
	#main_banner {
		width: 970px;
		height: 232px;
		margin: 0 auto;
	}
	#plus {
		width: 20px;
		height: 20px;
		float: right;
	
	}
</style>

<script type="text/javascript">
	$(function() {
		$('#box_office').click(function() {
			$('#tab1').show();
			$('#tab2').hide();
			$("#box_office").css("background", "#d9d9d9");
			$('#release_movie').css("background", "white");
		});
		$('#release_movie').click(function() {
			$('#tab1').hide();
			$('#tab2').show();
			$("#box_office").css("background", "white");
			$('#release_movie').css("background", "#d9d9d9");
			
		});
		
		
	});




</script>
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
      						<img src="/Megabox/images/main1.jpg">
      					</div>
    					<div class="item">
     						<img src="/Megabox/images/main2.jpg">
    					</div>
    					<div class="item">
     						<img src="/Megabox/images/main3.jpg">
    					</div>
    					<div class="item">
     						<img src="/Megabox/images/main4.jpg">
    					</div>
    					<div class="item">
     						<img src="/Megabox/images/main5.jpg">
    					</div>
  					</div>   
			</div>  <!-- carousel end -->
			
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
  							<a href = "#" id="box_office">박스 오피스</a>
  						</dt>
  						<dd id="tab1">
  							<p class="text-right"><a href="${pageContext.request.contextPath}/movie/boxoffice" id="movie_all1">전체보기 </a></p>
  							<div id="movie_slide1">
  								<ul tabindex=0 id="movie_list1">
  									<li class="box_movie">
  										
  									</li>
  									<li class="box_movie">
  										
  									</li>
  									<li class="box_movie">
  										
  									</li>
  									<li class="box_movie">
  										
  									</li>
  								</ul>
  							
  							</div>
  						</dd>
  						<dt id="flip_btn2">
  							<a href="#" id="release_movie">최신 개봉작</a>
  						</dt>
  						<dd id="tab2">
  							<p class="text-right"><a href="${pageContext.request.contextPath}/movie/releaseMovie" id="movie_all2">전체보기 </a></p>
  							<div id="movie_slide2">
  								<ul tabindex=0 id="movie_list2">
  									<li class="release_movie">
  										
  									</li>
  									<li class="release_movie">
  										
  									</li>
  									<li class="release_movie">
  										
  									</li>
  									<li class="release_movie">
  										
  									</li>
  								</ul>
  							
  							</div>
  						  					
  					</dl>
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


	
<!-- 풋터 -->
<jsp:include page="./temp/footer.jsp"/>
</body>
</html>