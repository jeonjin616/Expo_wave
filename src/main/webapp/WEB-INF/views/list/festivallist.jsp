<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 목록</title>
<!-- Bootstrap CSS를 추가할 수 있습니다. -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
.card {
	width: 250px;
	height: 380px; /* 이미지와 내용을 함께 고려한 높이 조절 */
	margin-bottom: 20px; /* 카드 사이 간격 설정 */
}

.card-img-top {
	height: 250px; /* 이미지 높이 조절 */
	object-fit: cover; /* 이미지를 카드에 맞추어 보이도록 설정 */
}

.image-container {
	height: 250px; /* 이미지 컨테이너 높이 조절 */
	overflow: hidden; /* 이미지가 컨테이너를 넘어가지 않도록 설정 */
}

.card-body {
	height: 130px; /* 내용 영역 높이 조절 */
}
.card-body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center; /* 가로 정렬을 위해 추가 */
	text-align: center; /* 텍스트 가운데 정렬 */
}
</style>
</head>
<body>
 <jsp:include page="/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- 검색 창 -->
				<div class="input-group mt-3">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">검색</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-12">
				<!-- 키워드 버튼 -->
				<button class="btn btn-secondary keyword-button" data-keyword="키워드1">키워드1</button>
				<button class="btn btn-secondary keyword-button" data-keyword="키워드2">키워드2</button>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- 배너 -->
				<div class="jumbotron mt-3">
					<h1 class="display-4">축제 정보 안내</h1>
					<p class="lead">이곳은 축제 정보를 제공하는 사이트입니다. 다양한 축제 정보를 확인하세요.</p>
					<hr class="my-4">
					<p>더 많은 축제 정보와 세부 내용은 아래에서 확인하세요.</p>
					<a class="btn btn-primary btn-lg" href="#" role="button">자세히 보기</a>
				</div>
			</div>
		</div>
		<body>
			<div class="container">
				<h1>축제 목록</h1>
				<div class="row">
					<c:forEach items="${festival}" var="festival" varStatus="status">
						<div class="col-md-3">
							<div class="card">
								<!-- 이미지와 제목을 클릭하면 해당 공연의 세부 정보 페이지로 이동 -->
								<a href=<c:url value='/festivaldetail/${festival.fsv_id}'/>>
									<div class="image-container">
										<img
											src="${not empty festival.fsv_orgimg ? festival.fsv_orgimg : '/resources/img/thumb_ing.gif'}"
											
											alt="${festival.fsv_name}" class="card-img-top">
										<%-- <img
					src="${empty festival.fsv_orgimg ? '/resources/img/thumb_ing.gif' : festival.fsv_orgimg}"
				alt="${festival.fsv_name}" class="card-img-top"> --%>
									</div>
									<div class="card-body">
										<h5 class="card-title">${festival.fsv_name}</h5>
									</div>
								</a>
							</div>
						</div>
						<c:if test="${status.count % 4 == 0}">
				</div>
				<div class="row">
					</c:if>
					</c:forEach>
				</div>
			</div>
		</body>
</html>