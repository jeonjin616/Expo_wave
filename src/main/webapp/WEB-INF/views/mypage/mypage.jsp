<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
.profile-image-container {
	text-align: center;
	margin: 20px 0;
}

.profile-image {
	width: 100px;
	border-radius: 50%;
	border: 2px solid #007bff;
}

.new-profile-image-container {
	text-align: center;
	margin-top: 10px;
}

#newProfileImage {
	display: none;
}

#changeImageBtn, #saveImageBtn {
	margin-top: 5px;
}
</style>

</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h2 class="text-center mb-4">마이페이지</h2>
				<form action="/mypage/changePassword" method="post"
					id="changePasswordForm">
					<div class="profile-image-container">
						<img
							src="<%= request.getContextPath() %>/resources/img/profileImg/${member.mem_img}"
							alt="프로필 사진" class="profile-image">
					</div>
					<div class="new-profile-image-container">
						<label for="newProfileImage" class="btn btn-secondary">이미지
							변경</label> <input type="file" name="newProfileImage" id="newProfileImage">
						<button type="button" class="btn btn-success" id="saveImageBtn">저장</button>
					</div>
					<div class="form-group">
						<label for="memberId">아이디:</label> <input type="text"
							class="form-control" id="memberId" value="${member.mem_id}"
							readonly>
					</div>
					<div class="form-group">
						<label for="memberName">이름:</label> <input type="text"
							class="form-control" id="memberName" value="${member.mem_name}"
							readonly>
					</div>
					<div class="form-group">
						<label for="memberNickname">닉네임:</label> <input type="text"
							class="form-control" id="memberNickname"
							value="${member.mem_nickname}" readonly>
					</div>

					<div class="form-group">
						<label for="memberFestivalTheme">선호축제테마:</label> <input
							type="text" class="form-control" id="memberFestivalTheme"
							value="${member.mem_joy1}" readonly>
					</div>

					<div class="form-group">
						<label for="memberShowTheme">선호공연테마:</label> <input type="text"
							class="form-control" id="memberShowTheme"
							value="${member.mem_joy2}" readonly>
					</div>

					<div class="form-group">
						<label>비밀번호:</label>
						<button type="button" class="btn btn-primary"
							id="changePasswordBtn">비밀번호 변경</button>
					</div>
					<input type="hidden" name="oldPassword" id="oldPassword"> <input
						type="hidden" name="newPassword" id="newPassword">
				</form>

				<div class="text-center mt-3">
					<a href="http://localhost:8989/wave/notice/notice"
						class="btn btn-info">고객센터</a>
				</div>
				<br>
				<div id="notification" class="mt-3" style="display: none;"></div>
			</div>
		</div>
	</div>

	<div id="passwordPopup" class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="passwordPopupLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordPopupLabel">비밀번호 변경</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<label for="inputOldPassword">현재 비밀번호:</label> <input
						type="password" class="form-control" id="inputOldPassword">
					<label for="inputNewPassword">새 비밀번호:</label> <input
						type="password" class="form-control" id="inputNewPassword">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="confirmChange">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			// 파일 선택 시 이미지 미리보기
			$("#newProfileImage").change(function() {
				var file = this.files[0];
				if (file) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$(".profile-image").attr("src", e.target.result);
					}
					reader.readAsDataURL(file);
				}
			});

			// 저장 버튼 클릭 시
			$("#saveImageBtn").click(function() {
				var fileInput = $("#newProfileImage")[0];
				var file = fileInput.files[0];

				if (file) {
					var formData = new FormData();
					formData.append("file", file);

					$.ajax({
						type : "POST",
						url : "/wave/mypage/uploadProfileImage",
						data : formData,
						contentType : false,
						processData : false,
						success : function(response) {
							if (response === "success") {
								alert("프로필 사진이 변경되었습니다.");
								location.reload();
							} else {
								alert("프로필 사진 변경에 실패했습니다.");
							}
						},
						error : function() {
							alert("서버 오류가 발생했습니다.");
						}
					});
				}
			});
		});

		$(document)
				.ready(
						function() {
							$("#changePasswordBtn").click(function() {
								$("#passwordPopup").modal("show");
							});

							$("#confirmChange")
									.click(
											function() {
												$("#oldPassword").val(
														$("#inputOldPassword")
																.val());
												$("#newPassword").val(
														$("#inputNewPassword")
																.val());

												$
														.ajax({
															type : "POST",
															url : "/wave/mypage/changePassword",
															data : $(
																	"#changePasswordForm")
																	.serialize(),
															success : function(
																	response) {
																if (response === "success") {
																	$(
																			"#notification")
																			.text(
																					"비밀번호가 성공적으로 변경되었습니다.")
																			.removeClass(
																					"text-danger")
																			.addClass(
																					"text-success")
																			.show();
																	setTimeout(
																			function() {
																				$(
																						"#notification")
																						.hide();
																				$(
																						"#passwordPopup")
																						.modal(
																								"hide");
																				window.location.href = "/wave/mypage";
																			},
																			2000);
																} else if (response === "error") {
																	$(
																			"#notification")
																			.text(
																					"현재 비밀번호가 잘못되었습니다.")
																			.removeClass(
																					"text-success")
																			.addClass(
																					"text-danger")
																			.show();
																} else {
																	$(
																			"#notification")
																			.text(
																					"오류가 발생하였습니다.")
																			.addClass(
																					"text-danger")
																			.show();
																}
															}
														});
											});
						});
	</script>
</body>
</html>