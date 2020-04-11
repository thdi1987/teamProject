<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
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
				<div class="card card-signin my-5" style=" background:#f7f7f7; background-color: rgba( 255, 255, 255, 0.5 ); border-radius: 1px; ">
					<div class="card-body" style=" background:#f7f7f7; background-color: rgba( 255, 255, 255, 0.5 ); border-radius: 1px; ">
						<h5 class="card-title text-center" style=" margin: 30px 0 0 0; font-size:40px;">이메일 인증</h5>
						<form class="form-signin" id="emailChk" name="emailChk"
							action="${pageContext.request.contextPath}/member/emailAuthentication"
							method="post" style="height:200px; margin: 50px 0 0 0;">
							
							

							<div class="form" style="height:50px;">
								<input type="text" id="MEMAILCHECK" class="form-control"
									placeholder="인증번호" name="MEMAILCHECK"
									style="width: 600px; border-radius: 1px; float: left;" required>
								<input type="button"  class="form-control" id="check" name = "check" value="인증번호 확인" style="width: 183px; border-radius: 1px; float: left;">
							</div>

							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="button" id="signUp">회원가입</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	$(document).ready(function(e){
		var emailckx = false;
		$('#signUp').click(function(){	
			if($.trim($('#MEMAILCHECK').val()) == ''){
				alert("인증코드를 입력해주세요.");
				$('#MEMAILCHECK').focus();
				return;
			}
			if(emailckx==false){
				alert("인증번호를 확인해주세요.");
				return;
			}else{
				$('#emailChk').submit();
			} 
		});
		
		$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/member/emailCheck",
				type: "POST",
				data:{
					"MEMAILCHECK":$('#MEMAILCHECK').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#MEMAILCHECK').val()) != '' ){	
						alert("인증번호가 틀립니다.")
						
					}else if($.trim($('#MEMAILCHECK').val()) == '' ){	
						alert("인증번호가 없습니다.")
						
					}else{
						emailckx = true
						$('#MEMAILCHECK').attr("readonly",true);
						alert("확인되었습니다.")
						
					}	
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
	});
</script>
</html>