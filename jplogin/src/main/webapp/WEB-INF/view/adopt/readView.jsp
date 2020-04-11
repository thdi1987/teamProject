<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>입양신청내역</title>
	</head>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");			
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "${pageContext.request.contextPath}/adopt/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			$(".deleteUser_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "${pageContext.request.contextPath}/adopt/deleteUser");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".listUser_btn").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/adopt/listUser?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})	
			$(".list_btnSys").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/adopt/listSys?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})		
			
		})
	</script>
	
	<body>
		<div class="container">
			<header>
				<h1 style="text-align:center;"> 입양신청내역</h1>
			</header>
			<hr />
						
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="AANO" name="AANO" value="${read.AANO}" />					
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
				
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<input type="text" id="AATITLE" name="AATITLE" class="form-control" value="${read.AATITLE}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">입양자ID</label>
					<input type="text" id="AAID" name="AAID" class="form-control" value="${read.AAID}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="AACONTENTS" name="AACONTENTS" class="form-control" readonly="readonly" style="width:100%; height:400px; resize: none; "><c:out value="${read.AACONTENTS}" /></textarea>
				</div>
											
				<div style="text-align:center;">
					<c:if test="${!empty authInfo and authInfo.division == 'S1'}">				
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
					</c:if>
					<c:if test="${!empty authInfo and authInfo.division == 'A1'}">				
					<button type="button" class="deleteUser_btn btn btn-danger">삭제</button>
					<button type="button" class="listUser_btn btn btn-primary">목록</button>	
					</c:if>
				</div>				
					
			</section>
			<hr />
		</div>
	</body>
</html>			
			