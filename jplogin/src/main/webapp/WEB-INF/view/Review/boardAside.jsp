<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h3 style="padding-top: 20px;">카테고리</h3>

<ul>
	<li><a href="${pageContext.request.contextPath}/Review/boardList?c=100&l=1">동물</a>
		<ul class="low">
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=101&l=2">소형견</a></li>
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=102&l=2">중형견</a></li>
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=103&l=2">대형견</a></li>
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=104&l=2">소형묘</a></li>
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=105&l=2">중형묘</a></li>
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=106&l=2">대형묘</a></li>
		<li><a href="${pageContext.request.contextPath}/Review/boardList?c=107&l=2">기타</a></li>
		</ul>
	</li>
	<li><a href="${pageContext.request.contextPath}/Review/boardList?c=200&l=1">기타</a></li>
</ul>