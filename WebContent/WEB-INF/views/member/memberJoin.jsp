<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../temp/bootstrap.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container {
		width: 100%;
		padding : 3% 0 0 0 ;
		position : relative;
		overflow : hidden;
		clear:both;
	}
	
	.sub_navi {
	
    background-color: #f2f2f2;
    border-top: 1px solid #e1e1e1;
    border-bottom: 3px solid #503396;
	}
	
	.sub_navi .sub_navi_wrap {
    position: relative;
    width: 970px;
    margin: 0 auto;
	}
	.clearfix li{
		list-style: none;
	}

	
	#container {
    position: relative;
    margin-top: 38px;
    margin-bottom: 85px;
	}
	
	.width-fixed {
    width: 970px;
    max-width: 970px;
    min-width: 970px;
    margin-left: auto;
    margin-right: auto;
	}
	
	.user_wrap h2{
    position: relative;
    font-size: 20px;
    color: #666;
    margin: 0 0 58px 0;
	}
	.mb35 {
    margin-bottom: 35px !important;
	}
	
	.user_wrap h2 span {
    font-size: 13px;
    font-weight: normal;
	}
	.ml10 {
    margin-left: 10px !important;
	}
	.user_wrap h2 span.step {
    position: absolute;
    top: 9px;
    right: 0;
    display: block;
    width: 154px;
    height: 8px;
	}
	.form-style h4 {
    font-size: 18px;
    padding-left: 1rem;
    letter-spacing: -0.05em;
    margin: 40px 0 10px;
	}
	.form-style .form-table {
    border-top: 2px solid #d2d2d2;
    border-bottom: 2px solid #d2d2d2;
    width: 100%;
	}
	
	.blind2 {
    width: 0;
    height: 0;
    overflow: hidden;
    font-size: 0;
	}
	
	.form-style .form-table th {
    background-color: #f8f8f8;
    vertical-align: top;
    font-size: 16px;
    font-weight: normal;
    border-top: 1px solid #dcdcdc ;
    padding: 5px;
	}
	.form-style .form-table td {
    padding-left: 30px;
    border-top: 1px solid #dcdcdc;
	}
	.form-style .form-table th label {
    font-size: 16px;
    font-weight: normal;
	}
	.form-style .form-table td span {
    display: inline-block;
	}
	.form-style .form-table td label{
    color: #666;
    font-size: 16px;
    margin-bottom: 0;
    font-weight: normal;
    vertical-align: middle;
	}
	.ml10 {
    margin-left: 10px !important;
	}
	.form-style h4 {
    font-size: 18px;
    padding-left: 1rem;
    letter-spacing: -0.05em;
    margin: 40px 0 10px;
	}
	colgroup {
    display: table-column-group;
	}
	.personal_information_wrap .form-table td {
    font-size: 15px;
    text-align : center;
    border-left: 1px solid #dcdcdc;
    padding: 15px 20px !important;
	}
	.personal_information_wrap .form-table td:first-child {
    	border-left: none;
	}
	.personal_information_wrap .form-table td:first-child, .personal_information_wrap .form-table td:last-child {
    text-align: left;
	}
	.personal_information_wrap .form-table th {
    text-align: center;
    padding: 5px !important;
}
	.h2_mypage.marktingAgree {
    margin: 20px 0 0 5px;
	}
	input {
    width: 200px;
    border: 1px solid #d9d9d9;
    line-height: 26px;
    height: 26px;
    background-color: #f8f8f8;
    font-size: 12px;
    color: #333;
    text-indent: 14px;
    vertical-align: middle;
	}
	.text-sub {
    color: #666;
    font-size: 16px;
	}	
	colgroup {
    display: table-column-group;
	}
	thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
	}
	tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
	}
	.ml20 {
    margin-left: 20px !important;
	}
	.personal_information_wrap .agree_area .txt {
    width: 100%;
    font-size: 12px;
    font-weight: normal;
    padding-bottom: 15px;
	}
	.personal_information_wrap .agree_area {
    padding: 15px 0 0 15px;
	}
	h2>.sub_title {
    display: block;
    overflow: hidden;
    font-size: 20px;
    width: 100%;
	}

	.phone_span{
		font-size: 16px;
		font-weight: 800;
	}
	.join_form {
		margin-top: 20px;
	}
	.join_form p{
		font-size: 20px;
		
	}
