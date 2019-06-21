<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

			<c:forEach items="${reviewList }" var="dto" varStatus="status" >
						
							<div class="review_row">
					
								<div class="review_cell">
									<div class="cell_content">
										<div class="cell_member_id">
										<input type="hidden" id="${dto.num }" value ="${dto.num }">
										<input type="hidden" id="${dto.movie_code }">
											<strong>${dto.id }</strong>
										</div>
										<div class="cell_data">
											<span>${dto.reg_date }</span>
											<div class="cell_star">
											
											</div>
										</div>
										<p>
										<br>
											<span>${dto.contents }</span>
										</p>
									</div>
								</div> 		<!------------ review_cell end ----------->	


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