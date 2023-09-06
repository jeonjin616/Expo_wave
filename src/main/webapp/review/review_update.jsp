<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Review Update Page</title>
<!--     <link rel="stylesheet" href="header.css"> -->
<link rel="stylesheet" th:href="@{/css/style.css}"
	href="../../css/style.css"></link>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script>
	function readURL(update) {
		if (update.files && update.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			}

			reader.readAsDataURL(update.files[0]);
		}
	}
</script>
<style>
form {
	padding-top: 20px;
}

h2 {
	margin-bottom: 10px;
}

hr {
	background-color: #8AAAE5;
	height: 5px; /* 굵기 조절 */
	border: 0px; /* 테두리 없애기 */
}

.main {
	margin-left: 155px;
	margin-right: 155px;
	margin-top: 40px;
	margin-bottom: 150px;
}

#review {
	padding-top: 8px;
	padding-left: 0px;
}

#title {
	width: 1045px;
	font-size: 15px;
	float: right; /* 우측 정렬 */
}

#contents {
	width: 1200px;
	height: 400px;
	font-size: 13px;
}

#autocomplete-results {
	border: 1px solid #ccc;
	max-height: 150px;
	overflow-y: auto;
}

#autocomplete-results div {
	padding: 5px;
	cursor: pointer;
}

#autocomplete-results div:hover {
	background-color: #eee;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* $("#dropdown").change(function() {
						    selectedValue = $(this).val();
						 }); */
						$("#searchText")
								.on(
										"keyup",
										function() {
											const query = $(this).val();
											const selectedValue = $("#select")
													.val();

											if (query.length === 0) {
												$("#autocomplete-results")
														.hide();
												return;
											}
											if (selectedValue === 'festival') {
												$
														.ajax({
															url : 'search_fsv',
															method : 'GET',
															data : {
																q : query
															},
															dataType : 'json',
															success : function(
																	data) {
																$(
																		"#autocomplete-results")
																		.empty();
																if (data.length > 0) {
																	console
																			.log("2222"
																					+ data[0].fsv_id)
																	$(data)
																			.each(
																					function(
																							i,
																							json) {
																						const resultItem = $(
																								'<div>')
																								.text(
																										json.fsv_name)
																								.click(
																										function() {
																											$(
																													"#show_select")
																													.val(
																															0);
																											$(
																													"#fsv_select")
																													.val(
																															json.fsv_id);
																											$(
																													"#searchText")
																													.val(
																															json.fsv_name);

																											$(
																													"#autocomplete-results")
																													.hide();
																										});
																						$(
																								"#autocomplete-results")
																								.append(
																										resultItem);
																					})

																	$(
																			"#autocomplete-results")
																			.show();
																} else {
																	$(
																			"#autocomplete-results")
																			.hide();
																}
															}
														});

											} else {

												$
														.ajax({
															url : 'search_show',
															method : 'GET',
															data : {
																q : query
															},
															dataType : 'json',
															success : function(
																	data) {
																console
																		.log("data >>> "
																				+ data);
																$(
																		"#autocomplete-results")
																		.empty();
																if (data.length > 0) {
																	$(
																			"#autocomplete-results")
																			.empty();
																	if (data.length > 0) {
																		$(data)
																				.each(
																						function(
																								i,
																								json) {
																							const resultItem = $(
																									'<div>')
																									.text(
																											json.show_name)
																									.click(
																											function() {

																												$(
																														"#fsv_select")
																														.val(
																																0);
																												$(
																														"#show_select")
																														.val(
																																json.show_id);
																												$(
																														"#searchText")
																														.val(
																																json.show_name);

																												$(
																														"#autocomplete-results")
																														.hide();
																											});
																							$(
																									"#autocomplete-results")
																									.append(
																											resultItem);
																						})

																		$(
																				"#autocomplete-results")
																				.show();
																	} else {
																		$(
																				"#autocomplete-results")
																				.hide();
																	}
																	$(
																			"#autocomplete-results")
																			.show();
																} else {
																	$(
																			"#autocomplete-results")
																			.hide();
																}
															}
														});
											}
										});
					});
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="main">
		<h2>리뷰 수정하기</h2>
		<hr>
		<form action="updateReview" method="post" enctype="multipart/form-data">
			<!-- 액션을 변경하고 메서드 추가 -->
			<%-- <input id="fsv_select" name="fsv_id" value="${param.fsv_id}">
			<input name="mem_id" value="${param.mem_id}"> <input
				id="show_select" name="show_id" value="${param.show_id}">  --%>
			<input
				 name="review_id" type="hidden" value="${param.review_id}">

			<table class="board_detail">
				<tr class="title">
					<td>제목</td>
					<td><input type="text" id="title" name="review_title"
						value="${param.review_title}"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="contents" name="review_content">${param.review_content}</textarea>
					</td>
				</tr>
				<tr>
					<td>이미지 파일 첨부</td>
					<td style="width: 220px;"><input type="file"
						name="file" onchange="readURL(this);" style="width: 100%;" />
						<!-- 기존의 이미지 주소를 사용하여 미리보기를 표시하십시오 --> <img id="preview"
						src="../resources/upload/${param.review_image}"
						style="max-width: 200px; max-height: 200px; align-content: flex-end;">
					</td>
				</tr>
			</table>
			<input type="submit" id="submit" value="업데이트" class="btn"
				style="float: right;">
			<!-- 값 변경 -->
		</form>
	</div>
</body>
</html>

