<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물정보</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub26.css">

<!--  합쳐지고 최소화된 최신 CSS -->
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

<!-- 부트 스트랩 적용 위치 -->

<style type="text/css">
#petinfo {
	background: white;
	height: 100rem;
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
}

.petin {
	background: white;
	height: 100rem;
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
}

.petin .petinn {
	border-left: 1px solid black;
	border-right: 1px solid black;
	width: 1700px;
	height: 100rem;
	margin: 0 auto;
}

.petin .petinn .petinner {
	width: 1000px;
	height: 100rem;
	margin: 0 0 0 5rem;
	
}


.petin .petinn .petinner .petim .petimimg{
    margin: 25rem 0 0 0;
	width: 500px;
	height: 50rem;
	
}

</style>
</head>
<body>
	<div id="wrap">

			<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark fixed-top"
		style="background-color: whitesmoke; height:106px;">
		<div class="container"
			style="margin-left: 50px; width: 480px;">
			<a class="navbar-brand" href="<c:url value="/main"/>"
				style="margin-right: 50px; margin-top: -30; height: 86.25px;"><img
				src="<c:url value="/img/logo-side3.png"/>"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive"
				style="width: 1000px; height:200px; margin-bottom:15px; margin-top: -30;">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Notice/listUser"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/animalinfo/petInfo"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">동물정보</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/freeboard/list"/>"
						style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">자유게시판</a>
					</li>
					<c:if test="${!empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/ParcelOut/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">분양게시판</a>
						</li>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Review/home"/>"
						style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">후기게시판</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/Service/listUser"/>"
						style="height: 41px; width: 94px; padding-left: 15px; padding-right: 15px; font-size:16px;">고객센터</a>
					</li>
					<c:if
						test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/message/list"/>"
							style="height: 41px; width: 110px; padding-left: 15px; padding-right: 15px; font-size:16px;">마이페이지</a>
						</li>
					</c:if>
					<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/Notice/listSys"/>"
							style="height: 41px; width: 126px; padding-left: 15px; padding-right: 15px; font-size:16px;">관리자페이지</a>
						</li>
					</c:if>
					<c:if test="${!empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/message/list"/>"
							style="height: 41px;width: 180px;padding-left: 15px;padding-right: 15px;text-align: right;margin-left: 335px; font-size:16px;">${authInfo.id}</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/logout"/>"
							style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size:16px;">로그아웃</a>
						</li>
					</c:if>
					<c:if test="${empty authInfo}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/login"/>"
							style="height: 41px; width: 730px; padding-left: 15px; padding-right: 15px; text-align: right; font-size:16px;">로그인</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/member/agreement"/>"
							style="height: 41px; width: 96px; padding-left: 15px; padding-right: 15px; font-size:16px;">회원가입</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
		<div id="petinfo">
			<div class="petin">
				<ul class="petinn"  style="padding-top: 80px;">
					<ins class="petinner">
						<a class="petim"
							href="${pageContext.request.contextPath}/animalInfo/dog">
							<img class="petimimg" src="<c:url value="/infoImg/dogs.jpg"/>"></a>
					</ins>
					<ins class="petinner">
						<a class="petim"
							href="${pageContext.request.contextPath}/animalInfo/cat"><img class="petimimg" 
							src="<c:url value="/infoImg/cats.jpg"/>"></a>
					</ins>
					<ins class="petinner">
						<a class="petim"
							href="${pageContext.request.contextPath}/animalInfo/etcpet"><img class="petimimg" 
							src="<c:url value="/infoImg/etc.jpg"/>"></a>
					</ins>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>