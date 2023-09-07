<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    a{
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
</head>
<body>

<script>
    function deleteConfirmation(faqId) {
        var confirmDelete = confirm("삭제하시겠습니까?");
        if (confirmDelete) {
            // 사용자가 확인을 선택한 경우
            window.location.href = "faq_delete?faq_id=" + faqId; // 삭제 요청에 id 파라미터 전달
        }
    }
</script>
	<div id="total">
		<div id="center">
			
		    <p class="title">${dto.faq_title}</p>
    		<p class="date">작성일 ${dto.faq_create_date}</p>
    		<p class="link"> 
    		<c:if test="${loginMember eq 'admin'}">
    		<a href="javascript:void(0);" onclick="deleteConfirmation(${dto.faq_id})">삭제</a> &nbsp; &nbsp; <a href="faq_edit?faq_id=${dto.faq_id}">수정</a>
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
					${fn:replace(dto.faq_content,replaceChar,"<br/>")}<br> <br>
					
						<p class="back"><a href="faq" >이전페이지</a></p>
				
				</div>
			
		</div>

</body>
</html>