</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../temp/header.jsp"/>
<div class="container">
	<div class="sub_navi">
		<div class="sub_navi_wrap">
			<ul class="clearfix join_form" style="padding-left: 22px;">
				<li>
					<p>
						회원가입
					</p>
				</li>
			</ul>
		</div>
	</div>
	<div id="container" class="width-fixed">
		<div class="user_wrap" id="userWrap" style="padding-left:20px;"> 
			<h2 class="mb35">
			가입정보입력
			<span class="ml10">
				<span class="c_purple text-sub">(*표시 항목 필수입력)</span>
			</span>
			</h2>
			<!-- from-style -->
			<div id="userJoinContainer" class="form-style">
				<h4>기본정보 (필수입력)</h4>
			<form id="frm" method="post">
			<table class="form-table" summary="정보입력">
				<caption class="blind2">
				회원정보입력 표:아이디, 비밀번호, 비밀번호 확인,  이메일, 전화번호, 등 회원가입에 필요한 정보를 입력할 수 있습니다.
				</caption>
				<colgroup>
					<col width = "181">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row" id="th_joininput_info_id">
							<label for="inputtext1">*아이디</label>
						</th>
						<td headers="th_joininput_info_id">
							<input type="text" class="blank_ck" id="id" name="id" title="아이디" maxlength="12"> 
							<button type="button" id="dupl">중복확인</button>
							<input type="text" id="dupl_check" value="0" hidden="hidden">
							<span class="text-sub ml10">영문이나 숫자 혹은 그 조합 8~12자리</span>
							<!-- modal창 -->
						</td>
					</tr>
					<tr>
						<th scope="row" id="th_joininput_info_password">
							<label for="inputtext2">*비밀번호</label>
						</th>
						<td headers="th_joininput_info_password">
							<input type="password" class="blank_ck" id="pw1" name="pw1" title="비밀번호" maxlength="20">
							<span class="text-sub" style="margin-left:94px;">영문, 숫자, 특수문자 조합 10자리 이상</span>
						</td>
					</tr>
					<tr>
						<th scope="row" id="th_joininput_info_passwordconfirm">
						<label for="inputtext3">*비밀번호 확인</label>
						</th>
						<td headers="th_joininput_info_passwordconfirm"> 
						<input type="password" class="blank_ck" id="pw2" name="pw2" title="비밀번호">
						</td>
					</tr>
					<tr>
						<th scope="row" id="th_joininput_info_name">
						<label for="inputtext4">*이름</label>
						</th>
						<td headers="th_joininput_info_name">
						<input type="text" class="blank_ck" id="member_name" name="name" title="이름" maxlength="10">
						</td>
					</tr>
					<tr>
						<th scope="row" id="th_joininput_info_mobile">
						<label for="inputtext4">*휴대폰</label>
						</th>
						<td headers="th_joininput_info_mobile">
						<input type="text" title="휴대폰" name="phone1" class="w67 blank_ck" id="phone1" maxlength="3">
						<span class="phone_span">-</span>
						<input type="text" title="휴대폰" name="phone2" class="w67 blank_ck" id="phone2" maxlength="4">
						<span class="phone_span">-</span>
						<input type="text" title="휴대폰" name="phone3" class="w67 blank_ck" id="phone3" maxlength="4">
						</td>
					</tr>
					<tr>
					<th scope="row" id="th_joininput_info_email">
					<label for="inputtext9">*이메일</label>
					</th>
					<td headers="th_joininput_info_email">
					<input type="email" id="email"  name="email" maxlength="30" class="blank_ck" title="이메일">
					</td>
				</tr>
				</tbody>
			</table>
			</form>
			</div>
			<!-- from-style -->
		
		<div id="userJoinContainer" class="form-style">
			<h4>마케팅 활용을 위한 개인정보 수집 이용 안내</h4>
			<div class="personal_information_wrap">
				<div class="form-style">
					<table class="form-table">
						<caption class="blind2">
						개인정보 수집 및 마케팅 활용을 위한 개인정보 수집 목적, 수집 항목, 보유 및 이용 기간, 동유여부
						</caption>
						<colgroup>
							<col width="30%">
							<col width="25%">
							<col width="30%">
							<col width="">
						</colgroup>
						<thead>
						<tr>
							<th scope="col" id="th_privacy_info_purpose"> 수집 목적</th>
							<th scope="col" id="th_privacy_info_item">수집 항목</th>
							<th scope="col" id="th_privacy_info_term">보유 및 이용 기간</th>
						</tr>
						</thead>
						<tbody>
							<tr>
							<td headers="th_privacy_info_purpose" class="pl20">
										고객 맞춤형 상품 및 서비스 추천.<br>
										당사 신규 상품/서비스 안내 및 권유.<br>
										사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유
							</td>
							<td headers="th_privacy_info_item">
										이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보 수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그
							</td>
							<td headers="th_privacy_info_term">
										회원 탈퇴 시 혹은 이용 목적 달성 시까지
							</td>
							</tr>
						</tbody>
					</table>
					
				</div>
				</div>
			</div>
		</div>
	</div>
	<div class="btn_wrap text-center mt50">
		<button type="button" class="btn">취소</button>
		<button type="button" class="btn join_ok" ><span class="blind">확인</span></button>
	</div>
