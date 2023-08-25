<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/notice/menuCss2.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#center .title {
	text-align: left;
	font-weight: bold;
	font-size: 1.5em;
}

#center .date {
	text-align: left;
	font-size: 0.8em;
	margin-right: 2vh;
}

#center {
	position: relative;
}

.link {
	text-align: right;
	font-size: 1.0em;
	margin-right: 1vw;
}

.back {
	position: absolute;
	bottom: 0;
	right: 0;
	text-align: right;
	font-size: 1.0em;
	margin-bottom: 2vh;
	margin-right: 2vw;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: gray;
}

#center .back {
	position: fixed;
	bottom: 10px;
	right: 10px;
	text-align: right;
	font-size: 0.8em;
	text-decoration: none;
	color: black;
	transition: transform 0.3s ease; /* 변화 시 부드럽게 처리하기 위한 트랜지션 설정 */
	transform: translateY(0); /* 초기 위치 */
}

#center .back:hover {
	color: red;
}
</style>
<script>
    function deleteConfirmation(inquId) {
        var confirmDelete = confirm("삭제하시겠습니까?");
        if (confirmDelete) {
            window.location.href = "inqu_delete?inqu_id=" + inquId;
        }
    }
    $(document).ready(function(){
        function loadReplies(){
          $.ajax({
            url: "/replies/" + ${inqu.inqu_id}, 
            method: "GET",
            success: function(data) {
              $("#reply-list").empty();
              data.forEach(function(reply) {
                var replyHtml = '<div class="reply-item">' +
                                  '<div class="writer">' + reply.writer + '</div>' +
                                  '<div class="content">' + reply.content + '</div>' +
                                '</div>';
                $("#reply-list").append(replyHtml);
              });
            }
          });
        }

        $("#reply-btn").click(function(){
          var content = $("#reply-content").val();
          $.ajax({
            url: "/replies",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ post_id: ${inqu.inqu_id}, content: content }),
            success: function() {
              $("#reply-content").val('');
              loadReplies();
            }
          });
        });

        loadReplies();
    });
</script>

</head>
<body>

	<div id="total">
		<div id="center">
			<p class="title">${dto.inqu_title}</p>
			<p class="date">작성일 ${dto.inqu_create_date}</p>
			<p class="link">
				<a href="javascript:void(0);"
					onclick="deleteConfirmation(${dto.inqu_id})">삭제</a> &nbsp; &nbsp; <a
					href="inqu_edit?inqu_id=${dto.inqu_id}">수정</a>
			</p>
			<hr color="grey">
			<br> <img src="<c:url value='/resources/upload/${dto.img}' />"
				alt="이미지를 불러오는데 실패하였습니다."> <br> <br>
			${dto.inqu_question}<br> <br>
			<p class="back">
				<a href="inqu">이전페이지</a>
			</p>

		</div>
	</div>

	<div id="reply-write-section">
    	<textarea id="reply-content" placeholder="댓글을 작성해주세요."></textarea>
    	<button id="reply-btn">댓글 작성</button>
	</div>
	<div id="reply-list"></div>

</body>
</html>