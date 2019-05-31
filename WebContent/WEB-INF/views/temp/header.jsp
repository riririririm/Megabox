<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Bootstrap Theme The Band</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <style>
  body {
    font-family: 'NanumGothic','나눔고딕','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;
    color: #777;
  }
  h3, h4 {
    margin: 10px 0 30px 0;
    letter-spacing: 10px;      
    font-size: 20px;
    color: #111;
  }
 
  
  #nav_con{
  	width:55%;
  	margin: 0 auto;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  .container-fluid{
  	border: 1px solid #cccccc;
  }
  .carousel-inner img {
   
    width: 100%; /* Set width to 100% */
    margin: auto;
  }
  .carousel-caption h3 {
    color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }

  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }

  .navbar {
    font-family: 'NanumGothic','나눔고딕','맑은 고딕','Malgun Gothic','돋움',dotum,'Apple SD Gothic Neo',sans-serif;
    font-weight:bold;
    margin-bottom: 0;
    background-color: white;
    border: 0;
    font-size: 15px !important;
    color:black;
    
  }
  .nav>li>a { 
    width:110px;
    text-align:center;
 	   
  }
  .navbar-nav li a:hover {
    color: #555 !important;
    
  } 
   .navbar-nav li a {
    color: #555 !important;
     border-left: 1px solid #cccccc;
  } 
   .navbar-nav li:last-child {
    color: #555 !important;
     border-right: 1px solid #cccccc;
  }
   .navbar-nav li.active a {
    color: #555 !important;
    background-color: white !important;
   
  } 
   .navbar-default .navbar-toggle {
    border-color: transparent;
  } 
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  
  .form-control {
    border-radius: 0;
  }
  textarea {
    resize: none;
  }
  
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid" id="nav_container">
			<div class="conainer">
			<div class="row"  id ="nav_con">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#myPage">
					<img src="./images/header_nav_logo.png"></a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
					<!-- href #부분에 각자 보여줄 페이지 링크 넣어주세요 -->
						<li><a href="#myPage">영화</a></li>
						<li><a href="#band">상영시간표</a></li>
						<li><a href="#tour">고객센터</a></li>
						<li><a href="#contact">커뮤니티</a></li>
						<li><a href="#more">로그인</a></li>
					</ul>
				</div>
			</div>
				
			</div>

		</div>
</nav>






</body>
</html>
