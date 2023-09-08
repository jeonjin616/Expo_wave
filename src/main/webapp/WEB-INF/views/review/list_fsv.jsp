<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>List Festival</title>
<link rel="stylesheet" th:href="@{/css/style.css}" />
<style>
	#header {
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
	h2 {
		margin-bottom: 10px;
	}
	
	.main {
		padding-top: 20px;
		padding-left: 30px;
	}
	
	.container {
		margin-left: 165px;
		margin-right: 155px;
		margin-top: 20px;
		margin-bottom: 100px;
	}
	
	hr {
		background-color: #8AAAE5;
		height: 5px; /* 굵기 조절 */
		border: 0px; /* 테두리 없애기 */
	}
	
	.fsv_show {
		padding-top: 10px;
	}
	
	.review_insert {
		padding-bottom: 10px;
	}
	
	td {
		text-align: center;
	}
	
	tbody {
		padding-top: 10px;
	}
	
	#review_insert {
		text-align: right;
	}
	
	/* 테이블의 바깥 테두리를 추가 */
	.board_list {
		border-collapse: collapse; /* 테이블 테두리를 하나로 만들어줌 */
		border: 1px solid black !important; /* 얇은 테두리 설정 */
		border: none;
		table-layout: fixed;
	}
	
	/* 테이블의 각 셀의 테두리 제거 */
	.board_list td, .board_list th {
		border: none;
	}
	
	/* thead의 바깥쪽 테두리 추가 */
	.board_list thead {
		border-bottom: 1px solid black !important;
	}
	
	/* 마지막 셀의 왼쪽, 오른쪽 테두리 제거 */
	/* thead의 각 셀의 세로 크기를 5px 늘림 */
	.board_list thead th {
		padding-top: 15px; /* 위쪽 패딩 5px 추가 */
		padding-bottom: 15px; /* 아래쪽 패딩 5px 추가 */
    border-left: none;
    border-right: none;
	}
	
	/* 마지막 셀의 왼쪽, 오른쪽 테두리 제거 */
	/* tbody의 각 셀에 위아래 여백 3px 적용 */
	.board_list tbody td {
		padding-top: 10px;
		padding-bottom: 10px;
    border-top: 1px solid lightgray;
	}
	
	.board_list tbody td {
	    border-right: 0;
	    border-left: 0;
	}

	/* tbody의 각 td 요소에 위쪽 경계선 추가 */
	.board_list tbody td {
	    border-top: 1px solid lightgray;
	}
	
	/* 첫 번째와 마지막 셀의 테두리 설정 */
	.board_list thead th:first-child, .board_list tbody td:first-child {
	    border-left: none;
	}
	
	.board_list thead th:last-child, .board_list tbody td:last-child {
	    border-right: none;
	}
	
	.board_list {
	    border-collapse: collapse;
	    border: 1px solid black;
	    table-layout: fixed; 
	    width: 100% !important;
	}
	
	.board_list col:nth-child(1) {
	    width: 30% !important;
	}
		
	.board_list col:nth-child(2) {
	    width: 25% !important;
	}
		
	.board_list col:nth-child(3) {
	    width: 20% !important;
	}
		
	.board_list col:nth-child(4) {
	    width: 15% !important;
	}
	
	a {
		color: black; /* 링크 색상을 검정으로 설정 */
		text-decoration: none; /* 밑줄 제거 */
	}
	
	a:hover {
		text-decoration: underline; /* 마우스를 올렸을 때만 밑줄 표시 */
	}
	
</style>

</head>
<body>
	<div id="header">
		<jsp:include page="../../../header.jsp" />
	</div>

	<div class="container">
		<h2>리뷰 목록</h2>
		<hr>
		<div class="fsv_show">
			<button>
				<a href="list_fsv">Festival</a>
			</button>
			/
			<button>
				<a href="list_show">Show</a>
			</button>
		</div>

		<div class="review_insert">
			<% if(session.getAttribute("loginMember") != null) { %>
			<button style="float: right;">
				<a href="../review/review_insert.jsp">리뷰 등록하기</a>
				<% } %>
			</button>
			<br>
		</div>
		<table class="board_list">
			<colgroup>
				<col width="15%" />
				<col width="55%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">축제</th>
					<th scope="col">제목</th>
					<th scope="col">본문</th>
					<th scope="col">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list}">
							<tr>
								<td style="color: #606060;">${vo.event_name}</td>
								<td class="title"><a href="one?review_id=${vo.review_id}"
									style="font-style: italic !important;">${vo.review_title}</a></td>
								<td style="color: #606060;">
								    <c:choose>
								        <c:when test="${fn:length(vo.review_content) > 7}">
								            ${fn:substring(vo.review_content, 0, 7)}...
								        </c:when>
								        <c:otherwise>
								            ${vo.review_content}
								        </c:otherwise>
								    </c:choose>
								</td>
								<td style="color: #606060;">${vo.mem_id}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>