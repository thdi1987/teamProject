<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub16.css">

<!--CSS STYLE -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/login.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<script src="//code.jquery.com/jquery-3.1.1.slim.min.js"></script>
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
	<div id="Trim">
		<div class="Trimer">
			<form action="${pageContext.request.contextPath}/member/selectMember"
				class="joinForm" method="post" style="margin-top: 70px;">
				<ul class="join_box">
					<li class="checkBox check02">
						<ul class="clearfix">
							<li>이용약관 동의(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk"
								required="required" name="agree" id="agree"></li>
						</ul> <textarea>Safety Pet는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에 따라 다음과 같이 손님의 개인정보를 수집ㆍ이용합니다.  본 개인정보의 수집ㆍ이용에 동의하지 않으실 경우 Safety Pet의 웹 홈페이지를 통한 회원가입이 불가능하고, 회원가입을 전제로 Safety Pet이 제공하는 서비스 기타 혜택을 받을 수 없습니다.
                    </textarea>

						<ul class="clearfix">
							<li>개인정보 수집ㆍ이용 목적 동의(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk"
								required="required" name="agree" id="agree"></li>
						</ul> <textarea>(1)홈페이지: 회원 가입 및 관리, 회원가입 의사확인, 본인 식별ㆍ인증, 회원자격 유지ㆍ관리, 서비스 부정이용 방지, 각종 고지ㆍ통지, 이용약관 위반 회원에 대한 이용제한 조치, 서비스의 원활한 운영에 지장을 미치는 행위 및 서비스 부정이용행위 제재, 가입 및 가입횟수 제한, 탈퇴의사 확인. (2)재화 또는 서비스 제공: 웹 홈페이지을 통한 서비스제공 등 서비스 이용과 관련된 회원확인 등 문제해결. (3)서비스개선. 웹 홈페이지을 이용한 서비스를 이용자의 컴퓨터 등 정보통신기기에 최적화된 방식으로 제공할 수 있도록 개선, 서비스 개발, 개선 등 Safety Pet의 업무와 관련된 통계자료의 작성. (4)민원 처리: 민원인의 신원확인, 민원사항 확인, 사실조사를 위한 연락ㆍ통지, 처리결과 통보
                    </textarea>

						<ul class="clearfix">
							<li>수집하는 개인정보 동의(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk"
								required="required" name="agree" id="agree"></li>
						</ul> <textarea>회원가입정보: 성명(이름, 성), 휴대전화번호, 이메일, 주소, 계좌번호, 동물등록번호
                    </textarea>

						<ul class="clearfix">
							<li>개인정보의 보유ㆍ이용 기간 동의(필수)</li>
							<li class="checkBtn"><input type="checkbox" name="chk"
								required="required" name="agree" id="agree"></li>
						</ul> <textarea>(1)수집된 개인정보는 원칙적으로 회원가입 시부터 회원탈퇴 시까지 이용됩니다.(2) 손님이 회원탈퇴를 하는 경우에는 법령에 따라 개인정보를 보유해야 하는 경우 또는 이미 발생한 민원처리 등 회원탈퇴 이후에도 개인정보를 이용하여야 하는 사유가 있는 경우를 제외하고는 개인정보를 지체 없이 관련 법령이 정한 바에 따라 파기합니다.
                    </textarea>
				</ul>
				<ul class="footBtwrap clearfix">
					<li><input type ="button" class="fpmgBt1" onclick="location.href='<c:url value="/main"/>'" value="비동의"></li>
					<li><button class="fpmgBt2" type="submit" id="agreement">동의</button></li>
				</ul>
			</form>
		</div>

	</div>
</body>
</html>