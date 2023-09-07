<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../resources/js/member/idSearch.js"></script>
</head>
<style>
body {
	line-height: 1.5;
	margin: 0;
	min-block-size: 100vh;
	padding: 5vmin;
	font-family: Arial, sans-serif;
}

input {
	border: none;
	margin: 0;
	padding: 0;
	border-radius: 0.1875em;
}

h1 {
	text-align: left;
	margin-left: 300px;
	margin-top: 20px;
	color: #8AAAE5;
}

.content {
	width: 600px;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 100px;
	text-align: left;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	border-radius: 21px;
}

.radioEmailBox {
	border-bottom-left-radius: 1.25em;
	border-bottom-right-radius: 1.25em;
	display: grid;
	gap: 0.875em;
	padding: 1.25em 1.625em;
}

.radioEmailBox .inputTxt {
	background-color: #ffffff;
	color: #777;
	padding: 0.25em 0.625em;
	width: 100%;
	background-color: #8AAAE5;
}

.insertMemInfo {
	background-color: #8AAAE5;
	color: #fff;
	padding: 0.25em 0.625em;
	border: none;
	border-radius: 0.1875em;
}

.btn-1 {
	margin-left: 5px;
	background: #8AAAE5;
	background: linear-gradient(0deg, #8AAAE5 0%, #8AAAE5 100%);
	border: none;
	color: #fff;
	padding: 0.5em 1em;
	cursor: pointer;
}

.btn-1:hover {
	background: #8AAAE5;
	background: linear-gradient(0deg, #8AAAE5 0%, #8a8de5 100%);
}
</style>
<body>
	<h1>아이디 찾기</h1>
	<!-- <div >
			<input type="button" value="아이디 찾기"></button>
			<input type="hidden" onclick="location.href='비밀번호찾기'" value="비밀번호 찾기"></button>
	</div> -->
	<div class="content">
		<!--<div class="radioSelectBox">
			<div class="radioPhoenBox">
				 <div id="radioPhoneWrap">
					<input type="radio" name="select" checked><span class="AuthSelectText">휴대전화</span>
				</div>
				<div>
					<input type="text" id="mem_Name" placeholder="이름" >
					<div>
						<input type="text" name="mem_phone1" maxlength="3" value="010">-
						<input type="text" name="mem_phone2" maxlength="4" value="1111">-
						<input type="text" name="mem_phone3" maxlength="4" value="5555">
						<input type="button" value="인증요청">
					</div>
					<input type="text" id="" placeholder="인증번호" >
				</div>
			<hr> -->
		<div class="radioEmailBox">
			<div id="radioEmailWrap">
				<input type="radio" name="select" checked><span
					class="AuthSelectText">이메일</span>
			</div>
			<div>
				<span>이름</span> <input type="text" id="mem_name" placeholder="이름"
					value="나나나">
			</div>
			<div>
				<span>이메일 주소</span> <input type="text" id="insertEmail"
					class="inputTextEmail" value="as26149"><span> @ </span> <input
					type="text" id="domainText" class="inputTextEmail"> <select
					name="domainList" id="domainList" class="insertMemInfo">
					<!-- 이메일(도메인) 선택 -->
					<option value="directInput" selected>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>
			</div>
			<div>
				<input type="text" placeholder="인증번호 6자리 입력" maxlength="6"
					disabled="disabled" id="certNum">
				<button type="button" class="btn-1" id="mailRequestBtn">
					<!-- 클래스 추가 -->
					<span>인증번호 받기</span>
				</button>
			</div>
			<div>
				<span id="mailCheckMsg"></span>
			</div>
			<div class="nextBtnWrap">
				<button type="button" class="btn-1" id="idNextBtn">
					<!-- 클래스 추가 -->
					<span id="nextBtnText">다음</span>
				</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>