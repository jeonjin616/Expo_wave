<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<script type="text/javascript"
	src="${contextPath}/resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function() {
		// 페이지 버튼 클릭 이벤트 처리
	$('.pages').click(function() {
    var pageNumber = $(this).text();
    var query = $('#searchInput').val(); // 검색어 가져오기

    $.ajax({
        url: "searchResults2",
        data: {
            page: pageNumber,
            query: query
        },
        success: function(result) {
            $('.row2').html(result); // 검색 결과를 표시할 영역에 결과 업데이트
        },
        error: function() {
            alert('페이지 로딩에 실패했습니다.');
        }
    });
});

		$('.pagination .pages').click(function() {
			var pageNumber = $(this).text(); // 클릭한 페이지 번호 가져오기
			search(pageNumber); // 해당 페이지에서 검색 실행
		});
		// 검색 버튼 클릭 이벤트 처리
		$('#searchBtn').click(
				function(event) {
					event.preventDefault(); // 기본 동작 중단

					var query = $('#searchInput').val(); // 검색어 가져오기
					if (query !== "") {
						var link = 'searchResults?query='
								+ encodeURIComponent(query) + '&page=1'; // 새로운 페이지 링크 생성
						window.location.href = link; // 새로운 페이지로 이동
					}
				});

		// 엔터 키를 눌렀을 때 검색 실행
		$('#searchInput').keypress(
				function(event) {
					if (event.which === 13) { // 13은 엔터 키의 keyCode 값
						event.preventDefault(); // 기본 동작 중단

						var query = $('#searchInput').val(); // 검색어 가져오기
						if (query !== "") {
							var link = 'searchResults?query='
									+ encodeURIComponent(query) + '&page=1'; // 새로운 페이지 링크 생성
							window.location.href = link; // 새로운 페이지로 이동
						}
					}
				});

		// 검색 함수
		function search(pageNumber) {
			var query = $('#searchInput').val();
			if (query !== "") {
				$.ajax({
					url : "searchResults",
					data : {
						query : query,
						page : pageNumber
					},
					success : function(result) {
						$('.row2').html(result);
						//window.location.reload(); // 현재 페이지 리프레시
					},
					error : function() {
						alert('검색 실패했습니다.');
					}
				});
			}
		}
	});
</script>
<meta charset="UTF-8">
<title>공연 목록</title>
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

.row2 {
	display: flex;
	flex-wrap: wrap;
	margin: -10px; /* Adjust margin for row gutter */
}

.row2 .col-md-3 {
	padding: 10px; /* Adjust padding for column gutter */
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- 검색 창 -->
				<div class="input-group mt-3">
					<input type="text" id="searchInput" class="form-control"
						placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<a id="searchBtn" class="btn btn-primary"
							href="searchResults?page=1">검색</a>
					</div>
				</div>
			</div>
		</div>
		<hr color="white">
		<h3>검색 결과 : ${count}</h3>
		<hr color="white">
		<!-- 페이지 버튼 -->
		<div class="pagination mt-3">
			<c:forEach begin="1" end="${pages}" var="page">
				<button class="btn btn-secondary pages">${page}</button>
			</c:forEach>
		</div>
		<hr color="white">
		<div class="row2">
			<c:forEach items="${searchResults}" var="show" varStatus="status">
				<div class="col-md-3">
					<div class="card">
						<a href="<c:url value='/showdetail/'/>${show.show_id}">
							<div class="image-container">
								<img
									src="${not empty show.show_poster ? show.show_poster : '../resources/img/thumb_ing.gif'}"
									alt="${show.show_name}" class="card-img-top">
							</div>
							<div class="card-body">
								<h5 class="card-title">${show.show_name}</h5>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>