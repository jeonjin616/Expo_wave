<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../resources/js/member/idSearch.js"></script>
</head>
<body>
	<h1>아이디 찾기</h1>
	<div >
			<input type="button" value="아이디 찾기"></button>
			<input type="button" onclick="location.href='비밀번호찾기'" value="비밀번호 찾기"></button>
	</div>
	<div class="content">
		<div class="radioSelectBox">
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
			<hr>
			<div class="radioEmailBox">
				<div id="radioEmailWrap">
					<input type="radio" name="select" checked><span class="AuthSelectText">이메일</span>
				</div>
				<div >
					<span>이름</span>
					<input type="text" id="mem_name" placeholder="이름" >
				</div>
				<div>
					<span>이메일 주소</span>
					<input type="text" id="insertEmail" class="inputTextEmail"><span> @ </span>
					<input type="text" id="domainText" class="inputTextEmail">
					<select name="domainList" id="domainList" class="insertMemInfo">	<!-- 이메일(도메인) 선택 -->
						<option value="directInput" selected>직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</div>
				<div>
					<input type="text" placeholder="인증번호 6자리 입력" maxlength="6" disabled="disabled" id="certNum">
					<button type="button" id="mailRequestBtn"><span>인증번호 받기</span></button>
				</div>
				<div>
					<span id="mailCheckWarn"></span>
				</div>
				<div class="nextBtnWrap">
					<button type="button" class="nextBtn" id="idNextBtn"><span id="nextBtnText">다음</span></button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>