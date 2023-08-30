<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공연 상세</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function goBack() {
		window.history.back();
	}
</script>
</head>
<div class="container">
	<br>
	<button onclick="goBack()" class="btn btn-secondary mb-3">뒤로가기</button>
	<br>
	<br>
	<h1 class="display-4">${show.show_name}</h1>
	<br>
	<div class="row">
		<div class="col-md-6">
			<br>
			<p>
				<strong>시작일:</strong> ${show.show_start}
			</p>
			<p>
				<strong>종료일:</strong> ${show.show_end}
			</p>
			<p>
				<strong>공연장:</strong> ${show.show_place}
			</p>
			<p>
				<strong>출연진:</strong> ${show.show_actor}
			</p>
			<p>
				<strong>제작진:</strong> ${show.show_crew}
			</p>
			<p>
				<strong>런타임:</strong> ${show.show_runtime}
			</p>
			<p>
				<strong>관람연령:</strong> ${show.show_age}
			</p>
			<p>
				<strong>제작사:</strong> ${show.show_company}
			</p>
			<p>
				<strong>요금:</strong> ${show.show_charge}
			</p>
			<p>
				<strong>공연시간:</strong> ${show.show_when}
			</p>
			<p>
				<strong>줄거리:</strong> ${show.show_story}
			</p>
			<p>
				<strong>장르:</strong> ${show.show_genre}
			</p>

		</div>
		<div class="col-md-6">
			<img
				src="${empty show.show_poster ? 'https://i.postimg.cc/K8jZmpLy/001.jpg' : show.show_poster}"
				alt="${show.show_name}" class="img-fluid">
		</div>
	</div>

	<div class="container mt-5 mb-5">
		<form action="../showdetail/caferestaurant" method="get"
			class="d-flex align-items-center">
			<input type="hidden" id="addressInput" name="address" value="">
			<button type="submit" name="type" value="카페"
				class="btn btn-info mr-3">주변카페</button>
			<!-- mr-3 클래스로 버튼 사이 간격 추가 -->
			<button type="submit" name="type" value="음식점" class="btn btn-success">주변음식점</button>
			<button type="button" class="btn btn-warning"
				onclick="openParkingInfo();">주차장 정보</button>
		</form>
		<script>
		var address = "${show.show_place}".trim();
		document.getElementById("addressInput").value = address;

				function openParkingInfo() {
					var searchQuery = address + " 주변 주차장";
					var url = "https://map.kakao.com/link/search/"
							+ encodeURIComponent(searchQuery);
					window.open(url, "_blank");
				}
			</script>
	</div>

</div>

<div class="container">
	<h3>추천 공연</h3>
	<div class="row">
		<c:forEach var="recommended" items="${recommendedShow}">
			<div class="col-md-4">
				<a href="../showdetail/${recommended.show_id}"
					style="display: block; border: 1px solid #ccc; margin: 10px; padding: 10px; text-align: center;">
					<img
					src="${empty recommended.show_poster ? 'https://i.postimg.cc/K8jZmpLy/001.jpg' : recommended.show_poster}"
					alt="${recommended.show_name}"
					style="width: 100%; height: 200px; object-fit: cover;">
					<h4>${recommended.show_name}</h4>
				</a>
			</div>
		</c:forEach>
	</div>
</div>





<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
</body>
</html>
