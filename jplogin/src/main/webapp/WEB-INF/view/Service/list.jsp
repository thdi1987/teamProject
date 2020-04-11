<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub7.css">

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
<title>고객센터</title>
</head>
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
			<div class="service" style="padding-top: 50px;">
				<h1>고객센터</h1>
			</div>
			<div style="background: #ccc; padding-left: 950px;">
				<%@include file="nav.jsp"%>
			</div>
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>작성자</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.SCNUM}" /></td>
								<td><c:if
										test="${!empty authInfo and authInfo.division == 'S1'}">
										<a
											href="${pageContext.request.contextPath}/Service/readViewSys?SCNUM=${list.SCNUM}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
												value="${list.SCTITLE}" /></a>
									</c:if> <c:if
										test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
										<a
											href="${pageContext.request.contextPath}/Service/readViewUser?SCNUM=${list.SCNUM}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
												value="${list.SCTITLE}" /></a>
									</c:if></td>
								<td><fmt:formatDate value="${list.SCWRTIME}"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${list.SCWRITER}" /></td>
							</tr>
						</c:forEach>

					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"
									<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"
									<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"
									<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"
									<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>

						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput"
									value="${scri.keyword}" class="form-control" /> <span
									class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button>
								</span>
							</div>
						</div>

						<script>
							$(function() {
								$('#searchBtn')
										.click(
												function() {
													if ("${!empty authInfo and authInfo.division == 'S1'}") {
														self.location = "listSys"
																+ '${pageMaker.makeQuery(1)}'
																+ "&searchType="
																+ $(
																		"select option:selected")
																		.val()
																+ "&keyword="
																+ encodeURIComponent($(
																		'#keywordInput')
																		.val());
													} else if ("${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}") {
														self.location = "listUser"
																+ '${pageMaker.makeQuery(1)}'
																+ "&searchType="
																+ $(
																		"select option:selected")
																		.val()
																+ "&keyword="
																+ encodeURIComponent($(
																		'#keywordInput')
																		.val());
													}
												});
							});
						</script>
					</div>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
									<li><a
										href="listSys${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>
								<c:if
									test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
									<li><a
										href="listUser${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
									<li
										<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
										<a href="listSys${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:if>
								<c:if
									test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
									<li
										<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
										<a href="listUser${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:if>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
									<li><a
										href="listSys${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
								<c:if
									test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
									<li><a
										href="listUser${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</form>
			</section>
		</div>
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

</body>
</html>