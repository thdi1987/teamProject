<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub9.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
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


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>자유게시판</title>
</head>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='updateForm']");

						$(".cancel_btn")
								.on(
										"click",
										function() {
											event.preventDefault();
											location.href = "${pageContext.request.contextPath}/freeboard/readView?fbnumber=${update.fbnumber}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}";
										})

						$(".update.btn")
								.on(
										"click",
										function() {
											if (fn_valiChk()) {
												return false;
											}
											formObj
													.attr("action",
															"${pageContext.request.contextPath}/freeboard/update");
											formObj.attr("method", "post");
											formObj.submit();
										})
					})

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'].chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>
<body>

	<div id="wrap">

		<!-- Navigation -->
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
			style="background-color: whitesmoke; height: 106px;">
			<div class="container" style="margin-left: 50px; width: 480px;">
				<a class="navbar-brand" href="<c:url value="/main"/>"
					style="margin-right: 50px; margin-top: 0; height: 86.25px;"><img
					src="<c:url value="/img/logo-side3.png"/>"></a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive"
					style="width: 1000px; height: 200px; margin-top: -20;">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Notice/listUser"/>"
							style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size: 16px;">공지사항</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/animalinfo/petInfo"/>"
							style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size: 16px;">동물정보</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/freeboard/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">자유게시판</a>
						</li>
						<c:if test="${!empty authInfo}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/ParcelOut/list"/>"
								style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">분양게시판</a>
							</li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Review/home"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">후기게시판</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Service/listUser"/>"
							style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size: 16px;">고객센터</a>
						</li>
						<c:if
							test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/message/list"/>"
								style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size: 16px;">마이페이지</a>
							</li>
						</c:if>
						<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/Notice/listSys"/>"
								style="height: 41px; width: 126px; padding-left: 15px; padding-right: 15px; font-size: 16px;">관리자페이지</a>
							</li>
						</c:if>
						<c:if test="${!empty authInfo}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/message/list"/>"
								style="height: 41px; width: 180px; padding-left: 15px; padding-right: 15px; text-align: right; margin-left: 335px; font-size: 16px;">${authInfo.id}</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/member/logout"/>"
								style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size: 16px;">로그아웃</a>
							</li>
						</c:if>
						<c:if test="${empty authInfo}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/member/login"/>"
								style="height: 41px; width: 730px; padding-left: 15px; padding-right: 15px; text-align: right; font-size: 16px;">로그인</a>
							</li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/member/agreement"/>"
								style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size: 16px;">회원가입</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<section id="container">
				<div class="Notice" style="padding-top: 50px;">
					<h1>자유게시판</h1>
				</div>
				<div style="background: #ccc; padding-left: 1030px;">
					<%@include file="nav.jsp"%>
				</div>
				<form name="updateForm" role="form" method="post"
					action="${pageContext.request.contextPath}/freeboard/update">
					<input type="hidden" name="fbnumber" value="${update.fbnumber}"
						readonly="readonly" />
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd; overflow: hidden;">
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="3" style="border-left: 1px solid black;"><input
									type="text" id="fbtitle" name="fbtitle"
									value="${update.fbtitle}" class="chk" title="제목을 입력하세요"
									style="width: 900px" /></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" style="border-left: 1px solid black;"><input
									type="text" id="fbwriter" name="fbwriter"
									value="${update.fbwriter}" readonly="readonly"
									style="width: 900px" /></td>
							</tr>
							<tr>
								<td>작성일</td>
								<td colspan="3" style="border-left: 1px solid black;"><fmt:formatDate
										value="${update.fbregdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>내 용</td>
								<td colspan="3" style="border-left: 1px solid black;"><textarea
										id="fbcontent" name="fbcontent" class="chk" title="내용을 입력하세요"
										style="height: 400px; width: 900px; text-align: left;"><c:out
											value="${update.fbcontent}" /></textarea></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td colspan="3" style="border-left: 1px solid black;"><input
									type="password" id="fbpwd" name="fbpwd" value="${update.fbpwd}"
									class="chk" title="비밀번호을 입력하세요" style="width: 900px" /></td>
							</tr>
						</tbody>
					</table>
					<div>
						<button type="submit" class="update_btn"
							style="margin: 0 0 5rem 33rem; width: 20rem; height: 5rem; border-radius: 1rem; background: #c28af4; font-size: 0.5rem;">저장</button>
						<button type="submit" class="cancel_btn"
							style="margin: 0 0 5rem 5rem; width: 20rem; height: 5rem; border-radius: 1rem; background: #c28af4; font-size: 0.5rem;">취소</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>