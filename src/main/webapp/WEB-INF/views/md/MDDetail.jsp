<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		// 댓글 수정 버튼을 눌렀을 때
		$(".updateComment").hide();

		$(".showUpdateCommentButton").click(function() {
			var commentId = $(this).data("comment-id");
			$("#updateComment_" + commentId).toggle();
		});
	});
</script>

<script>
	$(document).ready(function() {
		var message = "${message}";
		console.log(message);
		if (message) {
			alert(message);
		}
	});
</script>
</head>
<body>

	<form action="MDAll" method="get">
		<button>게시글 전체 보기</button>
	</form>
	게시글 번호 = ${postdto.MD_id}의 상세페이지
	<br> 제목 : ${postdto.MD_title}
	<br> post content = ${postdto.MD_content}
	<br> 게시글 게시시점 = ${pstdto.MD_create}
	<hr>
	<form action="MDPostUpdatePage.jsp" method="post">
		<input name="MD_id" type="hidden" value="${postdto.MD_id}">
		<button>게시글 수정하기</button>
	</form>

	<form action="MDPostDelete" method="post">
		<input name="MD_id" type="hidden" value="${postdto.MD_id}">
		<button>게시글 삭제하기</button>
	</form>


	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ이미지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<c:forEach items="${imgdto}" var="dto">
	 MD_img_id = ${dto.MD_img_id}
	<br> MD_img = ${dto.MD_img} 	이미지 업로드 시점 = ${postdto.MD_create}
	<br>
	</c:forEach>
	<!-- 수정시간 없을경우 미출력 -->
	<c:if test="${postdto.MD_modifi ne '0000-00-00 00:00:00'}">
     게시글 수정시간 = ${postdto.MD_modifi}<br>
	</c:if>
	<hr>
	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ이미지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

	<form action="MDCommentMake" method="post">
		<table>
			<tr>
				<td class="MDComment">댓글 <input name="MD_comment">
				</td>
			</tr>
			<tr>
				<td class="MD_id"><input name="MD_id" type="hidden"
					value="${postdto.MD_id}"><br>
					<button>댓글 작성하기</button></td>
			</tr>
		</table>
	</form>


	<hr>
	<hr>
	<c:forEach items="${commentdto}" var="dto">
	댓글 번호 = ${dto.MD_comment_id}
	<br> 댓글 내용 = ${dto.MD_comment}
	<br> 댓글 생성시점 = ${dto.MD_comment_create}
	<!-- 수정시간 없을경우 미출력 -->
		<c:if test="${dto.MD_comment_modifi ne '0000-00-00 00:00:00'}">
			<br> 댓글 수정시점 = ${dto.MD_comment_modifi}
	</c:if>
		<br>
		<!-- 수정부분 -->
		<!-- 수정버튼 -->
		<button class="showUpdateCommentButton"
			data-comment-id="${dto.MD_comment_id}">수정하기</button>

		<form action="MDCommentUpdate" class="updateComment" id="updateComment_${dto.MD_comment_id}">
			<input type="text" name="MD_comment" value="${dto.MD_comment}">
			<input type="hidden" name="MD_comment_id" value="${dto.MD_comment_id}">
			<input type="hidden" name="MD_id" value="${dto.MD_id}">
				
			<button>수정완료</button>
		</form>
		
		<!-- 아직 미구현 -->
		<form action="MDCommentDelete" class="deleteComment" id="deleteComment_${dto.MD_comment_id}">
			<input type="hidden" name="MD_comment_id"
				value="${dto.MD_comment_id}">
			<button>삭제하기</button>
		</form>
		<hr>
	</c:forEach>

	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


</body>
</html>