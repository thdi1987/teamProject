<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
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

<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
부가적인 테마
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 <script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
<title>쪽지 내역</title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
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
		<li class="nav-item active"><a class="nav-link"
			href="<c:url value="/message/list"/>"> <i
				class="fas fa-fw fa-tachometer-alt"></i> <span>마이페이지</span></a></li>

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
				<a class="nav-link collapsed"
					href="<c:url value="/member/passwordCheck"/>"> <span>개인정보수정</span>
				</a>
			</c:if></li>
		<li class="nav-item"><c:if test="${!empty authInfo}">
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
					href="<c:url value="/adopt/listBuyer"/>"> <span>입양자 신청목록</span>
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

					<li style="padding: 23px 10px 0;"><a href="<c:url value="/Review/home"/>"
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
	       <form>
			<table class="Formr"  style="width: 800px; height: 600px; margin: 100px 0 0 450px; padding: 10px; background: #DCDBDB; border-radius: 1rem;">
				<tbody class="Formre">
				<tr>
					<th class="FFFD" style="padding-left: 100px;">회원분류</th>					
					<td class="FFFFD"><input id="MDIVISION" name="MDIVISION" type="text" value ="${info.MDIVISION}" readonly="readonly" style="width:400px;"></td>
				</tr>
				<tr>
					<th class="FFFD" style="padding-left: 100px;">아이디</th>
					<td class="FFFFD" colspan="2"><input type="text" id="MID" name="MID" value="${authInfo.id}" readonly="readonly" style="width:400px;"></td>					
				</tr>				
				<tr>
					<th class="FFFD" style="padding-left: 100px;">이름</th>
					<td class="FFFFD" colspan="2"><input id="MNAME" name="MNAME" type="text" value="${authInfo.name}" readonly="readonly" style="width:400px;"></td>
				</tr>				
				<tr>
					<th class="FFFD" style="padding-left: 100px;">이메일</th>
					<td class="FFFFD"><input id="MEMAIL" name="MEMAIL"  type="email" value ="${info.MEMAIL}" readonly="readonly" style="width:400px;"></td>					
				</tr>
				<tr>
					<th class="FFFD" style="padding-left: 100px;">주소</th>
					<td class="FFFFD"><input id=MADDRESS name="MADDRESS"  type="text" value ="${info.MADDRESS}" readonly="readonly" style="width:400px;"></td>					
				</tr>								
				<tr>
					<th class="FFFD" style="padding-left: 100px;">핸드폰번호</th>					
					<td class="FFFFD"><input id="MPHONE" name="MPHONE" type="text" value ="${info.MPHONE}" readonly="readonly" style="width:400px;"></td>
				</tr>
				<tr>
					<th class="FFFD" style="padding-left: 100px;">계좌번호</th>									
					<td class="FFFFD"><input id="MACCOUNT" name="MACCOUNT" type="text" value = "${info.MACCOUNT}" readonly="readonly" style="width:400px;">				
				</tr>
				<tr>
					<th class="FFFD" style="padding-left: 100px;">동물등록번호</th>					
					<td class="FFFFD"><input id="MREGISTRATION" name="MREGISTRATION" type="text" value ="${info.MREGISTRATION}" readonly="readonly" style="width:400px;"></td>
				</tr>
				<tr>
					<th class="FFFD" style="padding-left: 100px;">가입일</th>					
					<td class="FFFFD"><fmt:formatDate value="${info.MJOINDATE}" pattern="yyyy-MM-dd"/></td>
				</tr>					
			</tbody>
		</table>
		</form>
	  </div>
	  </div>
	  </div>
	</div>
</body>
</html>