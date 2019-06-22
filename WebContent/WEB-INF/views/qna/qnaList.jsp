<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#noticeArea{
	margin:0 auto;
	width:500px;
}
.imgs{
	margin-top:100px;
	height:200px;
	
}

.table{
	margin-top:150px;
}
.container{
	min-height: 600px;
}
</style>
<c:import url="../temp/bootstrap.jsp"/> 
</head>
<body>
<c:import url = "../temp/header.jsp"/> 



	



<div class="container">



<div class="imgs">
<div class="top" style="height:40px; background:#e6e6e6; margin-bottom:10px">
<p style="font-size:15px;color:#330066; font-weight:bold; padding-top:10px">고객센터</p>
<div class="top2" style="height:3px; background:purple;"></div>
</div>

<a href="<%=application.getContextPath()%>/notice/noticeList"><img src="../images/notice.PNG" alt="notice"></a>
<a href="<%=application.getContextPath()%>/qna/qnaList"><img src="../images/qna1.PNG" alt="qna"></a>
<img src="../images/dreamcenter.PNG" alt="dreamcenter" style="float:right">


<p style="font-size:20px;  margin-top:10px; font-weight:bold;color:#000000;">문의/접수</p>
<p style="font-size:13px;">-메가박스에 문의하실 사항이 있다면 '문의/접수'를 통해 접수해주세요<br>
						-접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다</p>
</div>

<div class="table">
<a href="<%=application.getContextPath()%>/qna/qnaWrite"><input type="button" class="btn" value="문의/접수" style="float:left"></a>
<table class="table">
    
      <tr>
        <td>NO</td>
        <td>제목</td>
        <td>접수상태</td>
        <td>등록일</td>
      </tr>
      

      			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.num}</td>
					<td>
						<c:catch>
						<c:forEach begin="1" end="${dto.depth}" varStatus="i">
						--
						<c:if test="${i.last}">&gt;</c:if>
						</c:forEach>
						</c:catch>
						<a href="./qnaSelect?num=${dto.num}">${dto.title}</a>
					</td>
					<c:choose>
						<c:when test="${dto.state eq 0 }">
							<td>미답변</td>
						</c:when>
						<c:otherwise>
							<td>답변완료</td>
						</c:otherwise>
					</c:choose>
					<td>${dto.reg_date}</td>
					
				
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container">
		<ul class="pager">
			<c:if test="${pager.curBlock gt 1}">
				<li class="previous"><a href="./qnaList?curPage=${pager.startNum-1}">Previous</a></li>
			</c:if>
			
			<li>
				 <ul class="pagination">
				 	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i" step="1">
				 		<li><a href="./qnaList?curPage=${i}">${i}</a></li>
				 	</c:forEach>
 				 </ul>
			</li>
			
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<li class="next"><a href="./qnaList?curPage=${pager.lastNum+1}">Next</a></li>
			</c:if>
		</ul>


   
 

</div>
</div>


<!-- Modal -->
<c:import url = "../temp/footer.jsp"/>
</body>
</html>