<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/MD/mdDetailstyle.css">

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

	<form action="MDAll2" method="get">
		<button>게시글 전체 보기</button>
	</form>
	게시글 번호 = ${postvo.MD_id}의 상세페이지
	<br> 제목 : ${postvo.MD_title}
	<br> post content = ${postvo.MD_content}
	
	<br> img = <img src="/wave/resources/img/${postvo.MD_post_Thumbnail}">
	<br> 게시글 게시시점 = ${postvo.MD_create}<br>
	<c:if test="${postvo.MD_modifi ne null}">
     게시글 수정시간 = ${postvo.MD_modifi}<br>
	</c:if>
	<hr>
	<form action="MDPostUpdatePage.jsp" method="post">
		<input name="MD_id" type="hidden" value="${postvo.MD_id}">
		<button>게시글 수정하기</button>
	</form>

	<form action="MDPostDelete" method="post">
		<input name="MD_id" type="hidden" value="${postvo.MD_id}">
		<button>게시글 삭제하기</button>
	</form>


	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ이미지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<c:forEach items="${imgvo}" var="vo">
	 MD_img_id = ${vo.MD_img_id}
	<br> MD_img = ${vo.MD_img} 	이미지 업로드 시점 = ${postvo.MD_create}
	<br>
	</c:forEach>
	<!-- 수정시간 없을경우 미출력 -->

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
					value="${postvo.MD_id}"><br>
					<button>댓글 작성하기</button></td>
			</tr>
		</table>
	</form>


	<hr>
	<hr>
	<c:forEach items="${commentvo}" var="vo">
	댓글 번호 = ${vo.MD_comment_id}
	<br> 댓글 내용 = ${vo.MD_comment}
	<br> 댓글 생성시점 = ${vo.MD_comment_create}
	<!-- 수정시간 없을경우 미출력 -->
		<c:if test="${vo.MD_comment_modifi ne null}">
			<br> 댓글 수정시점 = ${vo.MD_comment_modifi}
	</c:if>
		<br>
		<!-- 수정부분 -->
		<button class="showUpdateCommentButton"
			data-comment-id="${vo.MD_comment_id}">수정하기</button>
		<form action="MDCommentUpdate" class="updateComment"
			id="updateComment_${vo.MD_comment_id}">
			<input type="text" name="MD_comment" value="${vo.MD_comment}">
			<input type="hidden" name="MD_comment_id" value="${vo.MD_comment_id}">
			<input type="hidden" name="MD_id" value="${vo.MD_id}">

			<button>수정완료</button>
		</form>

		<!-- 댓긄각제 -->
		<form action="MDCommentDelete" class="deleteComment"
			id="deleteComment_${vo.MD_comment_id}">
			<input type="hidden" name="MD_comment_id" value="${vo.MD_comment_id}">
			<input type="hidden" name="MD_id" value="${vo.MD_id}">
			<button>삭제하기</button>
		</form>
		<hr>
	</c:forEach>

	<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


</body>
</html>