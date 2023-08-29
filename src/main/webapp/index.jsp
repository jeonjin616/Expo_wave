<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<style>
	 .banner {
    	position: relative;
    	padding-top: 144px;
    }

    .banner img {
      width: 100%; /* 이미지 너비 조정 */
      height: auto; /* 이미지 높이 자동 조정 */
    }
	
	p {
		font-size: 18px;
		font-weight: bold;
		color: #393939;
		padding-top: 30px;
		padding-left: 180px;
		/* margin: auto;
		transition: padding-left 0.5s ease; */
	}
	
	@media (max-width: 1200px) {
		p {
			padding-left: 27px;
		}
	}
	
</style>
</head>

<body>
	<%@ include file="header.jsp" %>
	<div class="banner">
		<%@ include file="banner.jsp" %>
	</div>
	<section>
		<div class="recommend event">
			<p>추천하는 Hot한 행사</p>
		</div>
		
	</section>
	
</body>
</html>