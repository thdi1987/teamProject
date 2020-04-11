<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

	<div id = "s_left" style="width : 200px;, height: 700px;, float:left ">
	<c:if test="${!empty authInfo}">	
	<a href = "<c:url value="/member/passwordCheck"/>">개인정보수정</a><br/><br/>
	<a href = "<c:url value="/MyPage/info"/>">회원정보</a><br/><br/>
	<c:if test="${!empty authInfo and authInfo.division == 'A1'}">	
	<a href = "<c:url value="/Buyer/writeView"/>">분양자등록</a><br/><br/>
	</c:if>
	<c:if test="${!empty authInfo and authInfo.division == 'A1'}">	
	<a href = "<c:url value="/adopt/listUser"/>">입양목록</a><br/><br/>
	</c:if>
	</c:if>
	</div>

</body>
</html>