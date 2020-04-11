<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



 <ul>
<c:if test="${authInfo != null }">
	 <c:if test="${authInfo.division == 'A1' or authInfo.division == 'B1'}">
	<li>
 		<a href="${pageContext.request.contextPath}/Review/reviewIndex"><i class="fas fa-download fa-sm text-white-100"></i>글쓰기</a> <!-- 일반사용자 와 관리자 구분  -->
	</li> 
	</c:if>
</c:if>

</ul> 