<%@page import="com.multi.wave.notice.InquiryVO"%>
<%@page import="com.multi.wave.notice.InquiryDAO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	background-color: #f0f0f0; /* 메뉴 선택바 배경색 */
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
	color: #000; /* 마우스 오버 시 글자색 변경 */
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
}

hr {
	border: 1px solid black;
	box-shadow: none;
}

table {
	width: 70%;
	margin: 0 auto;
	border-collapse: collapse;
}

th, td {
	border: 2px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: transparent;
}

.inqu_id {
	width: 10%;
	text-align: center;
}

.inqu_title {
	width: 70%;
	text-align: center;
}

.inqu_create_date {
	width: 20%;
	text-align: center;
}

.post-button {
	position: fixed;
	bottom: 20px;
	right: 20px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: #fff;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	border-radius: 20px;
}

.post-button:hover {
	background-color: #0056b3;
}

/* 검색창 스타일 */
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

ul li a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	font-size: 18px;
}
</style>
</head>
<body>
	<header>
		<!-- 이미지 배너에 고객센터 글씨를 포함한 예제 이미지를 사용합니다. -->
		<img src="resources/img/banner1.png" alt="고객센터" />
	</header>

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

	<!-- <script>
        const searchInput = document.getElementById('search-input');
        const searchSuggestions = document.getElementById('search-suggestions');

        searchInput.addEventListener('input', async () => {
            const query = searchInput.value;

            // 서버에 검색어를 보내서 관련된 검색 완성 결과를 가져옴
            const suggestions = await fetch(`/get_suggestions?query=${query}`);
            const suggestionsJson = await suggestions.json();

            // 검색 완성 결과를 표시
            searchSuggestions.innerHTML = '';
            suggestionsJson.forEach(suggestion => {
                const suggestionItem = document.createElement('div');
                suggestionItem.textContent = suggestion;
                suggestionItem.classList.add('suggestion');
                searchSuggestions.appendChild(suggestionItem);
            });
        });
    </script> -->

	<footer>
		<h1>회원 1:1 문의</h1>
		<hr>
		<br>
		<table>
			<tr>
				<th class="inqu_id">번호</th>
				<!-- 클래스 적용 -->
				<th class="inqu_title">제목</th>
				<!-- 클래스 적용 -->
				<th class="inqu_create_date">작성일자</th>
				<!-- 클래스 적용 -->
			</tr>
			<c:forEach var="inqu" items="${list}">
				<tr>
					<td class="inqu_id">${inqu.inqu_id}</td>
					<!-- 클래스 적용 -->
					<td class="inqu_title"><a
						href="inqu_one?id=${inqu.inqu_id}&title=${inqu.inqu_title}">${inqu.inqu_title}</a></td>
					<!-- 클래스 적용 -->
					<td class="inqu_create_date">${inqu.inqu_create_date}</td>
					<!-- 클래스 적용 -->

				</tr>
			</c:forEach>

		</table>

		<a href="inquiry_write_post.jsp" class="post-button">게시글 작성하기</a>
	</footer>
</body>
</html>