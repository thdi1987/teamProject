<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="JP_Joker">
<meta name="descripton" content="이 사이트는 프로젝트용으로 만들어졌습니다.">
<meta name="keywords"
	content="강아지, 고양이, 동물입양, 동물분양, 반려동물분양, 반려동물입양, 프로젝트">
<meta name="generator" content="brakets">
<title>Safety Pet</title>

<!--CSS STYLE -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/login.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.js'></script>

<script src="../js/jquery-background-slideshow.js"></script>




<script>
	//로그인 확인
	$(document)
			.ready(
					function(e) {
						
						$('#MPASSWORD').on('keypress', function(e){
							if(e.keyCode == '13'){
							$('#loginUp').click();
							}
							})

						var idx = false;

						$('#loginUp')
								.click(
										function() {
											if ($.trim($('#MID').val()) == '') {
												alert("아이디 입력해주세요.");
												$('#MID').focus();
												return;
											} else if ($.trim($('#MPASSWORD')
													.val()) == '') {
												alert("패스워드 입력해주세요.");
												$('#MPASSWORD').focus();
												return;
											}

											$
													.ajax({
														url : "${pageContext.request.contextPath}/member/loginCheck",
														type : "POST",
														data : {
															"MID" : $('#MID')
																	.val(),
															"MPASSWORD" : $(
																	'#MPASSWORD')
																	.val()
														},
														success : function(data) {
															if (data == 0
																	&& $
																			.trim($(
																					'#MID')
																					.val()) != ''
																	&& $
																			.trim($(
																					'#MPASSWORD')
																					.val()) != '') {
																var html = "<tr><td colspan='3' style='color: red'>아이디나 비밀번호가 틀립니다.</td></tr>";
																$('#loginCheck')
																		.empty();
																$('#loginCheck')
																		.append(
																				html);
															} else if (data == 1
																	&& $
																			.trim($(
																					'#MID')
																					.val()) != ''
																	&& $
																			.trim($(
																					'#MPASSWORD')
																					.val()) != '') {
																var html = "<tr><td colspan='3' style='color: red'>이메일 인증을 해주세요.</td></tr>";
																$('#loginCheck')
																		.empty();
																$('#loginCheck')
																		.append(
																				html);
															} else {
																$('#loginFrm')
																		.submit();
															}
														},
														error : function() {
															alert("서버에러");
														}
													});

										});

					});
</script>
<script>
$(document).ready(function () {
    $('.bg-image').backgroundSlideshow({
    	 onBeforeTransition: function (index) {
             console.log("before transition", index)
         },
         onAfterTransition: function (index) {
             console.log("after transition", index)
         },
		  images: ["../img/dog4.jpg","../img/DC.jpg","../img/cat12.jpg"],
		  transitionDuration: 3000,
		});
   })
</script>

</head>
<body>
<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-3 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto"> 
              <h3 class="login-heading mb-4" style="margin: 0 0 100px 80px;">
              <a href="${pageContext.request.contextPath}/main">
			<img src="../img/logo-side3.png" style="padding-bottom: 40px;"></a>
			</h3>
              <form id="loginFrm" name="loginFrm"
				action="${pageContext.request.contextPath}/member/login"
				method="post" style="width: 580px;">
                <div class="form-label-group">
                  <input type="text" id="MID" class="MID" name="MID" placeholder="아이디" style="width:580px" required autofocus>
                  <label for="MID">ID</label>
                </div>

                <div class="form-label-group" >
                  <input type="password" id="MPASSWORD" name="MPASSWORD" class="MPASSWORD" placeholder="비밀번호" style="width:580px" required >
                  <label for="MPASSWORD">Password</label>
                </div>
                
                <div id="loginCheck"></div>

                <div class="custom-control custom-checkbox mb-3">
                  <input type="checkbox" class="custom-control-input" id="customCheck1">
                  <label class="custom-control-label" for="customCheck1">Remember password</label>
                </div>
                <button id="loginUp" class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="button">Sign in</button>
                <div class="text-center" style="margin:50px;">
                  <a href="<c:url value="/member/agreement"/>" style="margin: 50px 20px 0 0;">회원가입</a>
				  <a href="<c:url value="/member/reEmailAuthentication"/>" style="margin: 50px 0 0 0;">이메일 인증</a>
				  <a href="<c:url value="/member/findId"/>" style="margin: 50px 0 0 20px;">아이디 찾기</a>
				  <a href="<c:url value="/member/findPassword"/>"style="margin: 50px 0 0 20px;">비밀번호 찾기</a>
				</div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>