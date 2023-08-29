<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>One</title>
</head>
	<style>
		.main {
			padding-top: 180px;
			padding-left:30px;
		}
	</style>
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
				<td>${one.review_id}</td>
				<td>${one.mem_id}</td>
				<td>${one.fsv_id}</td>
				<td>${one.review_title}</td>
				<td>${one.review_content}</td>
				<td>${one.review_image}</td>
			</tr>
		</table> <br>
		<a href="review_update.jsp?review_id=${one.review_id}
		&review_title=${one.review_title}
		&review_content=${one.review_content}">수정</a>
	</div>
</body>
</html>