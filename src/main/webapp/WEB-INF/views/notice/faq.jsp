<%@page import="com.multi.wave.notice.FaqVO"%>
<%@page import="com.multi.wave.notice.FaqDAO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>고객센터</title>
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
}

header {
	text-align: center;
}

header img {
	width: 100%; /* 이미지 크기를 조정해주세요. */
}

nav {
	padding: 1rem;
}

nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: center;
}

nav li {
	margin-right: 20px; /* 메뉴 간격을 조정해주세요. */
}

nav a {
	text-decoration: none;
	color: #666; /* 기본 글자색 */
	padding-bottom: 2px;
	border-bottom: 2px solid transparent;
	transition: color 0.2s ease, border-bottom-color 0.2s ease;
}

nav a:hover {
	color: #8AAAE5; /* 마우스 오버 시 글자색 변경 */
	border-bottom-color: #000; /* 마우스 오버 시 밑줄 생김 */
}

section {
	margin-top: 2rem;
}

footer {
	color: black;
	text-align: center;
	padding: 1rem;
}

h1 {
	text-align: left;
	padding-left: 285px;  /* 왼쪽 간격 20px 추가 */
}

table {
	width: 70%;
	margin: 0 auto;
	border-collapse: collapse;
}

/* 헤더 부분의 선 두꺼움 */
th {
	background-color: transparent;
	border-bottom: 2px solid black; /* 선 두꺼움 */
}

td {
	border-bottom: 0.1px solid black; /* 실선 */
}
/* 나머지 테이블 셀의 선 설정 */
th, td {
	padding: 8px;
	text-align: left;
	border-left: none; /* 세로 선 없앰 */
	border-right: none; /* 세로 선 없앰 */
}

.faq_id {
	width: 10%;
	text-align: center;
}

.faq_title {
	width: 70%;
	text-align: center;
}

.faq_create_date {
	width: 20%;
	text-align: center;
}

.post-button {
	position: fixed;
	bottom: 20px;
	right: 20px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: #8AAAE5;
	color: #fff;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 20px;
}

.post-button:hover {
	transform: translateY(-5px); /* 마우스 호버 시 약간 위로 올라가는 효과 */
	box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강화 */
}

.search-container {
	text-align: center;
	margin: 50px auto;
	display: inline-block; /* 인라인 블록 요소로 설정하여 같은 줄에 배치 */
	position: relative;
	background-color: #c2f0c2; /* 연한 초록색 배경 설정 */
	border-radius: 30px;
}

#search-input {
	padding: 10px;
	width: 500px;
	height: 40px;
	border: none;
	border-radius: 30px;
	font-size: 18px;
	background-color: transparent; /* 검색창 내부 배경을 투명하게 설정 */
	outline: none; /* 포커스 시 테두리 제거 */
	text-indent: 30px; /* 왼쪽 여백 설정 */
}

#search-input::placeholder {
	color: #777;
}

#search-button {
	padding: 10px;
	background-color: transparent; /* 검색 버튼 배경을 투명하게 설정 */
	border: none;
	cursor: pointer;
	position: absolute;
	right: 5px;
	top: 50%;
	transform: translateY(-50%);
	right: 15px; /* 오른쪽 간격 늘림 */
}

/* 검색 결과 페이지 스타일 */
.search-results {
	text-align: center;
	margin: 50px auto;
}

ul {
	list-style-type: none;
	padding: 0;
}

ul li {
	margin-bottom: 10px;
}

/*  ul li a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	font-size: 18px;
}  */
.pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.pagination a, .pagination .current-page {
	display: inline-block;
	margin: 0 5px;
	padding: 10px 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	text-align: center;
}

.pagination .current-page {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#search-button")
								.click(
										function(event) {
											event.preventDefault();
											let query = $("#search-input")
													.val();
											$
													.ajax({
														url : '../notice/faq_ajaxSearch',
														type : 'GET',
														dataType : 'json', // 추가된 부분
														data : {
															query : query
														},
														success : function(data) {
															$('tbody').empty();

															let tbodyContents = '';

															data
																	.forEach(function(
																			faq) {
																		tbodyContents += '<tr>';
																		tbodyContents += '<td class="faq_id">'
																				+ faq.faq_id
																				+ '</td>';
																		tbodyContents += '<td class="faq_title"><a href="faq_one?id='
																				+ faq.faq_id
																				+ '&title='
																				+ faq.faq_title
																				+ '">'
																				+ faq.faq_title
																				+ '</a></td>';
																		tbodyContents += '<td class="faq_create_date">'
																				+ faq.faq_create_date
																				+ '</td>';
																		tbodyContents += '</tr>';
																	});

															$('tbody')
																	.html(
																			tbodyContents);
														}
													});
										});
					});
</script>
</head>
<body>



	<header>
		<nav>
			<ul>
				<li><a href="notice">공지사항</a></li>
				<li><a href="faq">자주하는 질문</a></li>
				<li><a href="inqu">회원 1:1 문의게시판</a></li>
				<li><a href="chat">챗봇</a></li>
			</ul>
		</nav>

		<div class="search-container">
			<form action="search_result.jsp" method="get">
				<input type="text" id="search-input" name="query"
					placeholder="검색어를 입력하세요" autocomplete="off">
				<button type="submit" id="search-button">
					<svg xmlns="http://www.w3.org/2000/svg" height="1.5em"
						viewBox="0 0 512 512">
						<!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
						<style>
svg {
	fill: #000000
}
</style>
						<path
							d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" /></svg>
				</button>
			</form>
		</div>




	</header>

	<footer>
		<h1>자주하는 질문</h1>
		<br>
		<br>
		<table>
			<thead>
				<tr>
					<th class="faq_id">번호</th>
					<!-- 클래스 적용 -->
					<th class="faq_title">제목</th>
					<!-- 클래스 적용 -->
					<th class="faq_create_date">작성일자</th>
					<!-- 클래스 적용 -->
				</tr>
			</thead>

			<tbody>
				<c:forEach var="faq" items="${list}">
					<tr>
						<td class="faq_id">${faq.faq_id}</td>
						<!-- 클래스 적용 -->
						<td class="faq_title"><a
							href="faq_one?id=${faq.faq_id}&title=${faq.faq_title}">${faq.faq_title}</a></td>
						<!-- 클래스 적용 -->
						<td class="faq_create_date">${faq.faq_create_date}</td>
						<!-- 클래스 적용 -->

					</tr>
				</c:forEach>
			</tbody>

		</table>

		<div class="pagination">
			<a href="../notice/faq?page=1"><<</a>
			<c:if test="${currentPage > 5}">
				<a href="../notice/faq?page=${startPage - 1}"><</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${i eq currentPage}">
						<span class="current-page">${i}</span>
					</c:when>
					<c:otherwise>
						<a href="../notice/faq?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${endPage < pages}">
				<a href="../notice/faq?page=${endPage + 1}">></a>
			</c:if>
			<a href="../notice/faq?page=${pages}">>></a>
		</div>


		<c:if test="${loginMember eq 'admin'}">
			<a href="faq_write_post.jsp" class="post-button">게시글 작성하기</a>
		</c:if>
	</footer>
</body>
</html>