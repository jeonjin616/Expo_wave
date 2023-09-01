<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박람웨이브</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/MD/mdAllstyle.css">
</head>
<body>

	<div class="container">
		<div class="post-list">
			<c:forEach items="${mdpostall}" var="vo">
				<div class="post">
					<div class="image">
						<br>
						<c:choose>
							<c:when test="${not empty vo.MD_post_Thumbnail}">
								<!-- 이미지가 있는 경우 -->
								<img
									src="${pageContext.request.contextPath}/resources/img/${vo.MD_post_Thumbnail}"
									alt="게시글 이미지2">
							</c:when>
							<c:otherwise>
								<!-- 이미지가 없는 경우 -->
								<img
									src="${pageContext.request.contextPath}/resources/img/logo.png"
									alt="로고 이미지">
							</c:otherwise>
						</c:choose>


						<!--  <img src="${pageContext.request.contextPath}/resources/img/${vo.MD_post_Thumbnail}" alt="게시글 이미지2">
                -->
					</div>
					<div class="post-details">
						<a href="MDDetail?id=${vo.MD_id}"><p class="post-title">${vo.MD_title}</p></a>
						<p class="post-content">${vo.MD_content}</p>
						<p class="post-time">게시글 생성시간: ${vo.MD_create}</p>
						<c:if test="${vo.MD_modifi ne null}">
							<p class="post-time">게시글 수정시간: ${vo.MD_modifi}</p>
						</c:if>
					</div>
				</div>
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
			<a href="MDAll?page= <%=p%>">
				<button
					style="background: #ffffff; color: #000000; height: 30px; width: 30px; margin: 0; padding: 0;"
					onclick="event.stopPropagation();"><%=p%>
				</button>
			</a>

			<%
				}
			%>
		</div>
		<!-- 게시글 검색 -->
		<form action="MDsearch" method="get">
			<input type="text" name="MDsearch">
			<button>
				<h1>검색하기</h1>
			</button>
		</form>

		<!-- 게시글 추가 -->
		<c:if test="${loginMember eq 'admin'}">
		<div class="add-button">
			<form action="MDPostMakePage.jsp">
				<button>게시글 추가하기</button>
			</form>
		</div>
		</c:if>
	</div>
</body>
</html>