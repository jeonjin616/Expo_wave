<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.multi.wave.review.ReviewVO" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" th:href="@{/css/style.css}" />
<title>One</title>
</head>
<style>
	#header {
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
	.main {
		margin-left: 165px;
		margin-right: 155px;
		margin-top: 20px;
		margin-bottom: 100px;
	}
	
	hr {
		background-color: #8AAAE5;
		height: 5px; /* 굵기 조절 */
		border: 0px; /* 테두리 없애기 */
		margin-bottom: 25px;
	}
	
	table {
		width: 1190px;
		border: 1px solid black;
		padding-top: 10px;
		border-collapse: collapse;
	}

  table, th, td {
    border: 1px solid black;
  }
  
  table.container th, table.container td {
    text-align: center;       /* 가로 가운데 정렬 */
    vertical-align: middle;   /* 세로 가운데 정렬 */
    padding-top: 10px;
    padding-bottom: 10px;
  }
	
	a {
		color: black; /* 링크 색상을 검정으로 설정 */
		text-decoration: none; /* 밑줄 제거 */
	}
	
	.button{
		float: right;
	}
	
</style>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
		$(function() {
			//alert("dom tree 메모리에 로딩됨.")
			$('#b1').click(function() {
				$.ajax({
					url: "delete",
					data: {
						review_id : '${one.review_id}'
					},
					success: function(views_result) {
						alert(views_result)
						window.location.href="list";
					},
					error: function() {
						alert("실패!")
					}//error
				})
			}) //b1
		}) //$
	</script>
<body>
	<div id="header">
		<jsp:include page="../../../header.jsp" />
	</div>
	<div class="main">
		<h2>게시글 상세보기</h2>
		<hr>
		<div class="button" style="margin-bottom: 10px;">
		<% ReviewVO one = (ReviewVO)request.getAttribute("one");
		String loginMember = (String) session.getAttribute("loginMember");
		if (loginMember != null && (loginMember.equals("admin") || loginMember.equals(one.getMem_id()))) { %>
			<button>
				<a href="review_update.jsp?review_id=${one.review_id}
				&review_title=${one.review_title}
				&review_content=${one.review_content}&review_image=${one.review_image}">수정</a>
			</button>
			<input id="b1" type="button" value="삭제">
		<% } %>
		</div>
		<br>
		<table class="container">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">행사</th>
					<td>${one.event_name}</td>
					<th scope="row">작성자</th>
					<td>${one.mem_id}</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${one.review_title}</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text" style="height: 300px;">${one.review_content}</td>
				</tr>
				<tr>
					<td colspan="4" style="height: 200px;">
						<img src="${pageContext.request.contextPath}/resources/upload/${one.review_image}" id="preview" src="#" style="max-width: 200px; max-height: 200px; align-content: flex-end;">
						</td>
				</tr>
			</tbody>
		</table>
		<br>
		<button style="float: right;">
			<a href="list">목록으로 돌아가기</a>
		</button>
	</div>
</body>
</html>