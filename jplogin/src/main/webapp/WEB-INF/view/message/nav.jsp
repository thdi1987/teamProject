<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/nav.css">
<ul class="nav">

	<c:if
		test="${!empty authInfo and authInfo.division == 'A1' or authInfo.division == 'B1'}">
		<li class="navl"><a class="nava"
			href="<c:url value="/member/logout"/>">로그아웃</a></li>
		<li class="navl" ><a onclick="window.open('${pageContext.request.contextPath}/message/writerViewMypage','_blank','width=800px,height=800px,toolbars=no' )" >쪽지작성</a></li>
		
	</c:if>
	

</ul>