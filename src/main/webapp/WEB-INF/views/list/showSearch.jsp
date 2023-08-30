<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function() {
		// 페이지 버튼 클릭 이벤트 처리
		$(document)
				.on(
						'click',
						'.pages',
						function() {
							var pageNumber = $(this).data('page');
							var query = $('#searchInput').val();
							var link = 'showSearch?query='
									+ encodeURIComponent(query) + '&page='
									+ pageNumber;
							window.location.href = link;
						});

		var urlParams = new URLSearchParams(window.location.search);
		var query = urlParams.get('query');
		var page = urlParams.get('page');
		if (query !== null && page !== null) {
			$('#searchInput').val(query);
			search(page);
		}
		/* $('.pagination .pages').click(function() {
		    var pageNumber = $(this).text(); // 클릭한 페이지 번호 가져오기
		    $.ajax({
		        url: "searchResults2", //views/list/showlist2.jsp가 결과!
		        data: {
		            page: pageNumber
		        },
		        success: function(result) {
		            $('.row2').html(result);
		        },
		        error: function() {
		            alert('페이지 로딩에 실패했습니다.');
		        }
		    });
		}); */
		// 검색 버튼 클릭 이벤트 처리
		$('#searchBtn').click(
				function(event) {
					event.preventDefault(); // 기본 동작 중단

					var query = $('#searchInput').val(); // 검색어 가져오기
					if (query !== "") {
						var link = 'showSearch?query='
								+ encodeURIComponent(query) + '&page=1';
						window.location.href = link;
					}
				});

		// 엔터 키를 눌렀을 때 검색 실행
		$('#searchInput').keypress(
				function(event) {
					if (event.which === 13) {
						event.preventDefault(); // 기본 동작 중단

						var query = $('#searchInput').val();
						if (query !== "") {
							var link = 'showSearch?query='
									+ encodeURIComponent(query) + '&page=1';
							window.location.href = link;
						}
					}
				});

		// 검색 함수

		function search(pageNumber) {
			var query = $('#searchInput').val();
			if (query !== "") {
				$.ajax({
					url : "showSearch2",
					data : {
						query : query,
						page : pageNumber
					},
					success : function(result) {
						$('.row2').html($(result).find('.row2').html());
					},
					error : function() {
						alert('검색 실패했습니다.');
					}
				});
			}
		}
		  var currentPage = 1; // Initialize current page
		    var totalPages = ${pages}; // Your server-side value

		    function updatePageLinks() {
		        var startPage = currentPage; // Starting page of the current set
		        var endPage = startPage + 9; // Ending page of the current set
		        endPage = Math.min(endPage, totalPages); // Limit to actual total pages

		        $('.pagination').empty(); // Clear existing pagination buttons

		        // Display << button
		        if (startPage > 1) {
		            $('.pagination').append('<button class="btn btn-secondary pages" data-page="1"><<</button>');
		            $('.pagination').append('<button class="btn btn-secondary pages" data-page="' + (startPage - 1) + '"><</button>');
		        }

		        // Display page links
		        for (var i = startPage; i <= endPage; i++) {
		            $('.pagination').append('<button class="btn btn-secondary keyword-button pages" data-page="' + i + '">' + i + '</button>');
		        }

		        // Display >> button
		        if (endPage < totalPages) {
		            $('.pagination').append('<button class="btn btn-secondary keyword-button pages" data-page="' + (startPage + 1) + '" >></button>');
		            $('.pagination').append('<button class="btn btn-secondary keyword-button pages" id="lastPageBtn" data-page="' + totalPages + '">>></button>');
		        }
		    }

		    updatePageLinks(); // Initial call to update pagination links

		    $(document).on('click', '.pagination .pages', function() {
		        var pageNumber = $(this).data('page');
		        currentPage = pageNumber; // Update current page
		        updatePageLinks(); // Update pagination links
		        $('.pagination .pages').removeClass('active'); // Remove active class from all page links
		        $(this).addClass('active'); // Add active class to the clicked page link
		        loadPage(pageNumber); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		    });

		    $(document).on('click', '#prevPageSetBtn', function() {
		        currentPage -= 10; // Move to the previous set of pages
		        updatePageLinks();
		        loadPage(currentPage); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		    });

		    $(document).on('click', '#nextPageSetBtn', function() {
		        currentPage += 10; // Move to the next set of pages
		        updatePageLinks();
		        loadPage(currentPage); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		    });

		    $(document).on('click', '#lastPageBtn', function() {
		        var lastPageNumber = totalPages - totalPages % 10; // Calculate last page in the current set
		        currentPage = lastPageNumber + 1; // Move to the next set of pages
		        updatePageLinks();
		        loadPage(currentPage); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		    });
		});
</script>
<meta charset="UTF-8">
<title>공연 목록</title>
<!-- Bootstrap CSS를 추가할 수 있습니다. -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
 <jsp:include page="/header.jsp" />
<div class="mb-3">
	<div class="container">
		<div class="row"  style="display:none">
			<div class="col-md-12">
				<!-- 검색 창 -->
				<div class="input-group mt-3">
					<input type="text" id="searchInput" class="form-control"
						placeholder="">
					<div class="input-group-append">
						<a id="searchBtn" class="btn btn-primary"
							href="searchResults?page=1">검색</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<h3>'${query}' 에 대한 공연 검색 결과 : ${count}</h3>

		<hr color="white">
		<div class="row2">
			<c:forEach items="${showSearch}" var="show" varStatus="status">
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
		<hr color="white">
		<div class="pagination mt-3 d-flex justify-content-center">
			<button class="btn btn-secondary pages" data-page="1"><<</button>
			<button class="btn btn-secondary pages" data-page="${pages - 1}"
				id="prevPageSetBtn"><</button>
			<c:choose>
				<c:when test="${pages <= 10}">
					<!-- Display all page links when total pages are 10 or less -->
					<c:forEach begin="1" end="${pages}" var="pageNumber">
						<button
							class="btn btn-secondary keyword-button pages page-item ${pageNumber == currentPage ? 'active' : ''}"
							data-page="${pageNumber}">${pageNumber}</button>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<!-- Display the first 10 pages -->
					<c:forEach begin="1" end="10" var="pageNumber">
						<button
							class="btn btn-secondary keyword-button pages page-item ${pageNumber == currentPage ? 'active' : ''}"
							data-page="${pageNumber}">${pageNumber}</button>
					</c:forEach>
					<!-- Add the navigation buttons for the next set of pages -->
					<button class="btn btn-secondary keyword-button pages page-item"
						data-page="${pages + 1}" id="nextPageSetBtn">></button>
					<button class="btn btn-secondary keyword-button pages page-item"
						id="lastPageBtn" data-page="${pages}">>></button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</div>
</body>
</html>