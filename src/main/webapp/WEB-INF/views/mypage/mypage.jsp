<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4">마이페이지</h2>
                <form action="/mypage/changePassword" method="post" id="changePasswordForm">
                    <div class="form-group">
                        <label for="memberId">아이디:</label>
                        <input type="text" class="form-control" id="memberId" value="${member.mem_id}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberName">이름:</label>
                        <input type="text" class="form-control" id="memberName" value="${member.mem_name}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberNickname">닉네임:</label>
                        <input type="text" class="form-control" id="memberNickname" value="${member.mem_nickname}" readonly>
                    </div>
                    <div class="form-group">
                        <label>비밀번호:</label>
                        <button type="button" class="btn btn-primary" id="changePasswordBtn">비밀번호 변경</button>
                    </div>
                    <input type="hidden" name="oldPassword" id="oldPassword">
                    <input type="hidden" name="newPassword" id="newPassword">
                </form>
                <div id="notification" class="mt-3" style="display: none;"></div>
            </div>
        </div>
    </div>

    <div id="passwordPopup" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="passwordPopupLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordPopupLabel">비밀번호 변경</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="inputOldPassword">현재 비밀번호:</label>
                    <input type="password" class="form-control" id="inputOldPassword">
                    <label for="inputNewPassword">새 비밀번호:</label>
                    <input type="password" class="form-control" id="inputNewPassword">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id="confirmChange">확인</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $("#changePasswordBtn").click(function() {
                $("#passwordPopup").modal("show");
            });

            $("#confirmChange").click(function() {
                $("#oldPassword").val($("#inputOldPassword").val());
                $("#newPassword").val($("#inputNewPassword").val());

                $.ajax({
                    type: "POST",
                    url: "/wave/mypage/changePassword",
                    data: $("#changePasswordForm").serialize(),
                    success: function(response) {
                        if (response === "success") {
                            $("#notification").text("비밀번호가 성공적으로 변경되었습니다.")
                                .removeClass("text-danger").addClass("text-success").show();
                            setTimeout(function() {
                                $("#notification").hide();
                                $("#passwordPopup").modal("hide");
                                window.location.href = "/wave/mypage";
                            }, 2000);
                        } else if (response === "error") {
                            $("#notification").text("현재 비밀번호가 잘못되었습니다.")
                                .removeClass("text-success").addClass("text-danger").show();
                        } else {
                            $("#notification").text("오류가 발생하였습니다.").addClass("text-danger").show();
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
