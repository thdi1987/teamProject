<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav">
	
	<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
	<li class="navl"><a class="nava" href="${pageContext.request.contextPath}/Notice/writeView" style="margin-left: 900px; font-size: 1.5rem">글 작성</a></li>		
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