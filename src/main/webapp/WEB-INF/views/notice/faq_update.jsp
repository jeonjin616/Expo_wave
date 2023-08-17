<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<link rel="stylesheet" type="text/css" href="resources/css/menuCss1.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div id="total">
		<div id="center">
			<h3>FAQ 게시물 수정</h3>
			<hr color="grey">
			<form action="faq_update_action" id="form" method="post" enctype="multipart/form-data">
                <input type="hidden" name="faq_id" value="${dto.faq_id}">
				<span class="label-text">제목</span><br><br>
				<div class="form-group">
					<input type="text" class="form-control input-sm" name="faq_title" value="${dto.faq_title}">
				</div>
				<br>
				<span class="label-text">게시글 작성</span><br><br>
				<div class="form-group">
					<textarea class="form-control form-control-content" name="faq_question">${dto.faq_question}</textarea>
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
