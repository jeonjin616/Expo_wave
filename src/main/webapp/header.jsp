<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Website</title>
    <link rel="stylesheet" href="resources/css/header.css">
</head>
<body>
    <header>
        <div class="image">
            <img src="resources/img/logo.png" alt="Logo" class="logo-fin">
        </div>
        <div class="label">
            <div class="text-wrapper">
                <div class="navbar">
                    <div class="text"><a href="member/login.jsp">로그인</a></div>
                    <div class="text">마이페이지</div>
                    <div class="text"><a href="member/join.jsp">회원가입</a></div>
                    <div class="text"><a href="notice/home.jsp">고객센터</div>
                    <div class="text"><a href="md/MDAll">MD's pick1</a></div>
                <!--  main\webapp\header.jsp-->
                <!--  main\webapp\header.jsp-->
                </div>
            </div>
        </div>
   	<div class="box">
			<div class="image">
				<img src="resources/img/etcmenu.png" alt="Etc Menu" class="category">
			</div>
			<div class="label">
				<div class="text-wrapper">
					<a href="list/festivallist">축제 보기</a> 
					<a href="list/showlist">공연 보기</a>

				</div>

			</div>
		</div>

        <div class="box">
            <div class="image">
                <img src="resources/img/cultureexpo.png" alt="Culture Expo" class="category">
            </div>
            <div class="label">
                <div class="text-wrapper">
                    내게 맞는 문화전시 <!--이것도 텍스트가 아니라 이미지라 cultureexpo로 임의로 이름붙였습니다-->
                </div>
            </div>
            
        </div>
        
        <div class="box">
            <div class="rectangle">
                <div class="image">
                    <img src="resources/img/searchicon.png" alt="Search Icon" class="img">
                </div>
                <div class="label">
                    <div class="text-wrapper">
                        검색아이콘 <!--돋보기 모양 아이콘 임의로 searchicon이라고 이름붙였습니다-->
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>
</html>
