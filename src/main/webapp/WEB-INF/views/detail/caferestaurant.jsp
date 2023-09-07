<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주변 검색</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .map-button {
            width: 50px;
        }
        /* 버튼 색깔과 텍스트 색깔을 변경하는 부분 */
        .btn-custom {
            background-color: #8AAAE5;
            color: #FEFEFE;
        }
    </style>
    <script>
        var currentAddress = "${param.address}".trim();

        function goBack() {
            window.history.back();
        }

        function toggleMap(index) {
            var map = document.getElementById('map-' + index);
            map.style.display = map.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <div class="container"><br>
        <button onclick="goBack()" class="btn btn-custom mb-3">뒤로가기</button> <!-- btn-secondary를 btn-custom으로 변경 -->
        
        <h2>검색 결과</h2><br>
        <c:if test="${not empty places}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>주소</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${places}" var="place" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${place.name}</td>
                            <td>${place.address}</td>
                            <td>
                                <button onclick="toggleMap(${status.index})" class="btn btn-custom btn-sm map-button">지도</button> <!-- btn-primary를 btn-custom으로 변경 -->
                                <iframe id="map-${status.index}" width="500" height="400" frameborder="0" style="border: 0; display: none;"
                                    src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDpveBLaMS1soWpg_3N-GgxLl5VM73Z--4&q=${fn:escapeXml(place.address)}"
                                    allowfullscreen></iframe>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</body>
</html>
