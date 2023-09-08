<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/MD/mdDetailstyle.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(
			function() {
				// 댓글 수정 버튼을 눌렀을 때
				$(".updateComment").hide();

				$(".showUpdateCommentButton").click(function() {
					var commentId = $(this).data("comment-id");
					$("#updateComment_" + commentId).toggle();
					$("#deleteComment_" + commentId).toggle();
					$(this).toggle(); // "댓글 수정하기" 버튼도 숨기기/표시하기
				});

				$(".cancelUpdateButton").click(
						function(e) {
							e.preventDefault(); // 기본 동작 막기
							var commentId = $(this).data("comment-id");
							$("#updateComment_" + commentId).hide();
							$("#deleteComment_" + commentId).show();
							$(
									".showUpdateCommentButton[data-comment-id='"
											+ commentId + "']").show();
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
			<br> <br>
			<c:choose>
				<c:when test="${not empty postvo.MD_post_Thumbnail}">
					<!-- 이미지가 있는 경우 -->
					<img
						src="${pageContext.request.contextPath}/resources/img/${postvo.MD_post_Thumbnail}"
						alt="게시글 이미지2">
				</c:when>
				<c:otherwise>
					<!-- 이미지가 없는 경우  -->
					<img
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt="로고 이미지2">
				</c:otherwise>
			</c:choose>
			<br> <br> <br>
			${fn:replace(postvo.MD_content,replaceChar,"<br/>")}
			${postvo.MD_content}
		</div>
		<br> <br> <br> <br> <br>

		<c:if test="${loginMember eq 'admin'}">

			<form action="MDPostUpdatePage.jsp" method="post"
				style="display: inline;">
				<input name="MD_id" type="hidden" value="${postvo.MD_id}">
				<button class="custom-button" style="margin-left: 810px;">게시글 수정하기</button>
			</form>

			<form action="MDPostDelete" method="post"
				style="display: inline; margin-left: 10px;">
				<input name="MD_id" type="hidden" value="${postvo.MD_id}">
				<button class="custom-button">게시글 삭제하기</button>
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
		<hr>
		<!-- 비회원은 댓글작성 불가 -->

		<c:if test="${loginMember != null}">
			<form action="MDCommentMake" method="post" style="margin-top: 10px;">
				<table>
					<td class="MDComment">
						<%
							out.print(session.getAttribute("loginMember"));
						%>
					</td>
					<tr>

						<div style="color: gray; font-size: 12px;">주제와 무관한 댓글, 악플은
							경고없이 삭제되며 징계 대상이 될 수 있습니다.</div>
						<br>
						<td><textarea name="MD_comment"
								style="width: 980px; height: 60px; resize: none;"></textarea></td>
						<td class="MD_id"><input name="MD_id" type="hidden"
							value="${postvo.MD_id}"><br>
						<td class="MD_Comment_writer"><input name="MD_comment_writer"
							type="hidden" value="${sessionScope.loginMember}"><br>
							<button class="custom-button" type="submit" style="margin-bottom: 20px;">작성하기</button></td>
					</tr>
				</table>
			</form>
		</c:if>

		<c:choose>
			<c:when test="${empty commentvo}">

				<div style="text-align: center;">
					<br> <br> 작성된 댓글이 없습니다.
				</div>
				<br>
				<br>
				<br>
				<br>
			</c:when>
			
			<c:otherwise>
				<br>
				<c:forEach items="${commentvo}" var="vo">
					<span style="font-weight: bold; font-size: 20px;"> <c:out
							value="${vo.MD_comment_writer}" />
					</span>
					<br>
					<div style="display: inline-block; margin-top: 8px;">
    ${vo.MD_comment}
</div>
					
					<c:choose>
    <c:when test="${not empty vo.MD_comment_modifi}">
        <p style="color: #888888; font-size: 14px;">댓글 생성시점 : ${vo.MD_comment_create} | 댓글 수정시점 = ${vo.MD_comment_modifi}</p>
    </c:when>
    <c:otherwise>
        <p style="color: #888888; font-size: 14px;">댓글 생성시점 : ${vo.MD_comment_create}</p>
    </c:otherwise>
</c:choose>
					<!-- 수정부분 -->
					<c:if
						test="${loginMember eq 'admin' or loginMember eq vo.MD_comment_writer}">
						<div>
							<button class="showUpdateCommentButton"
								data-comment-id="${vo.MD_comment_id}">수정하기</button>
							<!-- 댓글 삭제하기 -->
							<form action="MDCommentDelete" class="deleteComment"
								id="deleteComment_${vo.MD_comment_id}" style="display: inline;">
								<input type="hidden" name="MD_comment_id"
									value="${vo.MD_comment_id}"> <input type="hidden"
									name="MD_id" value="${vo.MD_id}">
								<button class="custom-button" style="margin-left: 10px;">삭제하기</button>
							</form>
						</div>
						<form action="MDCommentUpdate" class="updateComment"
							id="updateComment_${vo.MD_comment_id}">
							<textarea name="MD_comment"
								style="width: 930px; height: 30px; resize: none;">${vo.MD_comment}</textarea>
							<input type="hidden" name="MD_comment_id"
								value="${vo.MD_comment_id}"> <input type="hidden"
								name="MD_id" value="${vo.MD_id}"> <br>
							<button class="custom-button">수정완료</button>
							<button class="cancelUpdateButton"
								data-comment-id="${vo.MD_comment_id}" style="margin-left: 10px">수정취소</button>
						</form>
					</c:if>
					<hr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

	</div>
</body>
</html>