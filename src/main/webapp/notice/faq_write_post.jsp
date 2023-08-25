<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/notice/menuCss1.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	<div id="total">
		<div id="center">
			<h3>FAQ 게시물 등록</h3>
			<hr color="grey">
			<form action="faq_insert2" id="form" method="post" enctype="multipart/form-data">
				<span class="label-text">제목</span><br><br>
				<div class="form-group">
					<input type="text" class="form-control input-sm" name="faq_title" placeholder="제목을 입력해주세요">
				</div>
				<br>	
				<span class="label-text">게시글 작성</span><br><br>	
				<div class="form-group">
					<textarea class="form-control form-control-content" name="faq_content" placeholder="게시글을 작성해주세요"></textarea>
				</div>
					<input type="file" name="file" ><br>
				<div class="btn-submit">
					<button type="submit" class="btn btn-secondary">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>