<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<a id="kakao-login-btn"></a>
	<a id="kakao-logout-btn" onclick="Logout()">로그아웃</a>
	<script type="text/javascript">
	Kakao.init('fe55bc72b92a4acbd1075cfcdd8a10fc');
	
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		size : 'small',
		success : function(authObj) {
			Kakao.API.request({
				url:'/v1/user/me',
				success : function(res) {
					var nickname = res.properties.nickname;
					alert(nickname);
					$.get("./index.do?nickname="+nickname, function() {
						
					});
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			//alert(JSON.stringify(authObj));
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	
	function Logout() {
		Kakao.Auth.logout(function() {
			setTimeout(function() {
				location.href="./index.do"
			}, 1000);
		});
	}
</script>
</body>
</html>