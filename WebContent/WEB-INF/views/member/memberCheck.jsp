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
		height: 140%;
		padding-top: 4%;
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
	
	.clearfix{
	list-style: none;
	}
	
	#member_container {
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
	}
	
	.user_wrap h2 span {
    font-size: 13px;
    font-weight: normal;
	}
	
	.ml10 {
    margin-left: 10px !important;
	}
	.user_wrap h2 span.step.step1 {
    background-position: 0 0;
	}
	.user_wrap h2 span.step {
    position: absolute;
    top: 9px;
    right: 0;
    display: block;
    width: 154px;
    height: 8px;
	}
	
	.user_wrap .term_text {
    overflow: hidden;
    overflow-y: scroll;
    height: 157px;
    padding: 15px;
    border: 1px solid #e8e7e7;
	}
	.user_wrap .term_text * {
    font-weight: normal;
    font-size: 12px;
    line-height: 21px;
    color: #666;
}
	dl{
		padding: 0;
		margin: 0;
		list-style: none;
	}
	
	.user_wrap .term_text dt {
    margin-top: 20px;
    margin-bottom: 20px;
	}
	
	.user_wrap .term_text dd>ol {
    padding-left: 25px;
	}
	.user_wrap .term_text ol, .user_wrap .term_text ol>li {
    list-style-type: decimal;
	}
	.blind2 {
    width: 0;
    height: 0;
    overflow: hidden;
	}
	thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
	}
	.privacyTable_01 th, .privacyTable_01 td {
    border: 1px solid #848484;
	}
	.privacyTable_01 th {
    text-align: center;
	}
	
	.privacyTable_01 th, .privacyTable_01 td {
    border: 1px solid #848484;
	}
	
	.user_wrap h3 {
    height: 26px;
    padding: 3px 0;
    margin: 56px 0 8px 0;
    font-size: 14px;
    color: #666;
    letter-spacing: 1px;
	}
	
	.user_wrap .term_check label {
    font-size: 13px;
    color: #333;
    font-weight: normal;
	}
	
	.user_wrap .btn_wrap {
    overflow: hidden;
    margin: 50px auto 0;
	}
	.pl15 {
    padding-left: 15px !important;
	}
	.user_wrap .term_check.bottom {
    margin-top: 60px;
    padding-top: 14px;
    border-top: 1px solid #e8e7e7;
	}
	

