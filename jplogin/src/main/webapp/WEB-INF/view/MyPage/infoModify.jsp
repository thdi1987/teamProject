<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
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
				<form id="infoUpdate" name="infoUpdate"
					action="${pageContext.request.contextPath}/member/infoUpdate"
					method="post">
					<table class="Formr"
						style="width: 800px; height: 600px; margin: 100px 0 0 450px; padding: 10px; background: #DCDBDB; border-radius: 1rem;">
						<tbody class="Formre" style="margin: 0 0 0 100px;">
							<tr>
								<th class="FFF" style="padding-left: 100px;">아이디</th>
								<td class="FFFF" colspan="4"><input type="text" id="MID"
									name="MID" value="${authInfo.id}" readonly="readonly" size="40"></td>
							</tr>
							<tr>
								<th class="FFF" style="padding-left: 100px;">이름</th>
								<td class="FFFF" colspan="4"><input id="MNAME" name="MNAME"
									type="text" value="${authInfo.name}" readonly="readonly"
									size="40"></td>
							</tr>
							<tr>
								<th class="FFF" style="padding-left: 100px;">비밀번호 변경</th>
								<td class="FFFF" colspan="4"><input id="MPASSWORD"
									name="MPASSWORD" placeholder="숫자와문자포함7~12자리 " type="password"
									size="40"></td>
							</tr>
							<tr>
								<th class="FFF" style="padding-left: 100px;">비밀번호 확인</th>
								<td class="FFFF" colspan="4"><input id="passwordCheck"
									name="passwordCheck" type="password" size="40"></td>
							</tr>
							<tr>
								<th class="FFF" style="padding-left: 100px;">이메일</th>
								<td class="FFFF"><input id="MEMAIL" name="MEMAIL"
									placeholder="이메일형식" type="email" required size="40"></td>
								<td class="FFFF"><input type="button" id="emailCheck"
									value="이메일 중복체크"></td>
								<td class="FFFF" colspan=4 id="msg"></td>
							</tr>
							<tr>
								<td class="FFF" style="padding-left: 100px;">핸드폰번호</td>
								<td class="FFFF" colspan="2"><select id="phnum"
									name="phnum">
										<option value="010">010</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
								</select> <input id="MPHONE" name="MPHONE" placeholder="0000-0000"
									type="text" size="33"></td>
							</tr>
						</tbody>
					</table>
					<div id="button">
						<div class="but"
							style="padding:100px 100px 100px 500px ; ">
							<input class="update" type="submit" id="infoUpdatebtn"
								name="infoUpdatebtn" value="수정"
								style="margin: 0 0 0 3rem; width: 10rem; height: 4rem; border-radius: 1rem; background: #c28af4; ">

							<input class="cancle" type="button"
								onclick="location.href='${pageContext.request.contextPath}/MyPage/info'"
								value="취소"
								style="margin: 0 0 0 3rem; width: 10rem; height: 4rem; border-radius: 1rem; background: #c28af4;">

							<input class="delete" type="button" id="secession"
								name="secession"
								onclick="location.href='${pageContext.request.contextPath}/member/secession'"
								value="회원탈퇴"
								style="margin: 0 0 0 3rem; width: 10rem; height: 4rem; border-radius: 1rem; background: #c28af4;">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function(e) {

						var emailx = false;
						var passwordRegExp = /^[a-zA-Z][A-Za-z0-9]{6,12}$/;
						var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
						var phoneRegExp = /^\d{3,4}-\d{4}$/;

						$('#infoUpdatebtn')
								.click(
										function() {
											if ($.trim($('#MPASSWORD').val()) == '') {
												alert("패스워드 입력해주세요.");
												$('#MPASSWORD').focus();
												return;
											} else if (!passwordRegExp.test($(
													'#MPASSWORD').val())) {
												alert("첫글자 영문, 숫자와 문자 포함 형태의 7~12자리 이내의 비밀번호를 입력해주세요.");
												$('#MPASSWORD').focus();
												return;
											} else if ($('#MPASSWORD').val() != $(
													'#passwordCheck').val()) {
												alert('패스워드가 다릅니다.');
												$('#passwordCheck').focus();
												return;
											} else if ($.trim($('#MEMAIL')
													.val()) == '') {
												alert("이메일 입력해주세요.");
												$('#MEMAIL').focus();
												return;
											} else if (!emailRegExp.test($(
													'#MEMAIL').val())) {
												alert("이메일형식에 맞추어 주세요.");
												$('#MEMAIL').focus();
												return;
											} else if ($.trim($('#MPHONE')
													.val()) == '') {
												alert("핸드폰 입력해주세요.");
												$('#MPHONE').focus();
												return;
											} else if (!phoneRegExp.test($(
													'#MPHONE').val())) {
												alert("핸드폰번호 형식에 맞추어주세요.");
												$('#MPHONE').focus();
												return;
											}

											if (emailx == false) {
												alert("이메일 중복체크를 해주세요.");
												return;
											}

											var deleteYN = confirm("수정하시겠습니까?");
											if (deleteYN == true) {
												$('#infoUpdate').submit();
												alert("수정되었습니다.")
											}
										});

						$('#emailCheck')
								.click(
										function() {
											$
													.ajax({
														url : "${pageContext.request.contextPath}/member/findIdEmailCheck",
														type : "POST",
														data : {
															"MEMAIL" : $(
																	'#MEMAIL')
																	.val()
														},
														success : function(data) {
															if (data == 0
																	&& $
																			.trim($(
																					'#MEMAIL')
																					.val()) != ''
																	&& emailRegExp
																			.test($(
																					'#MEMAIL')
																					.val())) {
																emailx = true;
																$('#MEMAIL')
																		.attr(
																				"readonly",
																				true);
																var html = "<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
																$('#msg')
																		.empty();
																$('#msg')
																		.append(
																				html);
															} else {

																var html = "<tr><td colspan='3' style='color: red'>사용불가능한 이메일 입니다.</td></tr>";
																$('#msg')
																		.empty();
																$('#msg')
																		.append(
																				html);
															}
														},
														error : function() {
															alert("서버에러");
														}
													});

										});

						$('#secession').click(function() {

							var deleteYN = confirm("회원 탈퇴를 하시겠습니까?");
							if (deleteYN == true) {

								alert("회원정보가 삭제되었습니다.")
							}

						});

					});
</script>

</html>