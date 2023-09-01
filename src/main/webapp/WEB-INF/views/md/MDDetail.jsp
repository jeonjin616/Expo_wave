<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>

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
	<div style="margin-left: 380px; margin-right: 380px;">
		<br>
		<div style="font-weight: bold; font-size: 36px;">${postvo.MD_title}</div>
		<div style="margin-left: 0px;">
			게시글 게시 : ${postvo.MD_create} <br>
		</div>
		<c:if test="${postvo.MD_modifi ne null}">
     게시글 수정 : ${postvo.MD_modifi}<br>
		</c:if>
		<div style="text-align: center;">
			<c:choose>
				<c:when test="${not empty vo.MD_post_Thumbnail}">
					<!-- 이미지가 있는 경우 -->
					<img
						src="${pageContext.request.contextPath}/resources/img/${vo.MD_post_Thumbnail}"
						alt="게시글 이미지2">
				</c:when>
				<c:otherwise>
					<!-- 이미지가 없는 경우 -->
					<img
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt="로고 이미지">
				</c:otherwise>
			</c:choose>
			<br> <br> <br>${postvo.MD_content}
		</div>
		<br> <br> <br> <br> <br>

		<c:if test="${loginMember eq 'admin'}">

			<form action="MDPostUpdatePage.jsp" method="post"
				style="display: inline;">
				<input name="MD_id" type="hidden" value="${postvo.MD_id}">
				<button>게시글 수정하기</button>
			</form>

			<form action="MDPostDelete" method="post"
				style="display: inline; margin-left: 30px;">
				<input name="MD_id" type="hidden" value="${postvo.MD_id}">
				<button>게시글 삭제하기</button>
			</form>
		</c:if>

		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ이미지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<c:forEach items="${imgvo}" var="vo">
	 MD_img_id = ${vo.MD_img_id}
	<br> MD_img = ${vo.MD_img} 	이미지 업로드 시점 = ${postvo.MD_create}
	<br>
		</c:forEach>
		<!-- 수정시간 없을경우 미출력 -->
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<br>

		<form action="MDCommentMake" method="post" style="margin-top: 10px;">
			<table>
			<tr></tr>
				<tr>
					    <td class="MDComment">작성자1 :</td>
					    <br>
					    <td>
					    <textarea name="MD_comment" 
							style="width: 800px; height: 50px;"></textarea></td>
					<td class="MD_id"><input name="MD_id" type="hidden"
						value="${postvo.MD_id}"><br>
					<td class="MD_Comment_writer"><input name="MD_comment_writer" type="hidden"
						value="${sessionScope.loginMember}"><br>
						<button type="submit">댓글 작성하기</button></td>
				</tr>
			</table>
		</form>



		<c:forEach items="${commentvo}" var="vo">
		닉네임 = ${vo.MD_comment_writer}
			<br> 댓글 내용 = ${vo.MD_comment}
	<br> 댓글 생성시점 = ${vo.MD_comment_create}
	<!-- 수정시간 없을경우 미출력 -->
			<c:if test="${vo.MD_comment_modifi ne null}">
				<br> 댓글 수정시점 = ${vo.MD_comment_modifi}
	</c:if>
			<br>
			<!-- 수정부분 -->

			<c:if test="${loginMember eq 'admin' or loginMember eq vo.MD_comment_writer}">
				<button class="showUpdateCommentButton"
					data-comment-id="${vo.MD_comment_id}">수정하기</button>
				<!-- 댓글삭제 -->
				<form action="MDCommentDelete" class="deleteComment"
					id="deleteComment_${vo.MD_comment_id}">
					<input type="hidden" name="MD_comment_id"
						value="${vo.MD_comment_id}"> <input type="hidden"
						name="MD_id" value="${vo.MD_id}">
					<button>삭제하기</button>
				</form>
				<form action="MDCommentUpdate" class="updateComment"
					id="updateComment_${vo.MD_comment_id}">
					<input type="text" name="MD_comment" value="${vo.MD_comment}">
					<input type="hidden" name="MD_comment_id"
						value="${vo.MD_comment_id}"> <input type="hidden"
						name="MD_id" value="${vo.MD_id}">
					<button>수정완료</button>
				</form>
			</c:if>

			<hr>
		</c:forEach>

		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

	</div>
</body>
</html>