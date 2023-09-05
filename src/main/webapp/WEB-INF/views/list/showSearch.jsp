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
	$(document).on('click', '.pages', function() {
							var pageNumber = $(this).data('page');
							var query = $('#searchInput').val();
							var link = 'showSearch?query=' + encodeURIComponent(query) + '&page=' + pageNumber;						
							window.location.href = link;
						});

		var urlParams = new URLSearchParams(window.location.search);
		var query = urlParams.get('query');
		var page = urlParams.get('page');
		if (query !== null && page !== null) {
			$('#searchInput').val(query);
			search(page);
		}
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
		
		// 페이지 버튼과 페이지네이션 작동
	    $(document).on('click', '.pagination .pages', function() {
	        var pageNumber = $(this).data('page');
	        currentPage = pageNumber;
	        updatePageLinks();

	        $('.pagination .pages').removeClass('active');
	        $(`.pagination .pages[data-page="${currentPage}"]`).addClass('active');

	        loadPage(pageNumber);
	    });
	});
		

</script>
<meta charset="UTF-8">
<title>공연 검색 결과</title>
<!-- Bootstrap CSS를 추가할 수 있습니다. -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.body {
    margin-bottom: 40px; /* Add margin at the bottom of the entire page */
}
.mb-3 {
    margin-top: 20px;
    margin-bottom: 60px;
}
.card {
    width: 250px;
    height: 380px;
    margin-bottom: 20px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* 더 부드러운 그림자 효과 */
    border: none; /* 기본 테두리 제거 */
    transition: transform 0.3s, box-shadow 0.3s; /* 호버 효과에 애니메이션 적용 */
     margin-left: 50px;
}

.card:hover {
    transform: translateY(-5px); /* 마우스 호버 시 약간 위로 올라가는 효과 */
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강화 */
}

.card-img-top {
    height: 250px;
    object-fit: cover;
}

.image-container {
    height: 250px;
    overflow: hidden;
}

.card-body {
    height: 130px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
}
.bold-text {
      font-size: 1.1rem; /* Adjust the value as needed */
    font-weight: bold; 
}

.smaller-text {
    font-size: 0.9rem; /* Adjust the value as needed */
}

.card-title {
    font-size: 1rem;
    margin-top: 10px;
    color: #333;
}
.card a {
    text-decoration: none; /* 링크의 밑줄 제거 */
}

.row2 {
    display: flex;
    flex-wrap: wrap;
    margin: -10px; /* Adjust margin for row gutter */
    justify-content: flex-start; /* 카드 간격을 유지하면서 최대한 평균 분배 */
    margin-bottom: 40px; /* 하단에 여백 주기  */
    margin-top: 40px; /* 상단에 여백 주기  */
}

.row2 .col-md-3 {
    flex: 0 0 calc(25% - 20px); /* 4개의 카드가 한 줄에 나오도록 함 */
    padding: 10px; /* Adjust padding for column gutter */
}

.pagination {
	display: flex;
	list-style: none;
	padding: 0;
	margin: 0;
}

.pagination .page-item {
	margin: 0 5px;
}

.pagination .page-link {
    text-decoration: none;
    color: #333; /* Change the color to your desired value */
}

.pagination .active {
    background-color: #0511f7; /* Your chosen active page background color */
    color: white;
    border-radius: 4px;
    padding: 5px 10px;
}
.colored-hr {
    border-color: #8AAAE5; /* 원하는 색상을 여기에 지정하세요. */
    border-width: 4px; /* 원하는 두께를 여기에 지정하세요. */
}
h3 {
    color: #8AAAE5; /* 원하는 색상을 여기에 지정하세요. */
}
.keyword-button.pages {
    color: #FEFEFE; 
}


.btn.pages {
    background-color: #8AAAE5; 
     border: none;
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
		<h3>'${query}' 에 대한 공연 검색 결과 </h3>

		<hr class="colored-hr">
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
								<h5 class="card-title truncate bold-text">${show.show_name}</h5>
								<h5 class="card-title smaller-text">${show.show_start} ~ ${show.show_end}</h5>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
		<hr class="colored-hr">
		
   <div class="pagination mt-3 d-flex justify-content-center">
	 <c:choose>
        <c:when test="${pages <= 10}">
            <!-- Display all page links when total pages are 10 or less -->
            <c:forEach begin="1" end="${pages}" var="pageNumber">
                <button class="btn btn-secondary keyword-button pages ${page == pageNumber ? 'active' : ''}"
                    data-page="${pageNumber}">${pageNumber}</button>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <!-- Display page numbers with current page centered -->
            <c:choose>
                <c:when test="${page <= 5}">
                    <!-- Display first 10 pages -->
                    <c:forEach begin="1" end="10" var="pageNumber">
                        <button class="btn btn-secondary keyword-button pages ${page == pageNumber ? 'active' : ''}"
                            data-page="${pageNumber}">${pageNumber}</button>
                    </c:forEach>
                </c:when>
                <c:when test="${page > pages - 5}">
                    <!-- Display last 10 pages -->
                    <c:forEach begin="${pages - 9}" end="${pages}" var="pageNumber">
                        <button class="btn btn-secondary keyword-button pages ${page == pageNumber ? 'active' : ''}"
                            data-page="${pageNumber}">${pageNumber}</button>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <!-- Display pages with current page centered -->
                    <c:forEach begin="${page - 5}" end="${page + 4}" var="pageNumber">
                        <button class="btn btn-secondary keyword-button pages ${page == pageNumber ? 'active' : ''}"
                            data-page="${pageNumber}">${pageNumber}</button>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>

	</div>
	</div>
</body>
<!-- <div style="margin-bottom: 60px;"></div> -->
</html>