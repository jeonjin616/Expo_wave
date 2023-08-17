<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박람웨이브</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/MD/mdAllstyle.css">
</head>
<body>
<header>
</header>
	<form action="MDAll" method="get">
	   <button><h1>박람웨이브1</h1></button> 
	</form>
<div class="container">
    <hr>
    <div class="post-list">
        <c:forEach items="${mdpostall}" var="dto">
            <div class="post">
                <div class="image">
                    <img src="${pageContext.request.contextPath}/resources/upload/${dto.MD_post_Thumbnail}" alt="게시글 이미지">
                </div>
                <div class="post-details">
                    <a href="MDDetail?id=${dto.MD_id}"><p class="post-title">${dto.MD_title}</p></a>
                    <p class="post-content">${dto.MD_content}</p>
                    <p class="post-time">게시	글 생성시간: ${dto.MD_create}</p>
                    <c:if test="${dto.MD_modifi ne '0000-00-00 00:00:00'}">
                        <p class="post-time">게시글 수정시간: ${dto.MD_modifi}</p>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="add-button">
        <form action="MDPostMakePage.jsp">
            <button>게시글 추가하기</button>
        </form>
    </div>
</div>
</body>
</html>