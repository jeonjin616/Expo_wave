<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/MD/mdUpdatestyle.css"> -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/MD/mdPostMakeStyle.css">


</head>
<script>
	function previewImage(input) {
		var preview = document.getElementById('preview');
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				preview.src = e.target.result;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<body>
	<br>
	<h1 style="margin-left: 550px;">게시글 수정하기</h1>

	<form action="MDPostUpdate" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td class="MDTitle" style="width: 300px">게시글 제목<br> <textarea
						name="MD_title" value="${param.MD_title}"
						style="width: 770px; height: 25px; resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td class="content">게시글 내용<br> <textarea name="MD_content"
						value="${param.MD_content}"
						style="width: 770px; height: 250px; resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div style="display: flex; align-items: center;">
						<!-- 이미지 업로드를 위한 input 태그 -->
						<input type="file" name="file" id="MD_post_Thumbnail"
							onchange="previewImage(this);">
						<button type="submit" style="margin-left: 80px;" >수정하기</button>
						</div><img id="preview" style="max-width: 200px; max-height: 200px;">
					
				<td><input name="MD_id" type="hidden" value="${param.MD_id}"></td>
				</td>

			</tr>
		</table>
	</form>


</body>
</html>