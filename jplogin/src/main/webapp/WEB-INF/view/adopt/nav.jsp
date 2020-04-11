<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav">
	<c:if test="${empty authInfo}">
	<li class="navl"><a href="${pageContext.request.contextPath}/adopt/listUser">목록</a></li>	
	<li class="navl"><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
	</c:if>
	
	<c:if test="${!empty authInfo}">
	<li class="navl"><a href="${pageContext.request.contextPath}/adopt/listSys">목록</a></li>	
	<li class="navl"><a href = "<c:url value="/member/logout"/>">로그아웃</a></li>
	</c:if>
</ul>

