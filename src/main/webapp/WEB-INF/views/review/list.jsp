<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>List</title>
		<style>
			.main {
				padding-top: 180px;
				padding-left:30px;
			}
		</style>
	</head>
	<body>
		<div class="header">
			<jsp:include page="../../../header.jsp" />
		</div>
		<div class="main">
			<table border="1">
				<tr>
					<td>Review Code</td>
					<td>User ID</td>
					<td>Festival Code</td>
					<td>Review Title</td>
					<td>Review Content</td>
					<td>Review Image</td>
				</tr>
				<tr>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.review_id} <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.mem_id} <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.fsv_id} <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							<a href="one?review_id=${vo.review_id}">${vo.review_title}</a> <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.review_content} <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.review_image} <br>
						</c:forEach>
					</td>
				</tr>
	<%-- 			<c:forEach var="vo" items="${list}">
							${vo.review_id}, 
							<a href="one?review_id=${vo.review_id}">${vo.review_title}</a>, 
							${vo.review_content} <br>
						</c:forEach> --%>
			</table> <br>
			<a href="../review/review_insert.jsp">리뷰 등록하기</a> <br>
		</div>
	</body>
</html>