<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

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
	width: 100%; /* 혹은 다른 값을 설정 */
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
.reply-item {
  border-top: 1px solid #ccc; /* 위쪽에 실선 추가 */
  padding: 10px;
  background-color: #ffffff;
  width: 100%;  /* 너비를 300픽셀로 설정 */
  text-align: left;
}

.reply-item:first-child {
  border-top: none; /* 첫 번째 댓글의 위쪽 경계 제거 */
}

.reply-item:last-child {
  border-bottom: 1px solid #ccc; /* 아래쪽에 실선 추가 */
}

#reply-write-section, #reply-list {
	margin-top: 50px; /* 원하는 간격으로 조절 가능 */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

#reply-content, #reply-btn {
    margin-bottom: 10px;
}

#reply-write-section {
    margin-top: 130px; /* 원하는 간격으로 조절 가능 */
    /* 기존 스타일들 */
}
.reply-item .writer, .reply-item .reg_date {
  font-size: 0.7em; /* 원하는 크기로 설정 */
}
.reply-item .content {
  font-size: 1.0em; /* 원하는 크기로 설정 */
}
#reply-write-section {
  display: flex;
  flex-direction: row; /* 가로로 나열 */
  align-items: center;
  justify-content: space-between;
}

#reply-write-section textarea {
  flex: 6; /* 4의 비율로 차지 */
}

#reply-write-section button {
  flex: 0.4; /* 1의 비율로 차지 */
}
#reply-write-section textarea, #reply-write-section button {
  height: 100px; /* 세로 크기도 동일하게 설정 */
}

.reply-item .edit {
    font-size: 0.6em;  /* 글자 크기 */
    
}

.reply-item .delete {
    font-size: 0.6em;  /* 글자 크기 */
    margin-left: 15px; /* 간격 */
}
</style>
<script>

<c:forEach var="reply" items="${replies}">
	var replyId = "${reply.reply_id}";
</c:forEach>


