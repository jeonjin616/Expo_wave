<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 & 공연 추천 챗봇</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	</header>

	<div>
		<textarea id="chatWindow" readonly rows="10" cols="50"></textarea>
	</div>
	<div>
		<input type="text" id="userInput" placeholder="여기에 메시지를 입력하세요.">
		<button id="sendButton">전송</button>
	</div>

	<div>
		<button id="recommendFestivalsButton">추천 축제</button>
		<button id="recommendPerformancesButton">추천 공연</button>
	</div>

	<div id="recommendationResults">
		<c:forEach var="festival" items="${festivals}">
			<p>${festival}</p>
		</c:forEach>
	</div>


	<script>
		$("#recommendFestivalsButton").click(function() {
			var userInput = prompt("어떤 종류의 축제를 찾으시나요?");
			$("#chatWindow").append("나: " + userInput + "\n");

			$.post("recommend/festivals/response", {
				keyword : userInput
			}, function(data) {
				$("#recommendationResults").text(data);
			});
		});

		// 추천 공연 버튼 클릭 이벤트
		$("#recommendPerformancesButton").click(function() {
			var theme = prompt("어떤 테마의 공연을 찾으시나요? (예: 뮤지컬, 연극 등)");
			$("#chatWindow").append("나: " + theme + "\n");

			$.post("recommend/performances/response", {
				theme : theme
			}, function(data) {
				$("#recommendationResults").text(data);
			});
		});
	</script>

</body>
</html>
