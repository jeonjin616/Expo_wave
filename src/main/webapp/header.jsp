<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Main Page Header</title>
<style>
  body {
    margin: 0;
    font-family: Arial, sans-serif;
  }
  
  /* Header */
  .header {
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 10px 0;
    position: relative;
    width: 100%;
    z-index: 1000;
  }
  
  .header-inner {
    display: flex;
    flex-direction: column;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
  }
  
  .top-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .bottom-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 10px;
  }
  
  .nav-links {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    margin-right: 15px;
  }
  
  .nav-links li {
    margin-left: 20px;
  }
  
  .nav-links a {
    text-decoration: none;
    color: #555555;
  }
  
  /* Search Bar */
  .search-bar {
    background-color: #f1f1f1;
    border-radius: 20px;
    display: flex;
    align-items: center;
    padding: 6px 10px;
    width: 300px;
  }
  
  .search-bar input {
    border: none;
    background-color: #f1f1f1;
    padding: 6px 10px;
    width: 100%;
  }
  
  .search-icon {
    margin-right: 8px;
  }
  
  /* Menu Bar */
  .menu-bar {
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
  }
  
  .margin1 {
    margin-left: 8px;
  }
  .marginleft {
    margin-left: 50px;
  }
  
  .menu-bar a {
    text-decoration: none;
    color: #555555;
  }
  
</style>

</head>
<body>
  <header class="header">
    <div class="header-inner">
      <div class="top-row">
        <div class="logo">
			<a href="<c:url value='/index.jsp'/>">
  			  <img src="<c:url value='/resources/img/logo_white.jpg'/>" width="76" height="70">
</a>

        </div>
        <nav>
          <ul class="nav-links">
          	<c:if test="${empty sessionScope.loginMember}">
				<li><a href="<c:url value='/member/login.jsp'/>">Login</a></li>
				<li><a href="<c:url value='/member/join.jsp'/>">Sign Up</a></li>
            </c:if>
            <!-- 로그인 후 보여줄 메뉴 -->
            <c:if test="${not empty sessionScope.loginMember}">
              <span>${sessionScope.loginMember}님 환영합니다.</span>
				<li><a href="<c:url value='/logout'/>">Log Out</a></li>
				<li><a href="<c:url value='/mypage'/>">My Page</a></li>
            </c:if>
          </ul>
        </nav>
      </div>
      <div class="bottom-row">
        <ul class="menu-bar">
			<li class="margin1"><a href="<c:url value='/list/festivalAll?page=1'/>">축제</a></li>
			<li class="marginleft"><a href="<c:url value='/list/showAll?page=1'/>">공연</a></li>
			<li class="marginleft"><a href="#">Instagram</a></li>
			<li class="marginleft"><a href="<c:url value='/md/MDAll'/>">MD's Pick</a></li>
			<li class="marginleft"><a href="<c:url value='/WEB-INF/views/review/list.jsp'/>">Review</a></li>
			<li class="marginleft"><a href="<c:url value='/notice/notice'/>">고객센터</a></li>
			<li class="marginleft"><a href="#">내게 맞는 행사</a></li>
        </ul>
        <div class="search-bar">
          <div class="search-icon">&#128269;</div>
          <input type="text" placeholder="Search...">
        </div>
      </div>
    </div>
  </header>
  
</body>
</html>