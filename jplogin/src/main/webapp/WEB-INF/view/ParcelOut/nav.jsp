<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav">
	<c:if test="${empty authInfo}">
		<li class="navl"><a class="nava"
			href="${pageContext.request.contextPath}/member/login">로그인</a></li>
	</c:if>

	<c:if
		test="${!empty authInfo and authInfo.division == 'A1' or authInfo.division == 'B1'}">
		<li class="navl"><a class="nava"
			onclick="window.open('${pageContext.request.contextPath}/ParcelOut/insert','_blank','width=900, height=700')">등록하기</a>
		<li class="navl"><a class="nava"
			href="<c:url value="/member/logout"/>">로그아웃</a></li>
	</c:if>

	<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
		<li class="navl"><a class="nava"
			onclick="window.open('${pageContext.request.contextPath}/ParcelOut/insert','_blank','width=900, height=700')">등록하기</a>
        <li class="navl"><a class="nava"
			href="<c:url value="/member/logout"/>">로그아웃</a></li>	
	</c:if>
</ul>