</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../temp/header.jsp"/>
<div class="container">
	<div class="sub_navi">
		<div class="sub_navi_wrap">
			<ul class="clearfix">
				<li> <a title="회원약관동의">회원가입</a>
			</ul>
		</div>
	</div>
	<div id="member_main" class="member_main-content">
		<!-- container -->
		<div id="member_container" class="width-fixed">
			<div class="user_wrap">
				<h2>약관동의<span class="ml10">서비스 이용약관 및 정보이용 안내에 대한 동의를 해주세요</span>
				<span class="step step1"></span>
				</h2>
				<!-- 이용약관 -->
				<h3>이용약관</h3>
				<div class="term_text" tabindex="0">
					<dl>
						<dt id="n1"> 제1조. 목적</dt>
						<dd>이 약관은 메가박스중앙(주)(이하 '회사'라 합니다)가 제공하는 온라인, 오프라인 서비스(이하 "서비스"라 합니다) 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</dd>
						<dt id="n2">제2조. 약관의 효력 및 변경 </dt>
						<dd>
							<ol>
								<li>이 약관은 서비스를 통하여 이를 공지함으로써 효력이 발생됩니다.</li>
								<li>회사는 사정상 중요한 사유가 발생될 경우 사전 고지 없이 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 서비스를 통하여 공지합니다.</li>
								<li>회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, 변경된 약관의 효력 발생일 이후 해지 요청을 하지 않을 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.</li>
							</ol>
						</dd>
						<dt id="n3">제3조. 약관 외 준칙</dt>
						<dd>본 약관에 명시되지 아니한 사항에 대해서는 전기통신기본법, 전기통신사업법, 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다.</dd>
						<dt id="n4">제4조. 용어의 정의 </dt>
						<dd>이 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.
							<ol>
							<li> "회원" : 이 약관을 인지하고, 회사에 개인정보를 제공하여 회원으로서 등록하여 이용자 아이디(ID)를 부여 받은 자로서, 회사의 정보를 지속적으로 제공 받으며, 회원혜택을 받는 분을 말합니다.</li>
							<li>"아이디" : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 영문이나 숫자 혹은 그 조합을 말합니다(이하"ID"라 합니다). </li>
							<li>"비밀번호" : 회원이 부여 받은 ID와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.</li>
							<li>"서비스" : 회사가 회원을 위하여 유료 또는 무료로 제공하는 행위 또는 그 행위 대상인 유,무형의 물건 자체를 의미합니다.</li>
							<li>"이용중지" : 회사가 약관에 의거하여 회원의 서비스 이용을 제한하는 것을 말합니다.</li>
							<li> "해지" : 회사 또는 회원이 서비스 사용 후 이용계약을 해약하는 것을 말합니다.</li>
							</ol>
						</dd>
					</dl>
				</div><!-- 첫번째 이용약관 -->
				<div class="term_check pl15">
				<span><input type="checkbox" class="ckbox" title="ck1111"></span>
				<label for="term1" >위의 ‘이용약관’을 읽고 동의 합니다. (필수 동의)</label>
				<p class="fz13 c_purple">※ 이용약관에 대한 동의를 거부할 수 있으며, 미 동의 시 회원가입을 하실 수 없습니다.</p> 
				</div>
				<!-- 이용약관 체크박스 -->
				
				<!-- 개인정보수집 및 이용안내 -->
				<h3>개인정보수집 및 이용안내</h3>
				<div class="term_text" tabindex="0">
					<dl>
						<dd>
							메가박스중앙(주)(이하 "회사")는 고객에게 다양하고 편리한 서비스를 제공하기 위하여 적법한 수단을 통하여 
							아래와 같은 개인정보를 수집하고 있습니다. "회사"는 최초 회원가입 시 개인정보의 수집항목 및 이용목적, 
							개인정보의 수집방법, 개인정보의 이용 및 보관기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 
							<br><br>
							1. 개인정보 수집 항목
							<br>
							(1)회원 가입 시 수집되는 정보
							
							<table cellpadding="2" cellspacing="0" class="privacyTable_01">
								<caption class="blind2">회원 가입 시 수집되는 정보</caption>
								<colgroup>
									<col width="100px">
									<col width = "*">
								</colgroup>
								<thead>
									<tr>
									<th scope="col" id="th_privacy_consign_kind">구분</th>
									<th scope="col" id="th_privacy_consign_item">수집하는 개인정보 항목</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<td headers="th_privacy_consign_kind" rowspan="2">필수</td>
									<td headers="th_privacy_consign_item">
									- 성명, 생년월일, 성별, 본인인증정보(CI, DI): 본인 인증 시 수집<br>
									- 아이디, 비밀번호, 휴대폰번호, 이메일, 문자/이메일/앱푸쉬 수신동의여부: 회원 가입 시 수집
									</td>
									</tr>
									<tr>
										<td headers="th_privacy_consign_item">
										14세미만 법정대리인의 이름, 휴대폰번호, CI</td>
									</tr>
									<tr>
										<td headers="th_privacy_consign_kind">선택</td>
										<td headers="th_privacy_consign_item">주소, 선호영화관, 프로필사진</td>
									</tr>
								</tbody>
							</table>	
							<br>
							(2)서비스 이용 또는 사업처리 과정에서 생성 수집되는 각종 거래 및 개인 성향 정보	
							<br>
							 - 서비스 이용기록(이용시간, 이용극장, 포인트 적립 및 사용 기록, 상품 또는 서비스 구매 내역 등), 앱/웹 로그인 기록, 접속 로그, 접속IP정보, 쿠키				
							<br>
							 - 결제 기록(생년월일, 신용카드 정보)
						</dd>
					</dl>
				</div>
				<div class="term_check pl15">
				<span><input type="checkbox" class="ckbox"  title="ck2222"></span>
				<label for="term2" >위의 ‘개인정보수집 및 이용안내’를 읽고 동의 합니다. (필수 동의)</label>
				<p class="fz13 c_purple">※ 개인정보수집 및 이용에 대한 동의를 거부할 수 있으며, 미 동의 시 회원가입을 하실 수 없습니다.</p> 
				</div>
				<!-- 개인정보 처리방침 -->
				<!-- 제휴 모바일 멤버십 서비스 이용을 위한 제 3자 제공에 관한 안내// -->
				<h3>제휴 모바일 멤버십 서비스 이용을 위한 제 3자 제공에 관한 안내</h3>
				<div class="term_text" tabindex="0">
					<dl>
						<dd>  1. 메가박스중앙㈜(이하 "회사")는 고객의 요청에 의하여 해당 고객의 개인정보를 제 3자에게 제공하는 경우, 그 제공하는 목적, 제공하는 개인정보의 항목, 개인정보를 제공받는 자 및 그 보유 • 이용기간은 다음 표와 같습니다.
						<br>
						<table summary="개인정보 제3자 제공에 관한 안내">
						<caption class="blind">제휴 모바일 멤버십 서비스 이용을 위한 제 3자 제공에 관한 안내:제공받는 업체, 제공하는 항목, 제공받는 자의 이용목적, 보유 및 이용기간 등의 정보제공</caption>
						<thead>
							<tr style="border:solid 1px #848484; border-bottom:none;">
								<th scope="col" id="th_privacy_3rdparty_company" style="border-right:1px solid #848484; text-align:center; width:300px;">제공받는 업체</th>
								<th scope="col" id="th_privacy_3rdparty_item" style="border-right:1px solid #848484; text-align:center">제공하는 항목</th>
								<th scope="col" id="th_privacy_3rdparty_purpose" style="border-right:1px solid #848484; text-align:center">제공받는 자의 이용목적</th>
								<th scope="col" id="th_privacy_3rdparty_term" style="border-right:1px solid #848484; text-align:center">보유 및 이용기간</th>
							</tr>
						</thead>
						<tbody>
							<tr style="border:solid 1px #848484">
								<td headers="th_privacy_3rdparty_company" style="border:solid 1px #848484; padding-left:6px;">SK플래닛㈜, ㈜케이티, LG U+㈜, ㈜카카오페이, ㈜비엔에스웍스(SK플래닛㈜의 Syrup 모바일 서비스 대행사), ㈜엑스머스(U+멤버스 서비스 대행사)</td>
								<td headers="th_privacy_3rdparty_item" style="border:solid 1px #848484; padding-left:6px;">메가박스 멤버십 카드번호, 포인트 내역, 휴대폰번호, 성명, 메가박스 WEB ID, 예매 정보, 본인확인기관을 통해 받는 결과값(CI)</td>
								<td headers="th_privacy_3rdparty_purpose" style="border:solid 1px #848484; padding-left:6px;">메가박스 포인트 적립 및 사용, 포인트 내역 제공 등 제휴 서비스 제공, 예매 정보 제공 등 제휴 서비스 제공 활동</td>
								<td headers="th_privacy_3rdparty_term" style="border:solid 1px #848484; padding-left:6px;">해당 제휴사 고객 가입 시 동의한 보유 및 이용기간까지</td>
							</tr>
						</tbody>
					</table>
					<br>
					</dd>
					<dd> 2. "회사"와 관련한 제휴 계약 등을 신규 체결 또는 상기 기재된 개인정보 제공업체와의 기존 계약을 해지할 수 있으며, 그 경우 개인정보를 제공받는 업체에 변경이 생길 수 있습니다. 변경사항은 발생 시 홈페이지를 통해 고지하거나 동의를 구한 후 업체에게 제공됩니다.</dd>
					<dd> 3. 회원은 제휴업체에 대한 정보 제공 철회(제휴업체 이용약관 동의 철회)를 원하시는 경우 각 제휴업체에 방문하여 이용약관 철회 및 정보 제공 철회를 직접 진행해주셔야 합니다.</dd>
					</dl>
				</div>
				<div class="term_check pl15">
				<span><input type="checkbox" class="ckboxSelect"></span>
				<label for="term2" >위의 '제휴 모바일 멤버십 서비스 이용을 위한 제3자 제공에 대한 안내'를 읽고 동의 합니다. (선택 동의)</label>
				<p class="fz13 c_purple">※ 제3자 정보 제공 동의를 거부할 권리가 있으며, 동의를 거부하더라도 회원가입 및 서비스 이용이 가능합니다.</p> 
				</div>
				
				<div class="term_check bottom pl15">
				<span><input type="checkbox" class="ckboxAll" ></span>
				<label for="term_all">위의 모든 약관을 읽고 동의 합니다.</label>
				</div>
				<div class="btn_wrap text-center mt50">
				<button type="button" class="btn">취소</button>
				<button type="button" class="btn btn_ok" ><span class="blind">확인</span></button>
				</div>
				<button id="btn_modal" data-toggle="modal" data-target="#myModal"  hidden="hidden"></button>
				<!-- modal창 -->
				<div class="modal fade" id="myModal" role="dialog">
   					 <div class="modal-dialog">
	     			 <!-- Modal content-->
		      			<div class="modal-content">
		        			<div class="modal-header">
		         			<button type="button" class="close" data-dismiss="modal">&times;</button>
		          			<h4 class="modal-title">알림</h4>
		        		</div>
		        		<div class="modal-body">
		          			<p>서비스 이용약관 및 정보이용 안내에 대한 동의를 해주세요</p>
		        		</div>
		        		<div class="modal-footer">
		          			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        		</div>
		      			</div>
    				</div>
  				</div>
  				<!-- modal창 -->
			</div>
		</div>
	</div>
</div>
<!-- 풋터 -->
<jsp:include page="../temp/footer.jsp"/>
<script type="text/javascript">
	$('.ckboxAll').click(function() {
		var c = $(this).prop('checked');
		$('.ckbox').prop('checked', c);
		$('.ckboxSelect').prop('checked', c);
	});

	
	$('.btn_ok').click(function() {
		var c = true;
		$('.ckbox').each(function() {
			if(!$(this).prop('checked')){
				c=false;
			}
		});
		if(c){
			location.href="./memberJoin";
		}else{
			$('#btn_modal').trigger('click');
		}
	});
</script>
</body>
</html>