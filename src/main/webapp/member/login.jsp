<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title>

<!-- css 파일 만들어서 분리하기 -->
<style>
	body {
            line-height: 1.5;
            margin: 0;
            min-block-size: 100vh;
            padding: 5vmin;
        }

        input {
            border: none;
            margin: 0;
            padding: 0;
            border-radius: 0.1875em;
        }
        .login {
            width: 400px;
            height: 500px;
            margin: 0 auto;
            margin-top: 100px;
            margin-bottom: 100px;
        }
         .loginHeader {
            background-color: #0093AF;
            border-top-left-radius: 1.25em;
            border-top-right-radius: 1.25em;
            color: #fff;
            padding: 0.5em;
        }
         .loginForm {
            border-bottom-left-radius: 1.25em;
            border-bottom-right-radius: 1.25em;
            display: grid;
            gap: 0.875em;
            padding: 1.25em 1.625em;
        }
        
        .login .inputTxt{
            background-color: #ffffff;
            color: #777;
            padding: 0.25em 0.625em;
            width: 100%;
        }
        
        .option a{
        	font-size: 12px; 
        	color: #4F97A3; 
        	cursor: pointer;
			text-decoration: none;        	
        }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- <script type="text/javascript" src="../resources/js/member/로그인.js"></script> js 이름 변경하기-->
</head>
<body >
	<div class="login">
		<div class="loginHeader" style="text-align: center;" >
			<img src="../resources/img/logo.png" width="100" height="100">
		</div>
		<!-- 로그인 폼 -->
		<form id="loginForm" name="loginForm" method="post" action="login">
			<label> &nbsp;</label>
			<input type="text" class="inputTxt" name="id" id="id" placeholder="아이디"><br>
			<label> &nbsp;</label>
			<input type="password" class="inputTxt" name="pw" id="pw" placeholder="비밀번호">
			<br><br><br>
			<div class="option" style="text-align: center;">
				<a href=""><span>아이디 찾기</span></a>
				<span>/</span>
				<a href=""><span>비밀번호 찾기</span></a>
			</div>
			<div style="text-align: center;">
				<br>
				<button class="btn btn-primary" type="submit" id="loginBtn">로그인</button>
				<input class="btn btn-primary" type="button"  value="회원가입" onClick="location.href='/wave/member/join.jsp'">
			</div>
		</form>
	</div>
</body>
</html>