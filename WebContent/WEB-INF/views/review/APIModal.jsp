<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
			
						<!------------------------ 상세정보 Modal ------------------------------->
			
				<button type="button" class="close" class= "modal_close" data-dismiss="modal">&times;</button>
				<div class="modal_detail">
					<div class="popupbox1">
						<div class="left_wrap" id="modal_img">
							<!---------------- 영화 포스터 ------------------->
						</div>
						<div class="right_wrap">
							<div class="modal_title_wrap">
								<h2>
									<span id="modal_title"> </span>


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
									<input type="hidden" id="modal_code">
								<ul class="modal_info_wrap">
									<li id="modal_release"><strong>개봉일 : </strong></li>
									<li id="director"><strong>감독 : </strong></li>
									<li id="actors"><strong>출연진 : </strong></li>
									<li id="movie_type"><strong>장르 : </strong></li>
								</ul>
							</div>          <!------------- modal_text_wrap end -------------->
							<div class="modal_rating"> 
							</div>		
						</div> 				<!--------------- right_wrap end --------------->
					</div> 						<!------------- popupbox1 end --------------->
					<div class="popupbox2">
						<h3>줄거리</h3>
						<p id="plot"></p>
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
									
									<div class="review_area" id="code_hidden" title="movie_code">
									
									</div>
										<textarea class="write_textarea" id="contents"> </textarea>					
										
									<div class="review_btn">
										<button type="button" id="writeCode" class="writeBtn btn btn-primary">등록</button>
									
									</div>
								</div>
						</div>
					</div>			<!------------ modal_review_wrap end----------->
					<div class="review_list_wrap" >
						<ul>
							<li><a>최신순</a></li>
							<li><a>추천순</a></li>
							<li><a>평점순</a></li>
						</ul>
						
						<!--------------------- 리뷰 리스트   --------------------->
						
						<div class="review_list" id="listCode">
						<c:forEach items="${reviewList }" var="rdto">
				
							<div class="review_row">
								<div class="review_cell">
									<div class="cell_content">
										<input type="hidden" id="${rdto.num }" value ="${rdto.num }">
										<form>
										<input type="hidden" id="${rdto.movie_code }" name="movie_code" value="${rdto.movie_code}">
										</form>
										<div class="cell_member_id">
											<strong>${rdto.id }</strong>
											
										</div>
										<div class="cell_data">
											<span>${rdto.reg_date }</span>
											<div class="cell_star">
											
											</div>
										</div>
										<p>
											<span>${rdto.contents }</span>
										</p>
									</div>
								</div> 		<!------------ review_cell end ----------->	
								<div class="review_cell">
									<div class="cell_content">
										<div class="cell_member_id">
											<strong>${rdto.id }</strong>
											
										</div>
										<div class="cell_data">
											<span>${rdto.reg_date }</span>
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
						
						

						
						
						</div>		<!-------------- reviewList end ------------->
						
					
					</div>

					
				</div>
				</div>
			</div>
		






</body>
