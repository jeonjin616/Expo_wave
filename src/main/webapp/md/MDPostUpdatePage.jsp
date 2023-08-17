<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시글 수정하기</h3>
		
		기존내용<br>
	<h3>게시글 번호: ${param.MD_id}</h3>
	<h3>게시글 제목: ${param.MD_title}</h3>
	<h3>기존 내용: ${param.MD_content}</h3>
	
	<form action="MDPostUpdate" method="post">
		<table>
			<tr>
				<td class="MDTitle">공지사항 제목 <input name="MD_title"
					value="${param.MD_title}"><br>
				</td>
			</tr>
			<tr>
				<td class="MDContent">공지사항 내용 <input name="MD_content"
					value="${param.MD_content}"><br>
				</td>
				<td><input name="MD_id" type="hidden" value="${param.MD_id}">
					<button type="submit">작성하기</button></td>
			</tr>
		</table>
	</form>

	
</body>
</html>