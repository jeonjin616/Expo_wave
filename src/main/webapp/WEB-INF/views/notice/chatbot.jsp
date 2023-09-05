<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ChatBot</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$('#userInput').keydown(function(event) {
        if (event.keyCode === 13) {
            event.preventDefault(); // Enter 키로 새 줄이 추가되는 것을 방지
            $('#sendButton').click(); // sendButton의 click 이벤트를 트리거
        }
    });
	
    $('#festivalButton').click(function() {
        let msg = "어떤 지역의 축제를 원하시나요? (지역명을 입력해주세요! ex. 서울)";
        $('#chatBox').append('<div class="botMessage">' + msg + '</div>');
        $('#festivalButton').hide();
        $('#showButton').show();
    });

    $('#showButton').click(function() {
        let msg = "어떤 지역의 공연을 원하시나요? (지역명을 입력해주세요! ex. 서울)";
        $('#chatBox').append('<div class="botMessage">' + msg + '</div>');
        $('#showButton').hide();
        $('#festivalButton').show();
    });

    $('#sendButton').click(function() {
        let userMsg = $('#userInput').val();
        $('#chatBox').append('<div class="userMessage">' + userMsg + '</div>');
        $('#userInput').val('');
        $('#chatBox').scrollTop($('#chatBox')[0].scrollHeight);

        if ($('#festivalButton').is(":hidden")) {
            // "축제 알아보기" 버튼이 숨겨져 있을 때
            $.ajax({
                url: window.location.origin + "/wave/notice/getFestivals",
                method: "GET",
                data: { region: userMsg },
                dataType: "json",
                success: function(data) {
                    if (data.length > 0) {
                        let festivalList = data.join(", ");
                        let replyMsg = userMsg + " 지역에서 개최되는 축제정보입니다^^~ " + festivalList + ". 다른 지역의 축제정보도 알고 싶으면 지역명을 다시 입력해주세요!";
                        $('#chatBox').append('<div class="botMessage">' + replyMsg + '</div>');
                    } else {
                        $('#chatBox').append('<div class="botMessage">' + userMsg + " 지역에는 찾을 수 있는 축제가 없네요. 다른 지역은 어떨까요? 다른 지역을 입력해주세요. " + '</div>');
                    }
                }
            });
        } else if ($('#showButton').is(":hidden")) {
            // "공연 알아보기" 버튼이 숨겨져 있을 때
            $.ajax({
                url: window.location.origin + "/wave/notice/getShow",
                method: "GET",
                data: { region: userMsg },
                dataType: "json",
                success: function(data) {
                    if (data.length > 0) {
                        let showList = data.join(", ");
                        let replyMsg = userMsg + " 지역에서 개최되는 공연정보입니다^^~ " + showList + ". 다른 지역의 공연정보도 알고 싶으면 지역명을 다시 입력해주세요!";
                        $('#chatBox').append('<div class="botMessage">' + replyMsg + '</div>');
                    } else {
                        $('#chatBox').append('<div class="botMessage">' + userMsg + " 지역에는 찾을 수 있는 공연이 없네요. 다른 지역은 어떨까요? 다른 지역을 입력해주세요. " + '</div>');
                    }
                }
            });
        }
    });
});
</script>
<style>
.botMessage {
	color: blue;
	float: left;
	clear: both;
}

.userMessage {
	color: green;
	float: right;
	clear: both;
}
</style>

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
	background-color: #ffffff; /* 메뉴 선택바 배경색 */
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

#userInputBox {
	display: flex;
	justify-content: space-between;
}

#userInput {
	flex: 4;
}

#sendButton {
	flex: 0.2;
}

#chatBox {
	border-radius: 10px;
}

.botMessage, .userMessage {
	padding: 10px;
	margin: 5px;
	border-radius: 10px;
	display: inline-block;
}

.botMessage {
	background-color: #f1f1f1;
}

.userMessage {
	background-color: #d1ffd6;
}
/* 스크롤바 둥글게 설정 */
#chatBox::-webkit-scrollbar {
	width: 12px; /* 스크롤바의 너비 설정 */
}

#chatBox::-webkit-scrollbar-thumb {
	background: grey; /* 스크롤바 색 설정 */
	border-radius: 10px; /* 둥글게 설정 */
}

</style>

</head>
<body>
	<header>
		<!-- 이미지 배너에 고객센터 글씨를 포함한 예제 이미지를 사용합니다. -->

		<nav>
			<ul>
				<li><a href="notice">공지사항</a></li>
				<li><a href="faq">자주하는 질문</a></li>
				<li><a href="inqu">회원 1:1 문의게시판</a></li>
				<li><a href="chat">챗봇</a></li>
			</ul>
		</nav>
	</header>


	<br>
	<br>
	<br>
	<div class="container">
		<!-- 채팅 내용이 들어갈 공간 위에 버튼을 배치 -->
		<div id="bookmark">
			<button id="festivalButton" class="btn btn-primary">축제 알아보기</button>
			<button id="showButton" class="btn btn-primary">공연 알아보기</button>
		</div>
		<div id="chatBox"
			style="height: 400px; border: 1px solid #ccc; padding: 10px; overflow-y: auto;">
			<!-- 채팅 내용 -->
		</div>
		<!-- 사용자 입력 박스 -->
		<div id="userInputBox">
			<input type="text" id="userInput" class="form-control">
			<button id="sendButton" class="btn btn-success">보내기</button>
		</div>
	</div>
</body>


