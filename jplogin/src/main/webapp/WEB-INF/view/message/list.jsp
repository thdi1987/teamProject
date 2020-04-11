<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<!-- Custom fonts for this template-->
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
	
<title>쪽지 내역</title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar" style="width:300px;">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/main">
			<img src="../img/logo-side4.png"></a>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="<c:url value="/message/list"/>"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>마이페이지</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Interface</div>

			<li class="nav-item"><c:if test="${!empty authInfo}">
					<a class="nav-link collapsed" href="<c:url value="/message/list"/>"> 
						<span>쪽지</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if test="${!empty authInfo}">
					<a class="nav-link collapsed" href="<c:url value="/member/passwordCheck"/>">
						<span>개인정보수정</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if test="${!empty authInfo}">
					<a class="nav-link collapsed" href="<c:url value="/MyPage/info"/>">
						<span>회원정보</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed" href="<c:url value="/adopt/listUser"/>" >
						<span>입양목록</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed" href="<c:url value="/ParcelOut/listMyPage"/>">
						<span>분양목록</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'B1'}">
					<a class="nav-link collapsed" href="<c:url value="/adopt/listBuyer"/>">
						<span>입양자 신청목록</span>
					</a>
				</c:if></li>
			<li class="nav-item"><c:if
					test="${!empty authInfo and authInfo.division == 'A1'}">
					<a class="nav-link collapsed" href="#" onclick="window.open('${pageContext.request.contextPath}/Buyer/writeView','_blank','width=800px,height=800px,toolbars=no' )">
						<span>분양자등록</span>
					</a>
				</c:if></li>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			
		</ul>
		<div id="content-wrapper" class="d-flex flex-column">
		<div id="content">
		 <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto" >
          						<!-- 공지사항  -->
						<li style="padding:23px 10px 0;"><a href="<c:url value="/Notice/listUser"/>" style="color:black;">공지사항</a></li>

						<li style="padding:23px 10px 0;"><a href="<c:url value="/animalinfo/petInfo"/>" style="color:black;">동물정보</a></li>

						<li style="padding:23px 10px 0;"><a href="<c:url value="/freeboard/list"/>" style="color:black;">자유게시판</a></li>

						<c:if test="${!empty authInfo}">
							<li style="padding:23px 10px 0;"><a href="<c:url value="/ParcelOut/list"/>" style="color:black;">분양게시판</a></li>
						</c:if>

						<li style="padding:23px 10px 0;"><a href="<c:url value="/Review/home"/>" style="color:black;">후기게시판</a></li>

						<li style="padding:23px 10px 0;"><a href="<c:url value="/Service/listUser"/>" style="color:black;">고객센터</a></li>

						<c:if
							test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
							<li style="padding:23px 10px 0;"><a href="<c:url value="/message/list"/>" style="color:black;">마이페이지</a></li>
						</c:if>

						<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
							<li style="padding:23px 10px 0;"><a href="<c:url value="/Notice/listSys"/>" style="color:black;">관리자페이지</a></li>
						</c:if>

           

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                <c:if test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
				<div class="log">
				<p style="font-color:black; margin: 6px 0 0 0;">${authInfo.id} 님</p>
				</div>			
				</c:if>
				</span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="<c:url value="/member/logout"/>">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <div class="container-fluid">
		<section id="container">
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">쪽지 내역</h1>
            <a onclick="window.open('${pageContext.request.contextPath}/message/writerViewMypage','_blank','width=800px,height=800px,toolbars=no' )" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-download fa-sm text-white-50"></i>쪽지 작성</a>
          </div>
			<form role="form" method="get">
				<table class="table table-hover">
					<!-- style="width: 100%; float: right; margin: 0 0 95px 0;" -->
					<thead>

						<tr>
						<tr>
							<th>번호</th>
							<th>보낸사람</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>

					</thead>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.msnum}" /></td>
							<td><c:out value="${list.msid2}" /></td>
							<td><a href="#"
								onclick="window.open('${pageContext.request.contextPath}/message/readView?msnum=${list.msnum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}','_blank', 'width:600, height:600')"><c:out
										value="${list.mstitle}" /></a></td>
							<td><fmt:formatDate value="${list.mstime}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>

				</table>
				<div class="search row">
					<div class="col-xs-2 col-sm-2"
						style="margin: 0 0 0 150px; display: block;">
						<select name="searchType" class="form-control">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="mt"
								<c:out value="${scri.searchType eq 'mt' ? 'selected' : ''}"/>>제목</option>
							<option value="mc"
								<c:out value="${scri.searchType eq 'mc' ? 'selected' : ''}"/>>내용</option>
							<option value="m"
								<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>받는
								사람</option>
							<option value="m2"
								<c:out value="${scri.searchType eq 'm2' ? 'selected' : ''}"/>>보낸
								사람</option>
							<option value="mtmc"
								<c:out value="${scri.searchType eq 'mtmc' ? 'selected' : ''}"/>>제목+내용</option>
						</select>
					</div>

					<div class="col-xs-7 col-sm-7"
						style="margin: 0 -600px 0 0; display: block;">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput"
								value="${scri.keyword}" class="form-control" /> <span
								class="input-group-btn">
								<button id="searchBtn" type="button" class="btn btn-primary"><i class="fas fa-search fa-sm" style="height:20px; margin:5px 0 0 0;"></i></button>
							</span>
						</div>
					</div>

					<script>
						$(function() {
							$('#searchBtn')
									.click(
											function() {
												self.location = "list"
														+ '${pageMaker.makeQuery(1)}'
														+ "&searchType="
														+ $(
																"select option:selected")
																.val()
														+ "&keyword="
														+ encodeURIComponent($(
																'#keywordInput')
																.val());
											});
						});
					</script>
				</div>
				<div class="col-md-offset-1"
					style="margin: 600px 0 0 500px; display: block;">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
		</section>
		<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
	</div>
	</div>
	</div>
</body>
</html>