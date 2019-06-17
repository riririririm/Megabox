<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<a id="kakao-login-btn"></a>
	<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('fe55bc72b92a4acbd1075cfcdd8a10fc');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				//로그인 성공시, API를 호출합니다
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {

						document.write(res.properties.nickname + " Welcome.");
					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringif(err));
			}
		});

		/* function createKakaotalkLogin() {
			$("#kakao-logged-group, kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var loginBtn = $("<a/>", {"calss":"kakao-login-btn", "text":"로그인"});
			loginBtn.click(function() {
				kakao.Auth.login({
					persistAccessToken : true,
					persistRefreshToken : true,
					success:function(authObj){
						getKakaotalkUserProfile();
						createKakaotalkLogout();
					},
					fail:function(err){
						console.log(err);
					}
				});
			});
			$('#kakao-logged-group').prepend(loginBtn)
			
		} */

		//]]>
	</script>

</body>
</html>