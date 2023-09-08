<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Page Header</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

/* Header */
.header {
	background-color: #ffffff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	padding: 10px 0;
	position: relative;
	width: 100%;
	z-index: 1000;
}

.header-inner {
	display: flex;
	flex-direction: column;
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 20px;
}

.top-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.bottom-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 10px;
}

.nav-links {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	margin-right: 15px;
}

.nav-links li {
	margin-left: 20px;
}

.nav-links a {
	text-decoration: none;
	color: #555555;
}

/* Search Bar */
.search-bar {
	background-color: #8AAAE5;
	border-radius: 20px;
	display: flex;
	align-items: center;
	padding: 6px 10px;
	width: 300px;
}

.search-bar input {
	border: none;
	background-color: #8AAAE5;
	padding: 6px 15px;
	width: 100%;
}

.search-icon {
	margin-right: 8px;
}

.header__searchSelect{
	border: none;
	background-color: #8AAAE5;
	padding: 6px 8px;
	width: 100%;
}
#searchSelect,
#searchInput {
    color: #FEFEFE;
}
#searchInput::placeholder {
    color: #FEFEFE; 
}
/* Menu Bar */
.menu-bar {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
}

.margin1 {
	margin-left: 8px;
}

.marginleft {
	margin-left: 50px;
}

.menu-bar a {
	text-decoration: none;
	color: #555555;
}
</style>

</head>
<body>
	<header class="header">
		<div class="header-inner">
			<div class="top-row">
				<div class="logo">
					<a href="<c:url value='/index.jsp'/>"> <img
						src="<c:url value='/resources/img/logo_white.jpg'/>" width="76"
						height="70">
					</a>

				</div>
				<nav>
					<ul class="nav-links">
						<c:if test="${empty sessionScope.loginMember}">
							<li><a href="<c:url value='/member/login.jsp'/>">Login</a></li>
							<li><a href="<c:url value='/member/join.jsp'/>">Sign Up</a></li>
						</c:if>
						<!-- 로그인 후 보여줄 메뉴 -->
						<c:if test="${not empty sessionScope.loginMember}">
							<span>${sessionScope.loginMember}님 환영합니다.</span>
							<li><a href="<c:url value='/logout'/>">Log Out</a></li>
							<li><a href="<c:url value='/mypage'/>">My Page</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="bottom-row">
				<ul class="menu-bar">
					<li class="margin1"><a
						href="<c:url value='/list/festivalAll?page=1'/>">축제</a></li>
					<li class="marginleft"><a
						href="<c:url value='/list/showAll?page=1'/>">공연</a></li>
					<li class="marginleft"><a href="/wave/instar/instarpage?page=1">Instagram</a></li>
					<li class="marginleft"><a href="<c:url value='/md/MDAll?page=1'/>">MD's
							Pick</a></li>
					<li class="marginleft"><a
						href="<c:url value='/review/list'/>">Review</a></li>
					<li class="marginleft"><a
						href="<c:url value='/notice/notice'/>">고객센터</a></li>
					<li class="marginleft"><a
						href="<c:url value='/my2.jsp'/>">Wave Map</a></li>
						
				</ul>
				<div class="search-bar">
					<select class="header__searchSelect" id="searchSelect">
					   <option value="">선택하세요</option>
						<option value="festival">축제</option>
						<option value="show">공연</option>
					</select> <input id="searchInput" class="search-input" type="text" placeholder="Search...">
					<div class="input-group-append">
						<div id="searchBtn" class="search-icon">&#128269;</div>
					</div>
				</div>
			</div>
	</header>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(document).ready(function() {
    $('#searchBtn').click(function() {
        var selectedOption = $('#searchSelect').val();
        var query = $('#searchInput').val();
        var baseUrl = 'http://localhost:8989/wave/list/';

        // festival 과 show 중 선택
        var searchUrl = '';
        if (selectedOption === 'festival') {
            searchUrl = 'festivalSearch';
        } else if (selectedOption === 'show') {
            searchUrl = 'showSearch';
        }
        

        // 전체 url
        var fullUrl = baseUrl + searchUrl + '?query=' + encodeURIComponent(query) + '&page=1';

        
        if (selectedOption !== '') {
            if (query !== '') {
                window.location.href = fullUrl;
            } else {
                alert('검색어를 입력하세요.'); // 검색어가 입력되지 않은 경우 알림 메시지 표시
            }
        }
    });  
    

    $('.search-input').keypress(function(event) {
        if (event.which === 13) { // 13은 엔터 키의 keyCode 값
            $('#searchBtn').click(); // 검색 버튼 클릭 이벤트 호출
        }
    });
    
});
</script>
</html>