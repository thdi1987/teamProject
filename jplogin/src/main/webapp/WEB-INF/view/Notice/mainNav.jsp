<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<div id="subheader">
			<div class="submenu">
				<h1 class ="logo">
					<a href="${pageContext.request.contextPath}/main"> <img
						src="../img/logo-side3.png"></a>
				</h1>
				<nav class="submain-menu">
					<ul class = "su">
						<li class="sub">
						<a href="<c:url value="/Notice/listUser"/>">공지사항</a>
						</li>

						<li class="sub">
						<a href="<c:url value="/animalinfo/petInfo"/>">동물정보</a>						
						</li>
						
						<li class="sub"><a href="<c:url value="/freeboard/list"/>">자유게시판</a></li>
						
						<li class="sub">
						<c:if test="${!empty authInfo}">
						<a href="<c:url value="/list"/>">분양게시판</a>
						</c:if>
						</li>
						
						<li class="sub"><a href="#">후기게시판</a></li>
						
						<li class="sub"><a href="<c:url value="/Service/listUser"/>">고객센터</a></li>
						
						<li class="sub">
						<c:if test="${!empty authInfo}">
						<a href="<c:url value="/message/list"/>">마이페이지</a>						
						</c:if>
						</li>
						
						<li class="sub">
						<c:if test="${!empty authInfo and authInfo.division == 'S1'}">
						<a href="<c:url value="/Notice/listSys"/>">관리자페이지</a>
						</c:if> 
						</li>
					</ul>
				</nav>
			</div>
		</div>