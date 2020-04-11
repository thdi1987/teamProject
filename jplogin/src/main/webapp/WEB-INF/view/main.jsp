<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="author" content="JP_Joker">
<meta name="descripton" content="이 사이트는 프로젝트용으로 만들어졌습니다.">
<meta name="keywords"
	content="강아지, 고양이, 동물입양, 동물분양, 반려동물분양, 반려동물입양, 프로젝트">
<meta name="generator" content="brakets">
<title>Safety Pet</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrapNav.css" rel="stylesheet">
<link href="css/main3.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="csstest/modern-business.css" rel="stylesheet">

<script src="csstest/jquery.js"></script>
<script src="csstest/bootstrap.bundle.js"></script>
<script src="csstest/fullclip.js"></script>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<script src="csstest/jquery-slideshow.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('.slide')
								.backgroundSlideshow(
										{
											onBeforeTransition : function(index) {
												console.log(
														"before transition",
														index)
											},
											onAfterTransition : function(index) {
												console.log("after transition",
														index)
											},
											images : [
													"${pageContext.request.contextPath}/img/main/dog1.jpg",
													"${pageContext.request.contextPath}/img/main/cat2.jpg",
													"${pageContext.request.contextPath}/img/main/dog2.jpg",
													"${pageContext.request.contextPath}/img/main/cat3.jpg",
													"${pageContext.request.contextPath}/img/main/dog3.jpg" ],
											transitionDuration : 3000,
										});
					})
</script>

<style type="text/css">
.slide {
	height: 700px;
}
</style>

</head>

<body>

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

	<header>
		<div class="slide"></div>

	</header>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4" style="color: purple;">Safety Pet에 오신걸 환영합니다.</h1>
		<div class="row">

			<!-- Marketing Icons Section -->
			<iframe width="730" height="530"
				src="https://www.youtube.com/embed/5839mlcLLbQ " frameborder="0"
				allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				allowfullscreen></iframe>

			<div class="col-lg-4 mb-4">
				<div class="card"
					style="overflow: hidden; height: 250px; width: 450px">
					<div class="card-body"
						style="overflow: hidden; height: 250px; width: 450px">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<!-- Slide One - Set the background image for this slide in the line below -->
								<a class="carousel-item active" href="http://www.catpang.com"><img
									src="img/쇼핑몰1.PNG"></a> <a class="carousel-item"
									href="https://mall.holapet.com"><img src="img/쇼핑몰3.PNG"></a>
								<a class="carousel-item" href="http://dingdonge.com"><img
									src="img/쇼핑몰5.PNG"></a> <a class="carousel-item"
									href="http://mambone.com"><img src="img/쇼핑몰7.PNG"></a> <a
									class="carousel-item" href="https://yomistore.com"><img
									src="img/쇼핑몰9.PNG"></a>



							</div>
							<div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>

				</div>
				<div class="card"
					style="overflow: hidden; height: 250px; width: 450px; margin-top:30px;">
					<div class="card-body"
						style="overflow: hidden; height: 250px; width: 450px">
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<!-- Slide One - Set the background image for this slide in the line below -->
								<a class="carousel-item active" href="http://dogmoa.co.kr"><img
									src="img/쇼핑몰2.PNG"></a> <a class="carousel-item"
									href="https://www.ddakpet.com"><img src="img/쇼핑몰4.PNG"></a>
								<a class="carousel-item" href="http://www.petbox.kr"><img
									src="img/쇼핑몰6.PNG"></a> <a class="carousel-item"
									href="http://store.bom.co.kr"><img src="img/쇼핑몰8.PNG"></a> <a
									class="carousel-item" href="http://www.petior.co.kr"><img
									src="img/쇼핑몰10.PNG"></a>



							</div>
							<div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" role="button"
									data-slide="prev"> <span class="carousel-control-prev-icon"
									aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next"
									href="#carouselExampleIndicators" role="button"
									data-slide="next"> <span class="carousel-control-next-icon"
									aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Section -->



	</div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">自 捕 資 期<br/>
			팀장:황정선 팀원:강병진,김영규,황준<br> Copyright © 2019-2020 by KH Project
				Team jp
			</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->


</body>
<%-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <a class="carousel-item active" href="<c:url value="main"/>"  style="background-image: url('${pageContext.request.contextPath}/img/main/dog1.jpg');height: 700px;"></a>
        <a class="carousel-item" href="<c:url value="main"/>"  style="background-image: url('${pageContext.request.contextPath}/img/main/cat2.jpg');height: 700px;"></a> 
        <a class="carousel-item" href="<c:url value="main"/>"  style="background-image: url('${pageContext.request.contextPath}/img/main/dog2.jpg');height: 700px;"></a>
        <a class="carousel-item" href="<c:url value="main"/>"  style="background-image: url('${pageContext.request.contextPath}/img/main/cat3.jpg');height: 700px;"></a>  
        <a class="carousel-item" href="<c:url value="main"/>"  style="background-image: url('${pageContext.request.contextPath}/img/main/dog3.jpg');height: 700px;"></a> 
         
        
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div> --%>

</html>