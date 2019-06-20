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
	margin-top:90px;
}
.container{
	min-height: 500px;
}

.answer{
	min-height:100px;
}
</style>
<c:import url="../temp/bootstrap.jsp"/> 
</head>
<body>
<c:import url = "../temp/header.jsp"/> 

<script type="text/javascript">
$("#commentsList").on("click", ".del", function() { //list.jsp의 버튼에 이벤트 위임
	var cnum = $(this).attr("id");
	var check = confirm("delete??");
	if(check){
		$.get("../comments/commentsDelete?cnum="+cnum,function(data){//data = respnseText의 값
			data = data.trim();
			if(data=="1"){
				alert("성공");
				location.reload();
			}else {
				alert("실패");
			}
		});	
	}
});

$("#commentsList").on("click",".update", function() {
	var id = $(this).attr("title");
	var con = $("#c"+id).html();
	$("#updateContents").val(con);
	$("#cnum").val(id);
});
</script>

	



<div class="container">



<div class="imgs">
<div class="top" style="height:40px; background:#e6e6e6; margin-bottom:10px">
<p style="font-size:15px;color:#330066; font-weight:bold; padding-top:10px">고객센터</p>
<div class="top2" style="height:3px; background:purple;"></div>
</div>

<a href="<%=application.getContextPath()%>/notice/noticeList"><img src="../images/notice.PNG" alt="notice"></a>
<a href="<%=application.getContextPath()%>/qna/qnaList"><img src="../images/qna.PNG" alt="qna"></a>
<img src="../images/dreamcenter.PNG" alt="dreamcenter" style="float:right">


<p style="font-size:20px;margin-top:10px; font-weight:bold;color:#000000;">문의/접수</p>
</div>
<div class="table">
<table class="table" >
   <tr>
		<td style="background:#e6e6e6; width:220px">제목</td>
		<td colspan="3">${dto.title}</td>   
   </tr>
   <tr>
   		<td style="background:#e6e6e6; width:220px">작성자</td>
   		<td>${dto.writer}</td>
   		<td style="background:#e6e6e6; width:220px">등록일</td>
   		<td>${dto.reg_date}</td>
   </tr>
   <tr>
   		<td colspan="4" height="250">${dto.contents}</td>
   </tr>
 	
 	<tr>
 		<a href="<%=application.getContextPath()%>/qna/qnaList"><input type="button" value="목록" style="float:left"></a>
  		<a href="<%=application.getContextPath()%>/qna/qnaDelete?num=${dto.num}"><input type="button" value="삭제" style="float:right;margin-left:10px" id="noticeDelete" >
 		<%--  <a href="<%=application.getContextPath()%>/notice/noticeUpdate?num=${dto.num}"><input type="button" value="수정" style="float:right"></a> --%>
  		<a href="<%=application.getContextPath()%>/qna/qnaUpdate?num=${dto.num}"><input type="button"value="수정" style="float:right"></a>
 		
 	</tr>
  </table>
 
 
 

</div>

<div class="answer">
			<!-- 댓글입력폼 -->
			<div class="row">
				<div class="form-group">
		      <label for="writer">Writer:</label>
		      <input type="text" class="form-control" id="writer" name="writer">
		    </div>
		    <div class="form-group">
			  <label for="contents">Contents:</label>
			  <textarea class="form-control" rows="10" id="contents" name="contents"></textarea>
			   <button class="btn btn-danger" id="btn">Write</button>
			</div>
			</div>
			<!-- 댓글리스트 -->
			<div class="row">
				<table class="table table-bordered" id="commentsList">
					
				</table>
				<button id="more">더 보기</button>
			</div>
</div>
</div>
<c:import url = "../temp/footer.jsp"/>
</body>
</html>