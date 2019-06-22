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
	margin-top:130px;
	
}
.agreement{
	margin-top:120px;

}
.h{
	font-size:15px;
	color:black;
}
.agreeradio{
	float:right;
}
.text{
	height:165px;
	padding:15px;
	border:1px solid #e8e7e7;
	overflow:hidden;
	overflow-y:scroll;
}
#registration{
	background-color:#330066;
	color:white;
	margin-left:560px;
}

textarea{
	width:900px;
	height:200px;
	resize:none;
}

#title{
	width:900px;
}





</style>
<script type="text/javascript">

</script>
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


 <p style="font-size:20px;margin-top:10px; font-weight:bold;color:#000000;">문의/접수</p>
<p style="font-size:13px;">-메가박스에서 문의하실 사항이 있다면 '문의/접수'를 통해 접수해주세요<br>
						-접수하신 글은 비밀글로 등록되어 작성자와 관리자만 확인 가능합니다</p>

</div>


		

	


<div class="table">
<form method ="post" action="./qnaUpdate">
<table class="table">
   <tr>
		<td style="background:#e6e6e6; width:220px">이름</td>
		<td><input type="text" id="writer" name="writer" class="contents" value="${dto.writer}"></td>   
   </tr>
   <tr>
   		<td style="background:#e6e6e6; width:220px">제목</td>
   		<td><input type="text" id="title" name="title" class="contents" value="${dto.title}"></td>
   	</tr>
   	<tr>
   		<td style="background:#e6e6e6; width:220px">내용</td>
   		<td><textarea id="contents" name="contents" >${dto.contents}</textarea></td>
   	</tr>
   <tr>
   		<td style="background:#e6e6e6; width:220px" >비밀번호</td>
   		<td><input type="text" id="pw" name="pw" class="contents" value="${dto.post_pw}"><td>
   </tr>
 	<input type="hidden" id="num" name="num" class="num" value="${dto.num}">
  </table>
    <input type="submit"  class="btn" value="등록"  id="registration" >
 </form>

</div>
</div>
<c:import url = "../temp/footer.jsp"/>
</body>
</html>