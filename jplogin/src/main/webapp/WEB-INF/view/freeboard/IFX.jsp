<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

</head>
<body>
	<form role="form" method="get">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.fbnumber}" /></td>
					<td><a
						href="${pageContext.request.contextPath}/freeboard/readView?fbnumber=${list.fbnumber}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
								value="${list.fbtitle}" /></a></td>
					<td><c:out value="${list.fbwriter}" /></td>
					<td><fmt:formatDate value="${list.fbregdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>

		</table>
	</form>
</body>
</html>