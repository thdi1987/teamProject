<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<script>
	$(document)
			.ready(
					function() {
						 $("#zoo").on("change",function() {
								var ch = $("#zoo option:selected").val()
								if (ch == "") {
									$("#zoo2").html("");
								}
								if (ch == "고양이") {
									$("#zoo2").html('');
									$("#zoo2").append('<option value=></option><option value="노르웨이숲">노르웨이숲</option><option value="데본렉스">데본렉스</option><option value="라가머핀">라가머핀</option><option value="라팜">라팜</option><option value="랙돌">랙돌</option><option value="러시안블루">러시안블루</option>');
									$("#zoo2").append("<option value='라이코이'>라이코이</option><option value='맹크스'>맹크스</option><option value='메인쿤'>메인쿤</option><option value='민스킨'>민스킨</option><option value='먼치킨(고양이)'>먼치킨(고양이)</option><option value='발리네즈'>발리네즈</option>");
									$("#zoo2").append("<option value='버만'>버만</option><option value='버미즈'>버미즈</option><option value='봄베이'>봄베이</option><option value='브리티시 쇼트헤어'>브리티시 쇼트헤어</option><option value='브리티시 롱 헤어'>브리티시 롱 헤어</option><option value='시베리아'>시베리아</option>");
									$("#zoo2").append("<option value='샴'>샴</option><option value='샤트룩스'>샤트룩스</option><option value='셀커크 렉스'>셀커크 렉스</option><option value='소말리'>소말리</option><option value='스코티시 폴드'>스코티시 폴드</option><option value='스핑크스'>스핑크스</option><option value='싱가퓨라'>싱가퓨라</option>");
									$("#zoo2").append("<option value='스노우슈'>스노우슈</option><option value='아메리칸 밥테일'>아메리칸 밥테일</option><option value='아메리칸 쇼트헤어'>아메리칸 쇼트헤어</option><option value='아메리칸 와이어헤어'>아메리칸 와이어헤어</option><option value='아메리칸 컬'>아메리칸 컬v</option><option value='아비시니아'>아비시니아</option>");
									$("#zoo2").append("<option value='오리엔탈'>오리엔탈</option><option value='오시캣'>오시캣</option><option value='유러피안버미즈'>유러피안버미즈</option><option value='이그저틱'>이그저틱</option><option value='이집션마우'>이집션마우</option><option value='엑조틱 쇼트헤어'>엑조틱 쇼트헤어</option>");

								}
								if (ch == "개") {
									$("#zoo2").html('');
									$("#zoo2").append("<option value=></option><option value='불독'>불독</option><option value='고든 세터'>고든 세터</option><option value='골든 리트리버'>골든 리트리버</option><option value='그레이트 데인'>그레이트 데인</option><option value='네오폴리탄 마스티프'>네오폴리탄 마스티프</option><option value='노르웨이안 부훈트'>노르웨이안 부훈트</option>");
									$("#zoo2").append("<option value='노르웨이 엘크 하운드'>노르웨이 엘크 하운드</option><option value='닥스훈트'>닥스훈트</option><option value='달마시안'>달마시안</option><option value='댄디 딘몬트 테리어'>댄디 딘몬트 테리어</option><option value='라사압소'>라사압소</option><option value='라포니안 허더'>라포니안 허더</option><option value='래브라도 레트리버'>래브라도 레트리버</option>");
									$("#zoo2").append("<option value='마스티프'>마스티프</option><option value='맨체스터 테리어'>'맨체스터 테리어</option><option value='몰티즈'>몰티즈</option><option value='바센지'>바센지</option><option value='바셋 하운드'>바셋 하운드</option><option value='버니즈 마운틴 도그'>버니즈 마운틴 도그</option><option value='사모예드'>사모예드</option><option value='살루키'>살루키</option><option value='삽살개'>삽살개</option><option value='아나톨리아 셰퍼드'>아나톨리아 셰퍼드</option><option value='아메리칸 스태퍼드셔 테리어'>아메리칸 스태퍼드셔 테리어</option>");
									$("#zoo2").append("<option value='아메리칸 아키다'>아메리칸 아키다</option><option value='자이언트 슈나우저'>자이언트 슈나우저</option><option value='재퍼니스 친'>재퍼니스 친</option><option value='저먼 셰퍼드'>저먼 셰퍼드</option><option value='차우차우'>차우차우</option><option value='차이니스 샤페이'>차이니스 샤페이</option><option value='차이니스 크레스티드'>차이니스 크레스티드</option><option value='카디건 웰시 코기'>카디건 웰시 코기</option><option value='카발리에 킹 찰스 스패니얼'>카발리에 킹 찰스 스패니얼</option><option value='컬리코티드 레트리버'>컬리코티드 레트리버</option>");
									$("#zoo2").append("<option value='토이 폭스 테리어'>토이 폭스 테리어</option><option value='티베탄 마스티프'>티베탄 마스티프</option><option value='티베탄 스패니얼'>티베탄 스패니얼</option><option value='파라오 하운드'>파라오 하운드</option><option value='파슨 러셀 테리어'>파슨 러셀 테리어</option><option value='파피용'>파피용</option><option value='해리어'>해리어</option><option value='허배너스'>허배너스</option><option value='휘핏'>휘핏</option>");		
								}
								if (ch == "기타") {
									$("#zoo2").html('');
									$("#zoo2").append("<option value=></option><option value='아르마딜로'>아르마딜로</option><option value='앵무새'>앵무새</option><option value='토끼'>토끼</option><option value='햄스터'>햄스터</option><option value='뱀'>뱀</option>");

								}

							});

						$("#insert")
								.on(
										"click",
										function() {
											window
													.open('${pageContext.request.contextPath}/ParcelOut/insert','_blank','width=900, height=700');

										});

						$("#info")
								.on(
										"click",
										function() {

											window
													.open("${pageContext.request.contextPath}/ParcelOut/info/");

										});

					});
