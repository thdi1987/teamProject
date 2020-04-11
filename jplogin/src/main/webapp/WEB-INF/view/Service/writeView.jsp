<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub8.css">
	<!--  부트 스트랩 적용 위치 -->

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 부트 스트랩 적용 위치 -->


	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>자주하는 질문</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${pageContext.request.contextPath}/Service/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("SCTITLE"));
					return true;
				}
			}
		}
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
						<li class="sub">
						<a href="<c:url value="/Notice/listUser"/>">공지사항</a>
						</li>

						<li class="sub">
						<a href="<c:url value="/animalinfo/petInfo"/>">동물정보</a>						
						</li>
						
						<li class="sub"><a href="<c:url value="/freeboard/list"/>">자유게시판</a></li>
						
						<li class="sub">
						<c:if test="${!empty authInfo}">
						<a href="<c:url value="/ParcelOut/list"/>">분양게시판</a>
						</c:if>
						</li>
						
						<li class="sub"><a href="<c:url value="/Review/home"/>">후기게시판</a></li>
						
						<li class="sub"><a href="<c:url value="/Service/listUser"/>">고객센터</a></li>
						
						<li class="sub">
						<c:if test="${!empty authInfo and authInfo.division == 'A1' or !empty authInfo and authInfo.division == 'B1'}">
						<a href="<c:url value="/message/list"/>">마이페이지</a>						
						</c:if>
						</li>
						
						<li class="sub">
						<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
						<a href="<c:url value="/Notice/listSys"/>">관리자페이지</a>
						</c:if> 
						</li>
					</ul>
				</nav>
			</div>
		</div>

       <div class="container">
			<section id="container">
			<div class="Notice">
					<h1>고객센터</h1>
				</div>
		<div>
		  	<%@include file="rav2.jsp" %>
		</div>
			<form name="writeForm" method="post" action="${pageContext.request.contextPath}/Service/write">
				
				<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<tbody>
							<tr>
								<td>글 제목</td>
								<td colspan="3" style="border-left: 1px solid black;"><input type="text"
									id="SCTITLE" name="SCTITLE" class="chk" title="제목을 입력하세요" required="required" style=" float:left; width:1000px; height: 50px; margin: 0 0 0 23px; border-radius: 1rem;" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3"
									style="height: 600px; text-align: left; border-left: 1px solid black;"> <textarea
										id="SCCONTENTS" name="SCCONTENTS" class="chk" title="내용을 입력하세요" required="required" style=" float:left; width:1000px; height: 600px; border-radius: 1rem; margin: 0 0 0 23px;"></textarea></td>
							</tr>
						</tbody>
					
				</table>
				<div>
						<button type="submit" class="write">작성</button>
						<button type="button" class="cancel"
							onclick="location.href='${pageContext.request.contextPath}/Service/list">취소</button>
					</div>
			</form>
		</section>
		</div>
	</div>
</body>
</html>