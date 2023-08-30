<%@page import="javax.smartcardio.Card"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Instagram Crawler</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/Instar/instarStyle.css">
</head>

</head>
<body>
	<h1>Instagram Posts</h1>

	<%-- card 모델을 가져와서 반복하는 반복문 --%>
	<c:forEach items="${card}" var="card" varStatus="loop">
		<c:if test="${loop.index < 9}">
			<%-- 한 줄에 3개씩 카드를 출력하도록 배치 --%>
			<c:if test="${loop.index % 3 == 0}">
				<div class="card-row">
			</c:if>

			<a href="${card.permalink}">
				<div class="card-news">
					<img src="${card.media_url}" alt="이미지" style="max-height: 300px;"><br>
					<br> 작성자 = ${card.username}<br>
				</div>
			</a>

			<%-- 한 줄에 3개씩 카드를 출력하도록 배치 --%>
			<c:if test="${loop.index % 3 == 2 || loop.last}">
				</div>
			</c:if>
		</c:if>
	</c:forEach>
	  <script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
	<script
		src="${pageContext.request.contextPath}/resources/js/instar/infinityScroll.js"></script>

</body>
</html>
