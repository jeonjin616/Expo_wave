<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 결과</title>
		<link rel="stylesheet" type="text/css" href="../../../resources/css/member/idSearchRes.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="idSearchRes">
		<div class="idSearchResHeader" style="text-align: center;" >
			<img src="../../../resources/img/logo.png" width="100" height="100">
		</div>
		<div class="idSearchResBody">
			<h4>아이디 찾기 </h4>
			<div>
				<div>
					<span id="memName">${memInfo.mem_name }님의 아이디는 </span>
					<span><strong>${memInfo.mem_id}</strong> 입니다.</span>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-primary btn-1" id="pwSearch" onclick='location.href="경로 넣기"'><span>비밀번호 찾기</span></button>
				<button type="button" class="btn btn-primary btn-1"onclick='location.href="../../login.jsp"'><span>로그인</span></button>
			</div>
		</div>
	</body>
</html>