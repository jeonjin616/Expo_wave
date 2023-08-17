<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>검색 결과</title>
</head>
<body>
    <h1>검색 결과</h1>
    
    <c:if test="${empty searchResults}">
        <p>검색 결과가 없습니다.</p>
    </c:if>
    
    <c:if test="${not empty searchResults}">
        <ul>
            <c:forEach items="${searchResults}" var="result">
                <li><a href="<c:out value="${result.url}"/>"><c:out value="${result.title}"/></a></li>
            </c:forEach>
        </ul>
    </c:if>
</body>
</html>