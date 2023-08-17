<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주변 검색</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        .map-button {
            width: 50px;
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
        <button onclick="goBack()" class="btn btn-secondary mb-3">뒤로가기</button>
        
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
                                <button onclick="toggleMap(${status.index})" class="btn btn-primary btn-sm map-button">지도</button>
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
