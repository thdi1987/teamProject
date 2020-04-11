<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav">	
	<c:if test="${!empty authInfo and authInfo.division == 'S1'}">	
	<li class="navl"><a class="nava" href = "<c:url value="/member/logout"/>">로그아웃</a></li>
	</c:if>
</ul>
