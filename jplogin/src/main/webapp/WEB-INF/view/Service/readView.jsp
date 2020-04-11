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

<title>자주하는질문</title>
</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".update_btn")
								.on(
										"click",
										function() {
											formObj
													.attr("action",
															"${pageContext.request.contextPath}/Service/updateView");
											formObj.attr("method", "get");
											formObj.submit();
										})

						// 삭제
						$(".delete_btn")
								.on(
										"click",
										function() {

											var deleteYN = confirm("삭제하시겠습니까?");
											if (deleteYN == true) {

												formObj
														.attr("action",
																"${pageContext.request.contextPath}/Service/delete");
												formObj.attr("method", "post");
												formObj.submit();

											}
										})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "${pageContext.request.contextPath}/Service/listUser?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})
						$(".list_btnSys")
								.on(
										"click",
										function() {

											location.href = "${pageContext.request.contextPath}/Service/listSys?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

					})
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
					<h1>자주하는질문</h1>
				</div>
				<div style="background: #ccc; padding-left: 900px;">
					<%@include file="rav.jsp"%>
				</div>

				<form name="readForm" role="form" method="post">
					<input type="hidden" id="SCNUM" name="SCNUM" value="${read.SCNUM}" />
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum"
						value="${scri.perPageNum}"> <input type="hidden"
						id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword"
						value="${scri.keyword}">
				</form>

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="3" style="border-left: 1px solid black;"><c:out
									value="${read.SCTITLE}" /></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="3" style="border-left: 1px solid black;"><c:out
									value="${read.SCWRITER}" /></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="3" style="border-left: 1px solid black;"><fmt:formatDate
									value="${read.SCWRTIME}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3"
								style="height: 600px; text-align: left; border-left: 1px solid black;"><c:out
									value="${read.SCCONTENTS}" /></td>
						</tr>
					</tbody>
				</table>

				<%-- <div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="SCTITLE" name="SCTITLE" class="form-control" value="${read.SCTITLE}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="SCCONTENTS" name="SCCONTENTS" class="form-control" readonly="readonly"><c:out value="${read.SCCONTENTS}" /></textarea>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="SCWRITER" name="SCWRITER" class="form-control" value="${read.SCWRITER}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
					<fmt:formatDate value="${read.SCWRTIME}" pattern="yyyy-MM-dd" />	
				</div> --%>
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