function formatDate(timestamp) {
    const date = new Date(timestamp);
    return date.toLocaleDateString('ko-KR') + ' ' + date.toLocaleTimeString('ko-KR', { hour12: false });
}

    function deleteConfirmation(inquId) {
        var confirmDelete = confirm("삭제하시겠습니까?");
        if (confirmDelete) {
            window.location.href = "inqu_delete?inqu_id=" + inquId;
        }
    }
    $(document).ready(function(){
        var postId = ${dto.inqu_id}; // 게시물 번호를 가져옴
        var loginMember = "${sessionScope.loginMember}"; // 현재 로그인한 회원 ID 가져오기
        
        function loadReplies(){
            $.ajax({
                url: '../notice/replies/' + postId, // 게시물 번호를 URL에 포함
                method: "GET",
                dataType: "json", 
                success: function(replyData) {
                    $("#reply-list").empty();
                    for(let i=0; i<replyData.length; i++){
                        
                        // 수정, 삭제 버튼 초기화
                        var editDeleteHtml = '';
                        
                        // 작성자와 로그인한 회원 ID가 일치하는 경우에만 수정, 삭제 버튼 추가
                        if(replyData[i].writer === loginMember) {
                            editDeleteHtml = '<a class="edit" href="javascript:editReply(' + replyData[i].reply_id + ', \'' + replyData[i].content + '\')">수정</a>' +
                                             '<a class="delete" href="javascript:deleteReply(' + replyData[i].reply_id + ')">삭제</a>';
                        }

                        $('#reply-list').append(
                            '<div class="reply-item" id="reply-item-' + replyData[i].reply_id + '">' +
                                '<div class="writer">' + replyData[i].writer + '</div>' +
                                '<div class="content">' + replyData[i].content + '</div>' +
                                '<div class="writer reg_date">' + formatDate(replyData[i].reg_date) + '</div>' +
                                editDeleteHtml +
                            '</div>'
                        );
                    }
                }
            
            });
        }

        $("#reply-btn").click(function(){
            var content = $("#reply-content").val();
            
            var dataToSend = {
                post_id: ${dto.inqu_id}, // 게시물 번호를 가져옴
                content: content,
                writer: "${sessionScope.loginMember}"
            };

            $.ajax({
                url: '../notice/replies',
                method: "POST",
                dataType: 'text',
                data:(dataToSend),
                success: function() {
                    console.log("Successfully posted.");
                    $("#reply-content").val(''); // textarea 내용 지우기
                    location.reload()
                    /* loadReplies(); */
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                    console.log("Status: " + status);
                    console.log(xhr);
                }
            });
        });

        loadReplies();
    });
    
    function editReply(replyId, currentContent) {
        var $replyItem = $('#reply-item-' + replyId);
        var newContentHtml = `
            <textarea id="edit-content-${replyId}">${currentContent}</textarea>
            <button onclick="updateReply(replyId)">저장</button>
        `;
        $replyItem.find('.content').html(newContentHtml);
    }
    
    function updateReply(replyId) {
    	var newContent = $(`#edit-content-${replyId}`).val();
    	var currentDate = new Date().toISOString();  // 현재 날짜와 시간을 ISO 문자열로 변환
    	
        console.log("새로운 내용: ", newContent);  // 콘솔로 출력
        console.log("replyId 값: ", replyId);
        console.log("reg_date 값: ", currentDate);
        $.ajax({
            url: '../notice/updateReply', // 서버로 전송할 URL, 실제 URL에 맞게 수정해주세요.
            type: 'POST', // HTTP 메서드
            data: {
                replyId: replyId,
                content: newContent,
                reg_date: currentDate  // reg_date를 data에 추가
            },

            success: function(response) {
                // 업데이트 성공 시 로직 (예: 페이지 새로고침 또는 댓글 리스트 다시 불러오기)
                location.reload();
            },
            error: function(error) {
                // 업데이트 실패 시 로직
                console.error('댓글 업데이트 실패', error);
            }
        });
    }
    
    function deleteReply(replyId) {
        var confirmDelete = confirm("댓글을 삭제하시겠습니까?");
        if (confirmDelete) {
            $.ajax({
                url: '../notice/deleteReply/' + replyId, // 서버의 URL과 일치
                method: "DELETE",
                dataType: 'text',
                contentType: 'application/json; charset=utf-8',
                success: function() {
                    console.log("Successfully deleted.");
                    location.reload();
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                    console.log("Status: " + status);
                    console.log(xhr);
                }
            });
        }
    }

    
</script>

</head>
<body>

	<div id="total">
		<div id="center">
			<p class="title">${dto.inqu_title}</p>
			<p class="date">작성일 ${dto.inqu_create_date}</p>
			<p class="link">
			
				<c:if test="${replyWriter eq loginMember}">
    				<a href="javascript:void(0);"
						onclick="deleteConfirmation(${dto.inqu_id})">삭제</a> &nbsp; &nbsp; <a
						href="inqu_edit?inqu_id=${dto.inqu_id}">수정</a>
				</c:if>
			
			</p>
			<hr color="grey">
			<br> 
			<c:choose>
    			<c:when test="${not empty dto.img}">
        			<img src="<c:url value='../resources/upload/${dto.img}' />" alt="이미지를 불러오는데 실패하였습니다.">
    			</c:when>
    			<c:otherwise>
        			
    			</c:otherwise>
			</c:choose> <br> <br>
			${fn:replace(dto.inqu_question,replaceChar,"<br/>")}<br> <br>
			<p class="back">
				<a href="inqu">이전페이지</a>
			</p>
			

			<div id="reply-write-section">
    			<textarea id="reply-content" placeholder="댓글을 작성해주세요."></textarea>
    			<button id="reply-btn">등록</button>
			</div>
			<div id="reply-list"></div>

		</div>
	</div>


</body>
</html>