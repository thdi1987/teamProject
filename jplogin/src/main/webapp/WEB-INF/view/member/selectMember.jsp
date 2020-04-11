<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub17.css">
<!--CSS STYLE -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/login.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>

<script src="//code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script src="../js/jquery-background-slideshow.js"></script>

<script>
	$(document).ready(
			function() {
				$('body').backgroundSlideshow(
						{
							onBeforeTransition : function(index) {
								console.log("before transition", index)
							},
							onAfterTransition : function(index) {
								console.log("after transition", index)
							},
							images : [ "../img/dog1.jpg", "../img/cat2.jpg",
									"../img/dog3.jpg" ],
							transitionDuration : 3000,
						});
			})
</script>
</head>
<body style="position: relative; height: 1000px;  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);">
    
   <div id="memberTrim">
    <div class="MTR">
     <div class="MTRA">
      <ul id="MTRAR">
	<button class="btn1 btn-outline-info" onclick="location.href='${pageContext.request.contextPath}/member/writeNormal'">일반회원</button>
	<button class="btn2 btn-outline-info" onclick="location.href='${pageContext.request.contextPath}/member/writeParcelOut'">분양회원</button>
	  </ul>
	  </div>
	 </div>
	</div>
   
</body>
</html>