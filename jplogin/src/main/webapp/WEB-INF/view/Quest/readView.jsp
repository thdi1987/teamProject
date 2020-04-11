<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub11.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>문의하기</title>
</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 삭제
						$(".delete_btn")
								.on(
										"click",
										function() {

											var deleteYN = confirm("삭제하시겠습니까?");
											if (deleteYN == true) {

												formObj
														.attr("action",
																"${pageContext.request.contextPath}/Quest/delete");
												formObj.attr("method", "GET");
												formObj.submit();

											}
										})

						// 목록			
						$(".list_btnSys")
								.on(
										"click",
										function() {

											location.href = "${pageContext.request.contextPath}/Quest/listSys?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

					})
</script>

<body>
	<div id="wrap">

		<div id="subheader">
			<div class="submenu">
				<h1 class="logo">
					<a href="${pageContext.request.contextPath}/main"> <img
						src="../img/logo-side3.png"></a>
				</h1>
				<nav class="submain-menu">
					<ul class="su">
						<li class="sub"><a href="<c:url value="/Notice/listUser"/>">공지사항</a>
						</li>

						<li class="sub"><a
							href="<c:url value="/animalinfo/petInfo"/>">동물정보</a></li>

						<li class="sub"><a href="<c:url value="/freeboard/list"/>">자유게시판</a></li>

						<li class="sub"><c:if test="${!empty authInfo}">
								<a href="<c:url value="/ParcelOut/list"/>">분양게시판</a>
							</c:if></li>

						<li class="sub"><a href="<c:url value="/Review/home"/>">후기게시판</a></li>

						<li class="sub"><a href="<c:url value="/Service/listUser"/>">고객센터</a></li>

						<li class="sub"><c:if test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
								<a href="<c:url value="/message/list"/>">마이페이지</a>
							</c:if></li>

						<li class="sub"><c:if
								test="${!empty authInfo and authInfo.division == 'S1'}">
								<a href="<c:url value="/Notice/listSys"/>">관리자페이지</a>
							</c:if></li>
					</ul>
				</nav>
			</div>
		</div>

		<div class="container">
			<section id="container">
				<div class="Notice">
					<h1>문의내역</h1>
				</div>
				<div>
					<%@include file="nav2.jsp"%>
				</div>
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="QNUM" name="QNUM" value="${read.QNUM}" />
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum"
						value="${scri.perPageNum}"> <input type="hidden"
						id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword"
						value="${scri.keyword}">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="3" style="border-left: 1px solid black;"><c:out
										value="${read.QTITLE}" /></td>
							</tr>
							<tr>
								<td>작성자이메일</td>
								<td colspan="3" style="border-left: 1px solid black;"><c:out
										value="${read.QEMAIL}" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3"
									style="height: 600px; text-align: left; border-left: 1px solid black;"><c:out
										value="${read.QCONTENT}" /></td>
							</tr>
						</tbody>
					</table>
				</form>

			</section>
		</div>
	</div>
</body>
</html>
