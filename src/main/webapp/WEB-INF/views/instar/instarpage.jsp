<%@page import="javax.smartcardio.Card"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/header.jsp" %>
	
<html>

<head>
<meta charset="UTF-8">
<title>Instagram Crawler</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/Instar/instarStyle.css">
</head>

</head>
<body>
<br>
<div style="font-size: 28px; font-weight: bold; margin-left: 450px;">전체 게시글</div>
<div style="text-align: center;">
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
					<br>${card.caption}<br>
				</div>
			</a>

			<%-- 한 줄에 3개씩 카드를 출력하도록 배치 --%>
			<c:if test="${loop.index % 3 == 2 || loop.last}">
				</div>
			</c:if>
		</c:if>
	</c:forEach>
	</div>
	  <script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
	<script
		src="${pageContext.request.contextPath}/resources/js/instar/infinityScroll.js"></script>

</body>
</html>