</div> 
<button id="btn_modal" data-toggle="modal" data-target="#myModal" hidden="hidden"></button>
<!-- modal form -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-diaglod">
		<!-- Modal Content -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">알림</h4>
			</div><!-- modal-header -->
			<div class="modal-body">
				<p class="m_text"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- modal-content -->
	</div>
</div>
<!-- 풋터 -->
<jsp:include page="../temp/footer.jsp"/>
<script type="text/javascript">
	$('#dupl').click(function() {
			var len=$('#id').val().length;
			if(0<len && len<8){
					$('#btn_modal').trigger("click");//강제클릭발생
					$('.m_text').html("아이디는 숫자, 영문포함 8자리 이상만 가능합니다.");
			}else if(len==0){
				$('#btn_modal').trigger('click');
				$('.m_text').html("아이디를 입력해주세요.");
			}else if(len>12){
				$('#btn_modal').trigger('click');
				$('.m_text').html("아이디는 숫자, 영문포함 12자리 이하만 가능합니다.");	
			}else{
				var id = $('#id').val();
				$.get("./memberDupl?id="+id, function(data) { //포워딩
						var data = data.trim();
						if(data=='1'){
							$('#btn_modal').trigger('click');
							$('.m_text').html("사용가능한 ID입니다.");
							$('#dupl_check').val(1);
						}else{
							$('#btn_modal').trigger('click');
							$('.m_text').html("해당 ID는 이미 사용중입니다.");
						}
				});
			}
	});
	
	$('#id').change(function() {
		$('#dupl_check').val(0);
	});
	
	
	$('.join_ok').click(function() {
		var pattern1 = /[0-9]/; 
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*><]/;
		var pw1 = $('#pw1').val();
		var pw2 = $('#pw2').val();
		var len = pw1.length;
		var blank = true;
		$('.blank_ck').each(function() {
			if($(this).val()==""){
				var title = $(this).attr('title');
				$('#btn_modal').trigger('click');
				$('.m_text').html(title+"은(는) 필수 입력 사항입니다.");
				blank = false;
				return false;
			}
			
		});
		var dupl_check = $('#dupl_check').val();
		if(blank){
			if(pw1 != pw2){
				$('#btn_modal').trigger('click');
				$('.m_text').html("비밀번호가 같지 않습니다.");
				$('#member_pw').val("");
				blank = false;
			}else if(len<10||!pattern1.test(pw1)||!pattern2.test(pw1)||!pattern3.test(pw1)){
				$('#btn_modal').trigger('click');
				$('.m_text').html("비밀번호는 영문, 숫자, 특수문자 조합 10자 이상");
				$('#member_pw').val("");
				blank = false;
			}else if(dupl_check == '0'){
				$('#btn_modal').trigger('click');
				$('.m_text').html("아이디 중복을 확인해주세요");
				blank = false;
			}else{
				var email = $('#email').val();
				var n = email.indexOf("@");
				var dot = email.indexOf(".");
				if(n==-1 || dot ==-1){
					$('#btn_modal').trigger('click');
					$('.m_text').html("이메일형식으로 입력해주세요.");
					blank = false;
				}else if(n!=-1 && dot!=-1){
					blank = true;
				}
			}
		}
		if(blank){
		$('#frm').submit();		
		}
		
	});
	

</script>
</body>
</html>