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

<title>자유게시판</title>
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

											$
													.ajax({
														url : "${pageContext.request.contextPath}/freeboard/updateCheck",
														type : "POST",
														data : {
															"fbnumber" : $(
																	'#fbnumber')
																	.val(),
															"fbpwd" : $(
																	'#fbpwd')
																	.val()
														},
														success : function(data) {
															if (data == 1
																	&& $
																			.trim($(
																					'#fbnumber')
																					.val()) != ''
																	&& $
																			.trim($(
																					'#fbpwd')
																					.val()) != '') {

																formObj
																		.attr(
																				"action",
																				"${pageContext.request.contextPath}/freeboard/updateView");
																formObj
																		.attr(
																				"method",
																				"get");
																formObj
																		.submit();

															} else {
																alert("비밀번호가 틀립니다.")
															}
														},
														error : function() {
															alert("서버에러");
														}
													});

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
																"${pageContext.request.contextPath}/freeboard/delete");
												formObj.attr("method", "post");
												formObj.submit();

											}
										})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "${pageContext.request.contextPath}/freeboard/list?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

						$(".replyWriteBtn")
								.on(
										"click",
										function() {
											var formObj = $("form[name='replyForm']");
											formObj
													.attr("action",
															"${pageContext.request.contextPath}/freeboard/replyWrite");
											formObj.submit();
										});

						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "${pageContext.request.contextPath}/freeboard/replyUpdateView?fbnumber=${read.fbnumber}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&frnumber="
													+ $(this).attr(
															"data-frnumber");
										});

						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "${pageContext.request.contextPath}/freeboard/replyDeleteView?fbnumber=${read.fbnumber}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&frnumber="
													+ $(this).attr(
															"data-frnumber");
										});

						// 댓글버튼 그냥 눌렀을때
						$(".replyWriteBtn").click(function() {
							if ($.trim($('#frnick').val()) == '') {
								alert("작성자 입력해주세요.");
								$('#frnick').focus();
								return;
							} else if ($.trim($('#frcontent').val()) == '') {
								alert("내용 입력해주세요.");
								$('#frcontent').focus();
								return;

							}
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
					<h1>자유게시판</h1>
				</div>

				<div style="background: #ccc; padding-left: 1030px;">
					<%@include file="nav.jsp"%>
				</div>

				<form name="readForm" role="form" method="post">
					<input type="hidden" id="fbnumber" name="fbnumber"
						value="${read.fbnumber}" /> <input type="hidden" id="page"
						name="page" value="${scri.page}"> <input type="hidden"
						id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
					<input type="hidden" id="searchType" name="searchType"
						value="${scri.searchType}"> <input type="hidden"
						id="keyword" name="keyword" value="${scri.keyword}">


					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td style="width: 20%;">글 제목</td>
								<td colspan="3" style="border-left: 1px solid black;"><c:out
										value="${read.fbtitle}" /></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" style="border-left: 1px solid black;"><c:out
										value="${read.fbwriter}" /></td>
							</tr>
							<tr>
								<td>작성일</td>
								<td colspan="3" style="border-left: 1px solid black;"><fmt:formatDate
										value="${read.fbregdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3"
									style="height: 600px; text-align: left; border-left: 1px solid black;"><c:out
										value="${read.fbcontent}" /></td>
							</tr>
						</tbody>
					</table>

					<div class="form-group"
						style="margin: 10px 0 0 0; height: 150px; ">
						<label for="fbwriter" class="col-sm-2 control-label">비밀번호</label>
						<input type="password" id="fbpwd" name="fbpwd"
							class="form-control" value="${read.fbpwd}" /><br />
						<button type="button" class="update_btn btn btn-warning">수정</button>
						<button type="button" class="delete_btn btn btn-danger">삭제</button>
						<button type="button" class="list_btn btn btn-primary">목록</button>
					</div>
				</form>

				<form name="replyForm" method="post" class="form-horizontal"
					style="height: 400px">
					<input type="hidden" id="fbnumber" name="fbnumber"
						value="${read.fbnumber}" /> <input type="hidden" id="page"
						name="page" value="${scri.page}"> <input type="hidden"
						id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
					<input type="hidden" id="searchType" name="searchType"
						value="${scri.searchType}"> <input type="hidden"
						id="keyword" name="keyword" value="${scri.keyword}">

					<div class="form-group"
						style="margin: 20px 150px 0 0; width: 800px">
						<label for="frnick" class="col-sm-2 control-label">댓글 작성자</label>
						<div class="col-sm-10">
							<input type="text" id="frnick" name="frnick" class="form-control"
								required="required" style="width: 800px;" />
						</div>
					</div>

					<div class="form-group"
						style="margin: 10px 150px 0 0; width: 800px; height: 400px;">
						<label for="frcontent" class="col-sm-2 control-label">댓글
							내용</label>
						<div class="col-sm-10">
							<textarea id="frcontent" name="frcontent" class="form-control"
								required="required"
								style="width: 800px; height: 300px; float: left; resize: none;"></textarea>
						</div>
					</div>

					<div class="form-group"
						style="float: right; margin: -433px 50px 0 0;">
						<div class="col-sm-offset-1 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success"
								style="width: 90px; height: 90px;">작성</button>
						</div>
					</div>
				</form>
				<!-- 댓글 -->
				<div id="reply" style="width: 929px;">
					<div class="replyList" style="list-style: none;">
						<c:forEach items="${replyList}" var="replyList">
							<div
								style="border-bottom: 1px solid #ccc; width: 1138px;">
								<div style="margin: 0 0 0 30px; font-size: 20px">
									${replyList.frnick}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<fmt:formatDate value="${replyList.frregdate}"
										pattern="yyyy-MM-dd" />
								</div>
								<br>
								<div style="margin: 0 0 0 30px; font-size: 40px">${replyList.frcontent}</div>

							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>