</script>

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
					style="width: 1000px; height: 200px; margin: -20px 0 0 0;">
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
				<div class="Notice" style="padding-top: 30px;">
					<h1>분양게시판</h1>
				</div>
				<div style="background: #ccc; padding-left: 950px;">
					<%@include file="nav.jsp" %>
				</div>
				<form action="${pageContext.request.contextPath}/ParcelOut/ee">
					<table class="table table" style="width:1130px; height:100px; ">
						<tr>
							<td style="margin: 0 100px 0;">동물선택&nbsp;&nbsp;: <select id="zoo" name="zoo" style="width:150px">
									<option value=''></option>
									<option value="개" <c:out value="${zoo=='개'}"/>>개</option>
									<option value="고양이" <c:out value="${zoo=='고양이'}"/>>고양이</option>
									<option value="기타" <c:out value="${zoo=='기타'}"/>>기타</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							품종&nbsp;&nbsp;: <select id="zoo2" name="zoo2" style="width:150px">
									<option value=''></option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							크기&nbsp;&nbsp;: <select id="size" name="size" style="width:150px">
									<option value=''></option>
									<option value="대형">대형</option>
									<option value="중형">중형</option>
									<option value="소형">소형</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							중성화&nbsp;&nbsp;: <select id="netural" name="netural" style="width:150px">
									<option value=''></option>
									<option value="Y">예</option>
									<option value="N">아니요</option>
							</select>
							</td>
						</tr>

						<tr>
							<td>지역선택&nbsp;&nbsp;: <select id="location" name="location" style="width:150px">
									<option value=''></option>
									<option value="전국">전국</option>
									<option value="서울">서울</option>
									<option value="부산">부산</option>
									<option value="대구">대구</option>
									<option value="인천">인천</option>
									<option value="광주">광주</option>
									<option value="대전">대전</option>
									<option value="울산">울산</option>
									<option value="경기도">경기도</option>
									<option value="강원도">강원도</option>
									<option value="충청남도">충청남도</option>
									<option value="충청북도">충청북도</option>
									<option value="전라북도">전라북도</option>
									<option value="전라남도">전라남도</option>
									<option value="경상북도">경상북도</option>
									<option value="경상남도">경상남도</option>
									<option value="제주도">제주도</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							책임비&nbsp;&nbsp;:  <select id="charge" name="charge" style="width:150px">
									<option value=''></option>
									<option value="무료">무료</option>
									<option value="10만">1~10만</option>
									<option value="20만">11~20만</option>
									<option value="21만">21만이상</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                 성별&nbsp;&nbsp;:  <select id="gender" name="gender" style="width:150px">
									<option value=''></option>
									<option value="남아">남아</option>
									<option value="여아">여아</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					        <input type="submit" value="검 색" id="seach" style="width:150px"></td>
						</tr>
					</table>
				</form>
				<table class="table table-hover" style="margin:-25px 0 0 0">
					<tr>
						<th>번호</th>
						<th>사진</th>
						<th>제목</th>
						<th>동물</th>
						<th>품종</th>
						<th>크기</th>
						<th>지역</th>
						<th>책임비</th>
						<th>성별</th>
					</tr>

					<c:forEach var="board" items="${boardList2}" varStatus="loop">

						<tr>
							<td>${board.MPNO}</td>
							<td><a href=#
								onclick="window.open('${pageContext.request.contextPath}/ParcelOut/info/${board.MPNO}','_blank','width=800px,height=800px,toolbars=no' )">
								<img src="<c:url value="/upload/${board.PFILENAME}"/>" width="130px"
									height="130px" /></a></td>
							<%-- <c:url value="/upload/ --%>
							<td><a href="#" onclick="window.open('${pageContext.request.contextPath}/ParcelOut/info/${board.MPNO}','_blank','width=800px,height=800px,toolbars=no' )">${board.MPTITLE}</a></td>
							<td>${board.MPDIVISION}</td>
							<td>${board.MPKIND}</td>
							<td>${board.MPSIZE}</td>
							<td>${board.MPLOCATION}</td>
							<td>${board.MPDEPOSIT}</td>
							<td>${board.MPGENDER}</td>
						</tr>
					</c:forEach>


				</table>
				<div class="col-md-offset-3">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
								<li><a
									href="/ParcelOut/listSys${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>
							<c:if
								test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
								<li><a
									href="${pageContext.request.contextPath}/ParcelOut/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="/ParcelOut/listSys${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:if>
							<c:if
								test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a
									href="${pageContext.request.contextPath}/ParcelOut/list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:if>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
								<li><a
									href="/ParcelOut/listSys${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
							<c:if
								test="${empty authInfo or !empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
								<li><a
									href="${pageContext.request.contextPath}/ParcelOut/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</c:if>
					</ul>
				</div>
			</section>
		</div>
	</div>

</body>
</html>



