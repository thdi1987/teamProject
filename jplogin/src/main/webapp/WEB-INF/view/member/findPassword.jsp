<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="../css/reset.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">


<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
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
<body
	style="position: relative; height: 1000px; background: #007bff; background: linear-gradient(to right, #0062E6, #33AEFF);">

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-9 col-lg-9 mx-auto">
				<div class="card card-signin my-5"
					style="background: #f7f7f7; background-color: rgba(255, 255, 255, 0.5); border-radius: 1px;">
					<div class="card-body"
						style="background: #f7f7f7; background-color: rgba(255, 255, 255, 0.5); border-radius: 1px;">
						<h5 class="card-title text-center"
							style="margin: 30px 0 0 0; font-size: 40px;">비밀번호 찾기</h5>
						<form id="findPassword" name="findPassword"
							action="${pageContext.request.contextPath}/member/findPassword"
							method="post" style="height: 200px; margin: 50px 0 0 0;">

							<div class="form" style="height: 50px;">

								<input type="text" id="MID" class="form-control"
									placeholder="아이디 입력" name="MID" required autofocus>
							</div>

							<div class="form" style="height: 50px;">
								<input type="text" id="MEMAIL" class="form-control"
									placeholder="이메일 입력" name="MEMAIL" required>

							</div>

							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="button" id="findPasswordButton" name = "findPasswordButton">확 인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document)
			.ready(
					function(e) {

						var chk = false;
						var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

						$('#findPasswordButton')
								.click(
										function() {
											if ($.trim($('#MID').val()) == '') {
												alert("아이디 입력해주세요.");
												$('#MID').focus();
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
											}

											$
													.ajax({
														url : "${pageContext.request.contextPath}/member/findPasswordCheck",
														type : "POST",
														data : {
															"MID" : $('#MID')
																	.val(),
															"MEMAIL" : $(
																	'#MEMAIL')
																	.val()
														},
														success : function(data) {
															if (data == 1
																	&& $
																			.trim($(
																					'#MID')
																					.val()) != ''
																	&& $
																			.trim($(
																					'#MEMAIL')
																					.val()) != '') {
																chk = true;
																$('#MID')
																		.attr(
																				"readonly",
																				true);
																$('#MEMAIL')
																		.attr(
																				"readonly",
																				true);
																alert("임시비밀번호가 등록된 이메일로 전송되었습니다.")
																
																$(
																		'#findPassword')
																		.submit()
															} else {
																alert("등록된 아아디 또는 이메일이 없습니다.")
																
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