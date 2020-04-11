<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav" style="margin-right: auto;">
    <c:if test="${empty authInfo}">
    <li class="navl"><a class="nava" href="${pageContext.request.contextPath}/Notice/listUser" style="margin-left: 930px; font-size: 1.5rem">목록</a></li>	
	
	</c:if>

	<c:if test="${!empty authInfo and authInfo.division == 'A1' or authInfo.division == 'B1'}">
	<li class="navl"><a class="nava" href="${pageContext.request.contextPath}/Notice/listUser" style="margin-left: 930px; font-size: 1.5rem">목록</a></li>	
	
	</c:if>
	
	<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
	<li class="navl"><button type="button" class="update_btn btn btn-link" style="margin-left: 820px;font-size: 1.5rem;margin-top: 6px;">수정</button></li>	
	<li class="navl"><button type="button" class="delete_btn btn btn-link" style="background-color:#ccc; margin:5px 0 0 0; font-size: 1.5rem">삭제</button></li>
	<li class="navl"><a class="nava" href="${pageContext.request.contextPath}/Notice/listSys" style=" font-size: 1.5rem">목록</a></li>
	</c:if>
</ul>
