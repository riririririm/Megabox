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
.container{
	min-height: 1300px;
}
.table{
	border: 1px solid #9999;
	margin-top: 30px;
}
</style>
<c:import url="../temp/bootstrap.jsp"/> 
<script type="text/javascript">
	
$(function() {
	getList();
	
	var curPage=1;
	
	$("#more").click(function() {
		curPage++;
		getList(curPage);
	});
	
	$("#updateBtn").click(function() {
		//alert($('#updateContents').val());
		//alert($("#cnum").val());
		var contents = $("#updateContents").val();
		var cnum =$("#cnum").val();
		$.post("../comments/commentsUpdate",{
			contents:contents,
			cnum:cnum
		}, function(data) {
			data = data.trim();
			if(data=="1"){
				alert("success");
				$("#c"+cnum).html(contents);
				//location.reload(); //or getList(1);
			}else {
				alert("Fail");
			}
		});
		
		
	});//end of updateBtn click
	
	$("#btn").click(function() {
		var writer = $("#writer").val();
		var contents = $("#contents").val();
		var num = '${dto.num}';
		$.post("../comments/commentsWrite",{
			writer:writer,
			contents:contents,
			num:num
		}, function(data) {
			data = data.trim();
			if(data=="1"){
				alert("success");
				location.reload();
			}else {
				alert("Fail");
			}
		});
		
		
	});

	
	//
	function getList(count) {
		$.get("../comments/commentsList?num=${dto.num}&curPage="+count, function(data) {
			data = data.trim();
			if(count==1){
				$("#commentsList").html(data);
			}else{
				$("#commentsList").append(data);
			}
		});
		
		
	}

		
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

	
	$("noticeDelete").click(function(){
		var result = confirm("게시글을 삭제하시겠습니까?");
		if(result){
			location.herf='/notice/noticeDelete'
		}
	});
});
</script>
</head>
<body>
<c:import url = "../temp/header.jsp"/> 




<div class="container">



<div class="imgs">

<a href="<%=application.getContextPath()%>/notice/noticeList"><img src="../images/notice.PNG" alt="notice"></a>
<a href="<%=application.getContextPath()%>/qna/qnaList"><img src="../images/qna.PNG" alt="qna"></a>
<img src="../images/dreamcenter.PNG" alt="dreamcenter" style="float:right">

<p style="font-size:20px;padding-top:30px; font-weight:bold;color:#000000;">공지사항, 메가박스의 최신소식을 알려드립니다</p>
</div>



<table class="table" >
   <tr>
		<td style="background:#e6e6e6; width:220px">제목</td>
		<td colspan="3">${dto.title}</td>   
   </tr>
   <tr>
   		<td style="background:#e6e6e6; width:220px">영화관</td>
   		<td>전체영화관</td>
   		<td style="background:#e6e6e6; width:220px">등록일</td>
   		<td>${dto.reg_date}</td>
   </tr>
   <tr>
   		<td colspan="4" height="600">${dto.contents}</td>
   </tr>
 	
  </table>

  <a href="<%=application.getContextPath()%>/notice/noticeList"><input type="button" class="btn" value="목록" style="float:left"></a>
  <a href="<%=application.getContextPath()%>/notice/noticeDelete?num=${dto.num}"><input type="button" class="btn" value="삭제" style="float:right;margin-left:10px" id="noticeDelete" ></a>
<!--   <input type="button" value="삭제" style="float:right;margin-left:10px" id="noticeDelete" > -->
  <a href="<%=application.getContextPath()%>/notice/noticeUpdate?num=${dto.num}"><input type="button" class="btn" value="수정" style="float:right"></a>
  
</div>
<c:import url = "../temp/footer.jsp"/>
</body>
</html>