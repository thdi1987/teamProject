<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav">
	<c:if test="${empty authInfo}">	
	<li class="navl"><a class="nava" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
	</c:if>
	
	<c:if test="${!empty authInfo and authInfo.division == 'A1' or authInfo.division == 'B1'}">
	<li class="navl"><a class="nava" href = "<c:url value="/member/logout"/>">로그아웃</a></li>
	<li class="navl"><a class="nava" href="${pageContext.request.contextPath}/Quest/listUser">목록</a></li>	
	</c:if>
	
	<c:if test="${!empty authInfo and authInfo.division == 'S1'}">	
	<li class="navl"><a class="nava" href = "<c:url value="/member/logout"/>">로그아웃</a></li>
	<li class="navl"><a class="nava" href="${pageContext.request.contextPath}/Quest/listSys">목록</a></li>
	<li class="navl"><button type="button" id = "delete_btn btn btn-link" class="delete_btn btn btn-link" style="
    width: 71px;
    padding-top: 0px;
    padding-right: 0px;
    padding-left: 0px;
    padding-bottom: 11px;
">삭제</button></li>
	</c:if>
</ul>

<!-- 
<div>
	<div>
		<a href="/board/list">목록</a>
		<a href="/board/writeView">글 작성</a>
	</div>
</div>
-->