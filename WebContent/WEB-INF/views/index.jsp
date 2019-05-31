<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="./temp/bootstrap.jsp"/>

<style type="text/css">
  	.container {
		width: 100%;
		height: 1235px;
		padding:0;
	}
	#contents_wrap {
		width:100%;
	
	}
	.carousel-inner {
		display: block;
		height:601px;
		position: absolute;
	}
	.carousel-inner img {
		width : 1600px;
		height: 601px;
		position: absolute;
	}
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
	height : 601px;
	}
	
	
	
	.carousel-control {
		width : 15%;
		display: block;
		left:0;	
		height: 601px;
		margin-top: 51px;
		
	}
	#myCarousel { 
		width: 100%;
		height: 601px;
		float: none;
		margin-top: 51px;
	}
	#section1 {
		width:100%;
		height: 701px;
		padding : 70px 0px 80px 0px;
	}
	#section_movie {
		width : 40%;
		hieght : 565px;
		
	
		}
	
	
	
	
	
	
	#promotion_left {
		width:550px;
		height: 275px;
		float: left;	
	}
	#promotion_box {
		width: 50%;
		padding-bottom: 50%;
		height: 0;
		overflow: hidden;
		float: left;
	}
	#pm_caption_left{
		width: 50%;
		padding-bottom: 50%;
		overflow: hidden;
		float: right;
		background-color: black;
		height: 100%;
	}
	#pm_caption_right{
		width: 50%;
		padding-bottom: 50%;
		height: 100%;
		overflow: hidden;
		float: right;
		background-color: white;
	}
	#promotion_right{
		width:550px;
		height:275px;
		float: right;
	
	}
	
	.promotion_img{
    	margin-left: -133px;
    	height: 275px;
	}
	
	.banner{
		width:100%;
		height: 410px;
	}
	#banner_left {
		width: 50%;
		float: left;
	}
	#banner_right {
		width: 50%;
		float: right;
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
      						<img src="./images/main1.jpg">
      					</div>
    					<div class="item">
     						<img src="./images/main2.jpg">
    					</div>
    					<div class="item">
     						<img src="./images/main3.jpg">
    					</div>
    					<div class="item">
     						<img src="./images/main4.jpg">
    					</div>
    					<div class="item">
     						<img src="./images/main5.jpg">
    					</div>
  					</div>
			</div>
			
		    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    	<div id="section1">
    		<dl id="section_movie">
    			<dt class="section_btn">
    				<dd id="section_contents">
    				<div id="list_wrap">
    					<ul id="section_list">
    						<li class="movie_list">
  								<div class="poster">
  								</div>  			
  								<div class="front_info">
  									<div class="movie_info">
  										
  									</div>
  								</div>			
    					
    					</ul>
    				
    				</div>
    			
    		
    		</dl>
    	
    	
    	
    	</div>
    </div>
</div>

	
<!-- 풋터 -->
<jsp:include page="./temp/footer.jsp"/>
</body>
</html>