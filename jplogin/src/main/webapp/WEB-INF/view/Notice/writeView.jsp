<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub26.css">

<!--  합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
	
	<link href="../css/bootstrapNav.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../csstest/modern-business.css" rel="stylesheet">

<script src="../csstest/jquery.js"></script>
<script src="../csstest/bootstrap.bundle.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<title>공지사항</title>
</head>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='writeForm']");
						$(".write_btn")
								.on(
										"click",
										function() {
											if (fn_valiChk()) {
												return false;
											}
											formObj
													.attr("action",
															"${pageContext.request.contextPath}/Notice/write");
											formObj.attr("method", "post");
											formObj.submit();
										});
					})
					
					
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("NBTITLE"));
				return true;
			}
		}
	}
</script>

<body>

	<div id="wrap">

		<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
		style="background-color: whitesmoke; height:106px;">
		<div class="container"
			style="margin-left: 50px; width: 480px;">
			<a class="navbar-brand" href="<c:url value="/main"/>"
				style="margin-right: 50px; margin-top: -30;"><img
				src="<c:url value="/img/logo-side3.png"/>"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive"
				style="width: 500px; margin-top: -15;">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Notice/listUser"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/animalinfo/petInfo"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">동물정보</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/freeboard/list"/>"
						style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">자유게시판</a>
					</li>
					<c:if test="${!empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/ParcelOut/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">분양게시판</a>
						</li>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Review/home"/>"
						style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">후기게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Service/listUser"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">고객센터</a>
					</li>
					<c:if
						test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/message/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">마이페이지</a>
						</li>
					</c:if>
					<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Notice/listSys"/>"
							style="height: 41px; width: 126px; padding-left: 15px; padding-right: 15px; font-size:16px;">관리자페이지</a>
						</li>
					</c:if>
					<c:if test="${!empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/message/list"/>"
							style="height: 41px;width: 180px;padding-left: 15px;padding-right: 15px;text-align: right;margin-left: 335px; font-size:16px;">${authInfo.id}</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/logout"/>"
							style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size:16px;">로그아웃</a>
						</li>
					</c:if>
					<c:if test="${empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/login"/>"
							style="height: 41px; width: 730px; padding-left: 15px; padding-right: 15px; text-align: right; font-size:16px;">로그인</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/agreement"/>"
							style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size:16px;">회원가입</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

		<div class="containert">
			<section id="containertt">
				<div class="Notice">
					<h1 style="padding-bottom: 0 px; padding-top: 80px;">공지사항</h1>
				</div>
				<div>
					<%@include file="rav.jsp"%>
				</div>
				<form name="writeForm" method="post"
					action="${pageContext.request.contextPath}/Notice/write">

					<table class="table table-striped"
						style="text-align: center;">
						 <tbody>
							<tr>
								<td colspan="3"><input type="text"
									id="NBTITLE" name="NBTITLE" class="chk"
									title="제목을 입력하세요" required="required" style=" float:left; width:950px; height: 50px; margin: 0 0 0 20px; border-radius: 1rem;" /></td>
							</tr>
							<tr>
								<td colspan="3"
									style="height: 600px; text-align: left;"> <textarea
										id="NBCONTENTS" name="NBCONTENTS" class="chk"
										title="내용을 입력하세요" required="required" style=" float:left; width:950px; height: 600px; border-radius: 1rem; margin: 0 0 0 20px;"></textarea></td>
							</tr>
						</tbody>
					</table>

					<div>
						<button type="submit" class="write btn-primary" style="width: 300px; float:left; height:50px; margin: 0 0 10px 100px;">작성</button>
						<button type="submit" class="cancel btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/Notice/listSys'" style="width: 300px; height:50px;float:left; margin: 0 0 10px 200px;">취소</button>
					</div>
				</form>
			</section>
		</div>
		<div id="footer">
		<div class="con_f" style='text-align: center'>
			<h4 style="color: purple;">自 捕 資 期</h4>
			<h4>
				팀장:황정선 팀원:강병진,김영규,황준<br> Copyright © 2019-2020 by KH Project
				Team jp
			</h4>


		</div>
	</div>
	</div>
</body>
</html>