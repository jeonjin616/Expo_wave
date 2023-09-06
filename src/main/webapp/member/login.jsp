<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../resources/css/member/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../resources/js/member/login.js"></script>

<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>
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
				<a href="idSearch.jsp"><span>아이디 찾기</span></a>
				<!-- <span>/</span>
				<a href=""><span>비밀번호 찾기</span></a> -->
			</div>
			<div style="text-align: center;">
				<br>
				<button class="btn btn-primary btn-1" id="loginBtn">로그인</button>
				<input class="btn btn-primary btn-1" type="button" value="회원가입" onClick="location.href='/wave/member/join.jsp'">
			</div>
			<br>
			<!-- 네이버 로그인 버튼 노출 영역 -->
			<div id="naver_id_login" style="text-align: center;"></div>
			<script type="text/javascript">
				// 클라이언트 ID 및 콜백 URL
		        var naver_id_login = new naver_id_login("", "http://localhost:8080/wave/member/callback.jsp");
		        var state = naver_id_login.getUniqState();
		        naver_id_login.setButton("white", 3, 40);	// 버튼색상, 크기(1:버튼형, 2:작은배너, 3: 큰배너), 배너 및 버튼 높이
		        naver_id_login.setDomain("http://localhost:8080/wave/member/login.jsp");	// 서비스 URL
		        naver_id_login.setState(state);
		        //naver_id_login.setPopup();	// 팝업창 형태로 열림
		        naver_id_login.init_naver_id_login();
    		</script>
		</form>
	</div>
</body>
</html>