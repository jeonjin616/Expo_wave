<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박람웨이브</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/MD/mdAllstyle.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
   
</head>
<body>
<br>
<h1 style="font-size: 30px; margin-left: 300px"><b>MD's Pick</b></h1>
<h3 style="font-size: 16px; font-weight: normal; margin-left: 300px"">전문 MD가 추천해드리는 추천 정보!</h3>
	<div class="container">
		<div class="post-list">
			<c:forEach items="${mdpostall}" var="vo">
									<a href="MDDetail?id=${vo.MD_id}" style="text-decoration: none;">
			
				<div class="post">
					<div class="image">
						<br>
						<c:choose>
							<c:when test="${not empty vo.MD_post_Thumbnail}">
								<!-- 이미지가 있는 경우 -->
								<img
									src="${pageContext.request.contextPath}/resources/img/${vo.MD_post_Thumbnail}"
									alt="게시글 이미지2"
									style="max-width: 100px; max-height: 100px;">
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
					<p class="post-title">${vo.MD_title}</p>
						<c:set var="limitedContent"
							value="${fn:substring(vo.MD_content, 0, 130)}" />
						<c:choose>
							<c:when test="${fn:length(vo.MD_content) <= 130}">
								<p class="post-content">${vo.MD_content}</p>
							</c:when>
							<c:otherwise>
								<p class="post-content">${limitedContent}...</p>
							</c:otherwise>
						</c:choose>
						<span class="post-time">게시글 생성시간: ${vo.MD_create}</span><br>
						<c:if test="${vo.MD_modifi ne null}">
							<span class="post-time">게시글 수정시간: ${vo.MD_modifi}</span>
						</c:if>
						
					</div>
				</div>
				</a>
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
				<button class="button-class" style="color: #ffffff; height: 35px; width: 38px; margin: ; padding: 0; border: none; border-radius: 10%;"
        onclick="event.stopPropagation();"><%=p%>
</button>
			</a>
			

			<%
				}
			%>
		</div>
		<!-- 게시글 검색 -->
		<br> <br>
		<div style="text-align: center; display: flex; align-items: center; justify-content: center;">
  <form action="MDsearch" method="get">
    <div style="display: flex;">
      <input type="text" name="MDsearch" style="height: 40px;">
      <button class="button-class" style="width: 120px; height: 40px; margin-left: 10px; text-align: center;">
    <span>검색하기</span>
</button>
    </div>
  </form>
</div>

		<br>
		<!-- 게시글 추가 -->
 		<c:if test="${loginMember eq 'admin'}">
			<div>
				<form action="MDPostMakePage.jsp">
 					<button class="add-button" style="width: 180px; height: 40px; text-align: center; margin-left: 570px;">
					게시글 추가하기</button>
				</form>
			</div>
		</c:if>
	</div>
</body>
</html>