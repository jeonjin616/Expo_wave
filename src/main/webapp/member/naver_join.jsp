<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 소셜 로그인 회원가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/member/join.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../resources/js/member/memberJoin.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="naverInsert" method="post">
		<!-- 네이버 소셜 로그인 api를 통해 가져오는 값은 hidden으로 처리 -->
		<input type="hidden" name="mem_name" value="${param.name}">
		<input type="hidden" name="mem_nickname" value="${param.nickname}">
		<input type="hidden" name="mem_email" value="${param.email}">
		<input type="hidden" name="mem_profile_img" value="${param.profile_img}">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mem_id" id="mem_id" placeholder="아이디를 입력해주세요">
					<input type="button" id="mem_idChkBtn" value ="중복확인">
				</td>
			</tr>
			<tr>
				<th rowspan="2">비밀번호</th>
				<td><input type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호를 입력해주세요" value="1234"></td>
			</tr>
			<tr>
				<td>
					<input type="password" id="mem_pw2" placeholder="비밀번호를 다시 입력해주세요" value="1234">
					<span id="pwChk">비밀번호 비교 문구 출력</span>
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="mem_birth" value="2023-08-08"></td>
			</tr>
			<tr>
				<th rowspan="3">주소지</th>
				<td>
					<input type="text" placeholder="우편번호" id="memZipcode" name="mem_zipcode" readonly>
					<input type="button" onclick="addr_Search()" value="우편번호 찾기" id="addressSrchBtn" readonly>
				</td>
			</tr>
			<tr>
				<td><input type="text" placeholder="주소" id="memAddr1" name="mem_addr1" readonly></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="상세 주소" name="mem_addr2" id="memAddr2"></td>
			</tr>
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" class="phone" name="mem_phone1" maxlength="3" value="010">-<input type="text" class="phone" name="mem_phone2" maxlength="4" value="1111">-<input type="text" class="phone" name="mem_phone3" maxlength="4" value="5555">
			</tr>
			<tr>
				<th rowspan="2">선호문화행사</th>
				<td>
					<select name="mem_joy1" id="memJoy1">
						<option hidden="" disabled="disabled" selected="selected" value="">선호 박람회 선택</option>
						<option value="1">선호박람회1
						<option value="2">선호박람회2
						<option value="3">선호박람회3
						<option value="4">선호박람회4
						<option value="5">선호박람회5
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<select id="memJoy2" name="mem_joy2">
						<option hidden="" disabled="disabled" selected="selected" value="">선호 전시회 선택</option>
						<option value="1">선호전시회1
						<option value="2">선호전시회2
						<option value="3">선호전시회3
						<option value="4">선호전시회4
						<option value="5">선호전시회5
					</select>
				</td>
			</tr>
		</table>
		<c:import url="addressSearchAPI.jsp"/>
		<div class="button-container">
			<button id="inserBtn">가입</button>
		</div>
	</form>
</body>
</html>