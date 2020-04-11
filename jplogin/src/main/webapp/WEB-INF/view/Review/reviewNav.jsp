<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
<c:if test="${authInfo != null }">
	<li>
		<a href="${pageContext.request.contextPath}/Review/home">후기게시판</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
	</li>
</c:if>
</ul>