<%@page import="javax.smartcardio.Card"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:include page="/header.jsp" />
	
<html>
<!-- jsp 부분코드가 포함되는데 include로 하니까 jsp가 java로 바뀌기 전에 
include 다 가져오고 바꿔주는 방식 -> 기존방식 (스크립트가 하단에 있을경우 종종 나타날수도있다!)
jsp:include 방식을 활용해 jsp,java를 각각 컴파일한뒤  java전체 로드한뒤 jsp를 붙이는 방식
-->



<head>
<meta charset="UTF-8">
<title>Instagram Crawler</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/Instar/instarStyle.css">
</head>

</head>
<body>

<br>
<div style="font-size: 28px; font-weight: bold; margin-left: 480px;">전체 게시글</div>
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
					<br><b>${card.caption}</b><br>			
					</a>
				</div>
			
			<%-- 한 줄에 3개씩 카드를 출력하도록 배치 --%>
			<c:if test="${loop.index % 3 == 2 || loop.last}">
				</div>
			</c:if>
		</c:if>
	</c:forEach>
	</div>
	<%
			Integer pagesWrapper = (Integer) request.getAttribute("pages");
			int pages = (pagesWrapper != null) ? pagesWrapper.intValue() : 0;
		%>
		<div style="display: flex; justify-content: center;">
			<%
				for (int p = 1; p <= pages; p++) {
			%>
			<a href="instarpage?page= <%=p%>">
				<button
					class="add-button" color: #ffffff; 
					onclick="event.stopPropagation();"><%=p%>
				</button>
			</a>

			<%
				}
			%>
</div>
			<br>
<br>

	  <script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    
	<script
		src="${pageContext.request.contextPath}/resources/js/instar/infinityScroll.js"></script>

</body>
</html>
