<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$.getJSON("http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp?collection=kmdb_new&sort=repRlsDate&1&releaseDte=20190626&ServiceKey=19TKUUT86TYFU6699SQ4", function(data) {
	var num=1;
	data.Data.forEach(function(d) {
		d.Result.forEach(function(r) {
			var n = r.posters.indexOf("jpg")+3;
			var url = r.posters.substring(0,n);

			var img = '<img src="'+url+'" class="api_img1">';
			var title = r.title;
			var modal_img = '<img src="'+url+'" class="modal_img1">';
			var modal_title = r.title;
			var modal_release = r.repRlsDate;
			var movie_type = r.genre;
			var plot = r.plot;
			var movie_code = r.movieSeq;

</script>

<%
request.setCharacterEncoding("utf-8");


%>








</body>
</html>