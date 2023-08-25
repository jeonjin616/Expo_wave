<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 결과</title>
	</head>
	<body>
		<h2>아이디 찾기 </h2>
		<div>
			<div>
				<span id="memName">${memInfo.mem_name }님의 아이디는 </span>
				<span><strong>${memInfo.mem_id}</strong> 입니다.</span>
			</div>
		</div>
		<div>
			<button type="button" onclick='location.href="경로 넣기"'><span>비밀번호 찾기</span></button>
			<button type="button"><a href="../../login.jsp" ><span>로그인</span></a></button>
		</div>
	</body>
</html>