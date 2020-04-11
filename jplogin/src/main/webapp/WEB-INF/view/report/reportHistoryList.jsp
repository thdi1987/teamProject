<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("[id^='deletebtn']").on("click",function() {
				window.open("${pageContext.request.contextPath}/report/punish","_blank","width=500,height=500");
		});
				

		$('#selection').click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/adopt/selection",
				type : "POST",
				data : {
					"AANO" : $('#AANO').val()
				},
				success : function(data) {
					alert("확인하셨습니다.");
					$('#selection').hide();
					location.reload();
				},
				error : function() {
					alert("서버에러");
				}
			});

		});
	});
	
</script>




<title>신고처리</title>
</head>

<body>

	<div id="wrapper">

		
		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar" style="width: 300px;">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${pageContext.request.contextPath}/main"> <img
				src="../img/logo-side4.png"></a>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link" href="<c:url value="/Notice/listSys"/>"> <i
						class="fas fa-fw fa-tachometer-alt"></i> <span>관리자페이지</span></a>
				</c:if></li>

			<li class="nav-item active"><c:if
					test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link" href="<c:url value="/message/list"/>"> <i
						class="fas fa-fw fa-tachometer-alt"></i> <span>마이페이지</span></a>
				</c:if></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/Notice/listSys"/>">공지사항</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/ParcelOut/listSys"/>">분양신청내역</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/adopt/listSys"/>">입양신청내역</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/Buyer/listSys"/>">분양자등록신청내역</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/Quest/listSys"/>">문의사항</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed" href="#"
						onclick="window.open('${pageContext.request.contextPath}/member/delete','_blank','width=800px,height=800px,toolbars=no' )">회원삭제</a>
				</c:if></li>
				
				<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a a class="nav-link collapsed"
						href="<c:url value="/report/list"/>">신고내역</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'S1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/report/HistoryList"/>">신고처리상황</a>
				</c:if></li>	
				

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed" href="<c:url value="/message/list"/>">
						<span>쪽지</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/member/passwordCheck"/>"> <span>개인정보수정</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed" href="<c:url value="/MyPage/info"/>">
						<span>회원정보</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/adopt/listUser"/>"> <span>입양목록</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/ParcelOut/listMyPage"/>"> <span>분양목록</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed"
						href="<c:url value="/adopt/listBuyer"/>"> <span>입양자
							신청목록</span>
					</a>
				</c:if></li>

			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1'}">
					<a class="nav-link collapsed" href="#"
						onclick="window.open('${pageContext.request.contextPath}/Buyer/writeView','_blank','width=800px,height=800px,toolbars=no' )">
						<span>분양자등록</span>
					</a>
				</c:if></li>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

		</ul>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- 공지사항  -->
						<li style="padding: 23px 10px 0;"><a
							href="<c:url value="/Notice/listUser"/>" style="color: black;">공지사항</a></li>

						<li style="padding: 23px 10px 0;"><a
							href="<c:url value="/animalinfo/petInfo"/>" style="color: black;">동물정보</a></li>

						<li style="padding: 23px 10px 0;"><a
							href="<c:url value="/freeboard/list"/>" style="color: black;">자유게시판</a></li>

						<c:if test="${!empty authInfo}">
							<li style="padding: 23px 10px 0;"><a
								href="<c:url value="/ParcelOut/list"/>" style="color: black;">분양게시판</a></li>
						</c:if>

						<li style="padding: 23px 10px 0;"><a href="#"
							style="color: black;">후기게시판</a></li>

						<li style="padding: 23px 10px 0;"><a
							href="<c:url value="/Service/listUser"/>" style="color: black;">고객센터</a></li>

						<c:if
							test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
							<li style="padding: 23px 10px 0;"><a
								href="<c:url value="/message/list"/>" style="color: black;">마이페이지</a></li>
						</c:if>

						<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
							<li style="padding: 23px 10px 0;"><a
								href="<c:url value="/Notice/listSys"/>" style="color: black;">관리자페이지</a></li>
						</c:if>



						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"> <c:if
										test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
										<div class="log">
											<p style="font-color: black; margin: 6px 0 0 0;">${authInfo.id}
												님</p>
										</div>
									</c:if> <c:if test="${!empty authInfo and authInfo.division == 'S1'}">
										<div class="log">
											<p style="font-color: black; margin: 6px 0 0 0;">${authInfo.id}
												관리자님</p>
										</div>
									</c:if>
							</span>
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<c:url value="/member/logout"/>">
									<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				
				<div class="container-fluid">
					<section id="container">
						<div
							class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">신고처리 내역</h1>
						</div>
				
				
				<form name="listForm" role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>글번호</th>
								<th>신고된ID</th>
								<th>이메일</th>
								<th>현재카운트</th>
								<th>날짜</th>
								<th>해제시간</th>							
							</tr>
						</thead>

						<c:forEach items="${reportHistoryList}" var="list">
							<input type="hidden" value="${list.RHNO}" id="RNO">
							<input type="hidden" value="${list.RHID}" id="RREPORTEDID">					
							<tr>
								<td><c:out value="${list.RHNO}" /></td>
								<td><c:out value="${list.RHID}" /></td>							
								<td><c:out value="${list.RHEMAIL}" /></td>
								<td><c:out value="${list.RHCOUNT}" /></td>
								<td><c:out value="${list.RHDATE}" /></td>
								<td id="test"><c:out value="${list.RHRELEASEDATE}" /></td>													
							</tr>
						</c:forEach>

					</table>
					<div class="search row">
						<div class="col-xs-2 col-sm-2"
							style="margin: 0 0 100px 50px; display: block;">
							<select name="searchType" class="form-control">
								<option value="n"
									<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="w"
									<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							</select>
						</div>

						<div class="col-xs-7 col-sm-7"
							style="margin: 0 -600px 100px 0; display: block;">
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
					<div class="col-md-offset-1"
						style="margin: 600px 0 0 500px; display: block;">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
									<li><a
										href="${pageContext.request.contextPath}/report/HistoryList${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>							
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
									<li
										<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
										<a href="${pageContext.request.contextPath}/report/HistoryList${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:if>						
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
									<li><a
										href="${pageContext.request.contextPath}/report/HistoryList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>						
							</c:if>
						</ul>
					</div>
				</form>
			</section>
		</div>
	</div>
	</div>
	</div>
</body>

</html>