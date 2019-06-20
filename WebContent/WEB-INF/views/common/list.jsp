<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${commentsList }" var="dto">

	<!-- Left-aligned media object -->
	<div class="media">
		<div class="media-left">
			<img src="../images/admin.png" class="media-object" style="width: 60px">
		</div>
		<div class="media-body">
			<h4 class="media-heading">${dto.writer }</h4>
			<p id="c${dto.cnum }">${dto.contents }</p>
			<p>${dto.reg_date }</p>
			<c:if test="${member.id eq dto.writer }">
			
				<button data-toggle="modal" data-target="#myModal" class="update"
					title="${dto.cnum }">Update</button>
				<button class="del" id="${dto.cnum }">Delete</button>
			
		</c:if>
		</div>
	</div>
	<hr>
</c:forEach>


