<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/notice/menuCss1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div id="total">
		<div id="center">
			<h3>공지사항 게시물 수정</h3>
			<hr color="grey">
			<form action="update_action" id="form" method="post" enctype="multipart/form-data">
                <input type="hidden" name="board_id" value="${dto.board_id}">
				<span class="label-text">제목</span><br><br>
				<div class="form-group">
					<input type="text" class="form-control input-sm" name="board_title" value="${dto.board_title}">
				</div>
				<br>
				<span class="label-text">게시글 작성</span><br><br>
				<div class="form-group">
					<textarea class="form-control form-control-content" name="board_content">${dto.board_content}</textarea>
				</div>
                <img src="<c:url value='/resources/upload/${dto.img}' />" alt="이미지 미리보기">
				<input type="file" name="file"><br>
				<div class="btn-submit">
					<button type="submit" class="btn btn-secondary">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
