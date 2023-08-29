<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Update Page</title>
<!--     <link rel="stylesheet" href="header.css"> -->
<style>
	form {
		padding-top: 170px;
		padding-left: 30px;
	}
</style>
</head>
<body>
    <jsp:include page="../header.jsp" />
      <div class="main">
        <form action="update">
        <%-- <% value = "${mem_id}" %> --%>
        	review_id : <input type="text" name="review_id" value="${param.review_id}" readonly="readonly" > <br>
   
        	<!-- show_id : <input type="text" name="mem_id" value="apple"> <br> -->
        	review_title : <input type="text" name="review_title" value="${param.review_title}"> <br>
        	review_content : <input type="text" name="review_content" value="${param.review_content }"> <br>
        	review_image : <input type="text" name="review_image" value="apple.jsp"> <br>
        	<button>Festival</button>
        	<button>Show</button>
        </form>
      </div>
      <div class="footer">
      	
      </div>
</body>
</html>