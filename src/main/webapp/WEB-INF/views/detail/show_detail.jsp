<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공연 상세</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* 추가적인 CSS 스타일링을 원하는 경우 여기에 작성하세요 */
.container {
	margin-top: 50px;
}

.img-container {
	text-align: center;
}

.custom-img {
	max-width: 100%;
	height: auto;
}

.mb-5 {
	margin-bottom: 5rem;
}

.btn-1 {
margin-left: 20px;
	background: #8AAAE5;
	background: linear-gradient(0deg, #8AAAE5 0%,
		#8AAAE5 100%);
	border: none;
}

.btn-1:hover {
	background: #8AAAE5;
	background: linear-gradient(0deg, #8AAAE5 0%,
		#8a8de5 100%);
}

.custom-img {
  width: 450px; 
  height: 650px; 
  object-fit: cover;
  margin-right: -100px;
}

.display-4 {
  font-size: 2rem; 
  word-wrap: break-word; 
   margin-left: 5px;
}

.form-container {
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.col-md-6 strong {
  font-size: 1.2rem;
  margin-left: 20px;
}

.form-button {
	margin-right: 10px;
	width: 130px;
	height: 40px;
	line-height: 42px;
	padding: 0;
	border: none;
	border-radius: 5px;
	background: #8AAAE5;
	background: #8AAAE5;
	position: relative;
	overflow: hidden;
	cursor: pointer;
}

.form-button span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
}

.form-button:before, .form-button:after {
	position: absolute;
	content: "";
	right: 0;
	top: 0;
	background: #8AAAE5;
	transition: all 0.3s ease;
}

.form-button:before {
	height: 0%;
	width: 2px;
}

.form-button:after {
	width: 0%;
	height: 2px;
}

.form-button:hover {
	background: transparent;
	box-shadow: none;
}

.form-button:hover:before {
	height: 100%;
}

.form-button:hover:after {
	width: 100%;
}

.form-button span:hover {
	color: #8AAAE5;
}

.form-button span:before, .form-button span:after {
	position: absolute;
	content: "";
	left: 0;
	bottom: 0;
	background: #8AAAE5;
	transition: all 0.3s ease;
}

.form-button span:before {
	width: 2px;
	height: 0%;
}

.form-button span:after {
	width: 0%;
	height: 2px;
}

.form-button span:hover:before {
	height: 100%;
}

.form-button span:hover:after {
	width: 100%;
}

.inner-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.col-md-4 {
  flex: 0 0 calc(33.33% - 20px); /* 원하는 간격으로 조정하세요 */
  margin-bottom: 20px; /* 원하는 간격으로 조정하세요 */
}

.col-md-4 a {
  display: block;
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
}

.col-md-4 img {
  width: 400px;
  height: 200px;
  object-fit: cover;
}

.col-md-4 h4 {
  margin-top: 10px;
}
a {
  text-decoration: none; 
  color: black; 
  color: #666666;
  font-size: 14px;
}
</style>
</head>
<div class="container">
	<br>
	
	<button onclick="goBack()" class="btn btn-secondary mb-3 btn-1">뒤로가기</button>
	
	<br> <br>
	<h1 class="display-4"><strong>${show.show_name}</strong></h1>
	<br>
	<div class="row">
		<div class="col-md-6">
			<br>
			<p>
				<strong style="font-size: 1.2rem;">시작일:</strong> ${show.show_start}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">종료일:</strong> ${show.show_end}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">공연장:</strong> ${show.show_place}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">출연진:</strong> ${show.show_actor}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">제작진:</strong> ${show.show_crew}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">런타임:</strong>
				${show.show_runtime}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">관람연령:</strong> ${show.show_age}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">제작사:</strong>
				${show.show_company}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">요금:</strong> ${show.show_charge}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">공연시간:</strong> ${show.show_when}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">줄거리:</strong> ${show.show_story}
			</p>
			<p>
				<strong style="font-size: 1.2rem;">장르:</strong> ${show.show_genre}
			</p>

		</div>
		<div class="col-md-6">
			<div class="img-container">
				<img
					src="${empty show.show_poster ? 'https://i.postimg.cc/K8jZmpLy/001.jpg' : show.show_poster}"
					alt="${show.show_name}" class="img-fluid custom-img">
			</div>
		</div>
	</div>

	<div class="container mt-5 mb-5">
		<form action="../showdetail/caferestaurant" method="get"
			class="form-container">
			<input type="hidden" id="addressInput" name="address" value="">
			<button type="submit" name="type" value="카페"
				class="form-button btn-3">주변카페</button>
			<!-- mr-3 클래스로 버튼 사이 간격 추가 -->
			<button type="submit" name="type" value="음식점"
				class="form-button btn-3">주변음식점</button>
			<button type="button" class="form-button btn-3"
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
	<br>
	<div class="inner-container">
	<div class="row">
		<c:forEach var="recommended" items="${recommendedShow}">
			<div class="col-md-4">
				<a href="../showdetail/${recommended.show_id}"> <img
					src="${empty recommended.show_poster ? 'https://i.postimg.cc/K8jZmpLy/001.jpg' : recommended.show_poster}"
					alt="${recommended.show_name}">
					<h4>${recommended.show_name}</h4>
				</a>
			</div>
		</c:forEach>
	</div>
	</div>
</div>





<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.1/js/bootstrap.min.js"></script>
	<script>
	function goBack() {
		window.history.back();
	}
</script>
</body>
</html>
