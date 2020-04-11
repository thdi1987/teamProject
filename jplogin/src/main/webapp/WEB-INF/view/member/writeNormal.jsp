<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">


<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../js/jquery-background-slideshow.js"></script>

<script>
	$(document).ready(
			function() {
				$('body').backgroundSlideshow(
						{
							onBeforeTransition : function(index) {
								console.log("before transition", index)
							},
							onAfterTransition : function(index) {
								console.log("after transition", index)
							},
							images : [ "../img/dog1.jpg", "../img/cat2.jpg",
									"../img/dog3.jpg" ],
							transitionDuration : 3000,
						});
			})
</script>
</head>
<body style="position: relative; height: 1000px;  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);">

	 <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-9 col-lg-9 mx-auto">
        <div class="card card-signin my-5" style=" background:#f7f7f7; background-color: rgba( 255, 255, 255, 0.5 ); border-radius: 1px; ">
          <div class="card-body" style=" background:#f7f7f7; background-color: rgba( 255, 255, 255, 0.5 ); ">
            <h5 class="card-title text-center">회원가입</h5>
            <form class="form-signin" id="signFrm" name="signFrm"
					action="${pageContext.request.contextPath}/member/writeNormal"
					method="post" style="height:700px; margin: 50px 0 0 0;">
              <div class="form" style="height:50px;">
                <input type="text" id="MID" name="MID" class="form-control" placeholder="ID" style="width:600px;border-radius: 1px; float:left;" required autofocus>
                <input type="button" id="Check" name = "Check" class="form-control"  style="width:183px;border-radius: 1px; float:left; " value="아이디 중복체크">
              </div>
              
              <div class="form" style="height:50px;">
                <input type="text" id="MNAME" name="MNAME" class="form-control" placeholder="이름" required>
                
              </div>

              <div class="form" style="height:50px;">
                <input type="password" id="MPASSWORD" name="MPASSWORD" class="form-control" placeholder="Password(숫자와문자포함7~12자리)" required>
                <input id="passwordCheck" name="passwordCheck" type="password" class="form-control" placeholder="Password(확인)"  style="margin-top:10px;">
              </div>
              
              <div class="form" style="height:50px; height:50px; margin-bottom: 0px; margin-top: 40px;">
                <input type="email" id="MEMAIL" class="form-control" name="MEMAIL" placeholder="Email" required style="margin-top: 7px; width:600px;border-radius: 1px; float:left;">
                <input type="button" id="emailCheck" name = "emailCheck" class="form-control"  style="margin-top: 7px;width:183px;border-radius: 1px;float:left;" value="이메일 중복체크">
              </div>
              
              <div class="form" style="height:50px;">
                <input type="text" id="addr1" class="form-control" name="addr1" placeholder="우편번호" required style="margin-top: 7px width:600px;border-radius: 1px;float:left;padding-top: 6px;border-top-width: 1px;margin-top: 13px;width: 596px;" readonly="readonly">
                <button type="button" class="btn btn-default" id = "addressbtn" name = "addressbtn" onclick="execPostCode();" style="width:183px;border-radius: 1px;float:left;margin-top: 15px;"><i class="fa fa-search"></i> 우편번호 찾기</button>  
                <input class="form-control" style="width:350px; border-radius: 1px; float:left; margin-top:10px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
    			<input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text" style="width:350px; border-radius: 1px; float:left; margin-top:10px;" />
              </div>
              
              <div class="form" style="height:50px;">
                <select class="form-control" id="phnum" name="phnum" style="width:150px; margin-top:10px; float:left;">
										<option value="번호입력">번호입력</option>
										<option value="010">010</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
				</select>
				<input id="MPHONE" class="form-control" name="MPHONE" placeholder="1010-1010" type="text" size="31" style="float:left; width:600px; margin-top:10px;">
              </div>
              
              <div class="form" style="height:50px;">
                <select class="form-control" id="MBCODE" name="MBCODE" style="width:150px; margin-top:10px; float:left;">
										<option value="NULL">선택</option>
										<option value="B1">우리은행</option>
										<option value="B2">국민은행</option>
										<option value="B3">신한은행</option>
										<option value="B4">하나은행</option>
										<option value="B5">케이뱅크</option>
										<option value="B6">카카오뱅크</option>
										<option value="B7">KDB산업은행</option>
										<option value="B8">IBK기업은행</option>
										<option value="B9">회원수협</option>
										<option value="B10">농-축협</option>
										<option value="B11">산림조합</option>
										<option value="B12">새마을금고</option>
										<option value="B13">신용협동조합</option>
										<option value="B14">대구은행</option>
										<option value="B15">부산은행</option>
										<option value="B16">경남은행</option>
										<option value="B17">광주은행</option>
										<option value="B18">전북은행</option>
										<option value="B19">제주은행</option>
				</select>
				<input id="MACCOUNT" class="form-control" name="MACCOUNT" placeholder="계좌번호 입력" type="text" size="31" style="float:left; width:600px; margin-top:10px;">
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" id="signUp" name="signUp" style="margin-top:100px; width:300px; float:left; margin-left: 80px;">회원가입</button>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" id="return" name="return" style="margin-top:100px; width:300px; float:left; margin-left: 30px;" onclick= "location.href='${pageContext.request.contextPath}/main'">취소</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr); 
       }
    }).open();
}


	$(document)
			.ready(
					function(e) {

						var idx = false;
						var emailx = false;
						var passwordRegExp = /^[a-zA-Z][A-Za-z0-9]{6,12}$/;
						var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
						var phoneRegExp = /^\d{3,4}-\d{4}$/;

						$('#signUp')
								.click(
										function() {
											if ($.trim($('#MID').val()) == '') {
												alert("아이디 입력해주세요.");
												$('#MID').focus();
												return;
											} else if ($
													.trim($('#MNAME').val()) == '') {
												alert("이름 입력해주세요.");
												$('#MNAME').focus();
												return;
											} else if ($.trim($('#MPASSWORD')
													.val()) == '') {
												alert("패스워드 입력해주세요.");
												$('#MPASSWORD').focus();
												return;
											} else if (!passwordRegExp.test($(
													'#MPASSWORD').val())) {
												alert("첫글자 영문, 숫자와 문자 포함 형태의 7~12자리 이내의 비밀번호를 입력해주세요.");
												$('#MPASSWORD').focus();
												return;
											} else if ($('#MPASSWORD').val() != $(
													'#passwordCheck').val()) {
												alert('패스워드가 다릅니다.');
												$('#passwordCheck').focus();
												return;
											} else if ($.trim($('#MEMAIL')
													.val()) == '') {
												alert("이메일 입력해주세요.");
												$('#MEMAIL').focus();
												return;
											} else if (!emailRegExp.test($(
													'#MEMAIL').val())) {
												alert("이메일형식에 맞추어 주세요.");
												$('#MEMAIL').focus();
												return;
											} else if ($.trim($('#addr1')
													.val()) == '') {
												alert("우편번호찾기를 클릭해주세요.");
												$('#addressbtn').focus();
												return;
											}else if ($.trim($('#addr2')
													.val()) == '') {
												alert("우편번호찾기를 클릭해주세요.");
												$('#addressbtn').focus();
												return;
											}else if ($.trim($('#addr3')
													.val()) == '') {
												alert("상세주소를 입력해주세요.");
												$('#addr3').focus();
												return;
											} else if ($.trim($('#MPHONE')
													.val()) == '') {
												alert("핸드폰 입력해주세요.");
												$('#MPHONE').focus();
												return;
											} else if (!phoneRegExp.test($(
													'#MPHONE').val())) {
												alert("핸드폰번호 형식에 맞추어주세요.");
												$('#MPHONE').focus();
												return;
											}

											if (idx == false) {
												alert("아이디 중복체크를 해주세요.");
												return;
											} else if (emailx == false) {
												alert("이메일 중복체크를 해주세요.");
												return;
											} else {
												alert("이메일로 인증번호를 보냈습니다.")
												$('#signFrm').submit();
												$('#signUp').attr("disabled",
														"disabled");
											}
										});

						$('#Check')
								.click(
										function() {
											$
													.ajax({
														url : "${pageContext.request.contextPath}/member/idCheck",
														type : "POST",
														data : {
															"MID" : $('#MID')
																	.val()
														},
														success : function(data) {
															if (data == 0
																	&& $
																			.trim($(
																					'#MID')
																					.val()) != '') {
																idx = true;
																$('#MID')
																		.attr(
																				"readonly",
																				true);
																alert("사용가능한 아이디 입니다.")
															} else {

																alert("사용불가능한 아이디 입니다.")
															}
														},
														error : function() {
															alert("서버에러");
														}
													});

										});

						$('#emailCheck')
								.click(
										function() {
											$
													.ajax({
														url : "${pageContext.request.contextPath}/member/findIdEmailCheck",
														type : "POST",
														data : {
															"MEMAIL" : $(
																	'#MEMAIL')
																	.val()
														},
														success : function(data) {
															if (data == 0
																	&& $
																			.trim($(
																					'#MEMAIL')
																					.val()) != ''
																	&& emailRegExp
																			.test($(
																					'#MEMAIL')
																					.val())) {
																emailx = true;
																$('#MEMAIL')
																		.attr(
																				"readonly",
																				true);
																alert("사용가능한 이메일 입니다.")
															} else {

																alert("사용불가능한 이메일 입니다.")
															}
														},
														error : function() {
															alert("서버에러");
														}
													});

										});
						

					});
</script>
</html>