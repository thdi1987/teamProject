<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html style="background: #ccc; width: 100%; height: 100%;">
<head>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
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


<style>
body {
	margin: 0;
	padding: 0;
	font-family: '맑은 고딕', verdana;
}

a {
	color: #05f;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
}

ul, lo, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

/* ---------- */
div#root {
	width: 900px;
	margin: 0 auto;
}

header#header {
	
}

nav#nav {
	
}

section#container {
	
}

section#content {
	float: right;
	width: 700px;
}

aside#aside {
	float: left;
	width: 180px;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

footer#footer {
	background: #eee;
	padding: 20px;
}

/* ---------- */
header#header div#header_box {
	text-align: center;
	padding: 30px 0;
}

header#header div#header_box h1 {
	font-size: 50px;
}

header#header div#header_box h1 a {
	color: #000;
}

nav#nav div#nav_box {
	font-size: 14px;
	padding: 10px;
	text-align: right;
}

nav#nav div#nav_box li {
	display: inline-block;
	margin: 0 10px;
}

nav#nav div#nav_box li a {
	color: #333;
}

section#container {
	
}

aside#aside h3 {
	font-size: 22px;
	margin-bottom: 20px;
	text-align: center;
}

aside#aside li {
	font-size: 16px;
	text-align: center;
}

aside#aside li a {
	color: #000;
	display: block;
	padding: 10px 0;
}

aside#aside li a:hover {
	text-decoration: none;
	background: #eee;
}

aside#aside li {
	position: relative;
}

aside#aside li:hover {
	background: #eee;
}

aside#aside li>ul.low {
	display: none;
	position: absolute;
	top: 0;
	left: 180px;
}

aside#aside li:hover>ul.low {
	display: block;
}

aside#aside li:hover>ul.low li a {
	background: #eee;
	border: 1px solid #eee;
}

aside#aside li:hover>ul.low li a:hover {
	background: #fff;
}

aside#aside li>ul.low li {
	width: 180px;
}

footer#footer {
	margin-top: 100px;
	border-radius: 50px 50px 0 0;
}

footer#footer div#footer_box {
	padding: 0 20px;
}
</style>

<style>
div.pets div.petImg {
	float: left;
	width: 350px;
}

div.pets div.petImg img {
	width: 350px;
	height: auto;
}

div.pets div.petsinfo {
	float: right;
	width: 330px;
	font-size: 22px;
}

div.pets div.petsinfo p {
	margin: 0 0 20px 0;
}

div.pets div.petsinfo p span {
	display: inline-block;
	width: 100px;
	margin-right: 15px;
}

div.pets div.petsinfo p.cartStock input {
	font-size: 22px;
	width: 50px;
	padding: 5px;
	margin: 0;
	border: 1px solid #eee;
}

div.pets div.petsinfo p.cartStock button {
	font-size: 26px;
	border: none;
	background: none;
}

div.pets div.petsinfo p.addToCart {
	text-align: right;
}

div.pets div.petcontents {
	font-size: 18px;
	clear: both;
	padding-top: 30px;
}
</style>

<style>
section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
}

section.replyList div.petinfo {
	
}

section.replyList div.petinfo .mname {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.petinfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replycontent {
	padding: 10px;
	margin: 20px 0;
}
</style>



<title>후기 게시판</title>
</head>
<body>
	<div id="root" style="background: #ccc; width: 100%; height: 100%;">
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
		<div class="container-fluid"
			style="background: #ccc; width: 100%; height: 100%;">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"
					style="padding-top: 120px; font-size: 30px;">후기게시판</h1>
			</div>
			<hr class="sidebar-divider d-none d-md-block">

			<div id="nav_box" style="height: 30px; margin: 0 0 0 1700px;">
				<c:if test="${authInfo != null }">
					<c:if
						test="${authInfo.division == 'A1' or authInfo.division == 'B1'}">
						<li><a
							href="${pageContext.request.contextPath}/Review/reviewIndex"
							class="btn btn-secondary btn-lg"><i
								class="fas fa-download fa-sm text-white-50"></i>글쓰기</a> <!-- 일반사용자 와 관리자 구분  -->
						</li>
					</c:if>
				</c:if>
			</div>

			<hr class="sidebar-divider d-none d-md-block">


			<aside id="aside" style="height: 300px; background: gray">
				<div id="aside" style="background: gray;">
					<%@ include file="boardAside.jsp"%>
				</div>
			</aside>

			<section id="container">
				<div id="container"
					style="width: 1500px; height: 1300px; margin-left: 200px; background: white;">
					<div id="content">
						<form role="form" method="post">
							<input type="hidden" name="petnum" value="${view.petnum}" />
						</form>

						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd; background:white;">
							<tbody>
								<tr>
									<td style="width: 20%;">제목</td>
									<td colspan="3" style="border-left: 1px solid black;"><c:out
											value="${view.petname}" /></td>
								</tr>
								<%-- <tr>
									<td>작성자</td>
									<td colspan="3" style="border-left: 1px solid black;"><c:out
											value="${read.mname}" /></td>
								</tr> --%>
								<tr>
									<td>카테고리</td>
									<td colspan="3" style="border-left: 1px solid black;"><c:out
											value="${view.petcatename}" /></td>
								</tr>
								<tr>
									<td>사진</td>
									<td colspan="3"
										style="height: 600px; text-align: left; border-left: 1px solid black;"><img
										src="${pageContext.request.contextPath}/${view.petimage}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td colspan="3"
										style="height: 600px; text-align: left; border-left: 1px solid black;"><c:out
											value="${view.petcontents}" /></td>
								</tr>
							</tbody>
						</table>
						<div id="reply">
							<c:if test="${authInfo == null }">
								<p>
									댓글을 남기시려면 <a
										href="${pageContext.request.contextPath}/member/login">로그인</a>해주세요
								</p>
							</c:if>

							<c:if test="${authInfo != null }">
								<section class="replyForm">
									<form role="form" method="post" autocomplete="off">

										<input type="hidden" name="petnum" value="${view.petnum}">
										<div class="input_area">
											<textarea name="repcon" id="repcon" style="width: 1300px;"></textarea>
											<button type="submit" id="reply_btn btn-secondary btn-lg"
												style="margin-left: 1350px; margin-top: -100;">댓글
												남기기</button>

										</div>
									</form>
								</section>
							</c:if>
							<section class="replyList">
								<ol>

									<c:forEach items="${reply}" var="reply">
										<li>
											<div class="petinfo">
												<span class="mname">${reply.mname}</span> <span class="date"><fmt:formatDate
														value="${reply.repdate}" pattern="yyyy-MM-dd" /></span>
											</div>
											<div class="replycontent" style="font-size:20px;">${reply.repcon}</div>
										</li>
									</c:forEach>

								</ol>
							</section>
						</div>

					</div>
				</div>
			</section>
		</div>
	</div>

</body>
</html>
