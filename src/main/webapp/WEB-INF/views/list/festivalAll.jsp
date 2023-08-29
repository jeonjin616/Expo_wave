<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
    <script type="text/javascript">
	$(function(){
		$('.pages').click(function() {
			//alert($(this).text())
			$.ajax({
				url : "festivallist2", //views/list/festivallist2.jsp가 결과!
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					//alert(result)
					$('.row2').html(result)
				},
				error : function() {
					alert('페이지 로딩에 실패했습니다.')
				}
			}) //ajax
		})
		  $('#searchBtn').click(function(event) {
		        event.preventDefault(); // 기본 동작 중단

		        var query = $('#searchInput').val(); // 검색어 가져오기
		        var pageNumber = 1; // 처음 검색할 때는 1페이지부터 시작

		        var link = 'festivalSearch?query=' + encodeURIComponent(query) + '&page=' + pageNumber; // 링크 생성
		        window.location.href = link; // 새로운 페이지로 이동
		    });

		    // 엔터 키를 눌렀을 때 검색 실행
		    $('#searchInput').keypress(function(event) {
		        if (event.which === 13) { // 13은 엔터 키의 keyCode 값
		            $('#searchBtn').click(); // 검색 버튼 클릭 이벤트 호출
		        }
		    });

		        // 검색 함수
		         function search(pageNumber) {
		            var query = $('#searchInput').val();
		            if (query !== "") {
		                $.ajax({
		                    url: "festivalSearch",
		                    data: {
		                        query: query,
		                        page: pageNumber
		                    },
		                    success: function(result) { // 성공적으로 응답이 돌아왔을 때 처리
		                        $('.row2').html(result);// 검색 결과를 표시할 영역에 결과 업데이트
		                    },
		                    error: function() {
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

		         $(document).on('click', '.pagination .pages', function() {
		        	    var pageNumber = $(this).data('page');
		        	    currentPage = pageNumber; // Update current page
		        	    updatePageLinks(); // Update pagination links

		        	    // Remove active class from all page links
		        	    $('.pagination .pages').removeClass('active');

		        	    // Add active class to the clicked page link
		        	    $(this).addClass('active');

		        	    loadPage(pageNumber); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		        	});

		         $(document).on('click', '#nextPageSetBtn', function() {
		             currentPage += 10; // Move to the next set of pages
		             updatePageLinks(); // Update pagination links
		             loadPage(currentPage); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		         });

		         $(document).on('click', '#prevPageSetBtn', function() {
		             currentPage -= 10; // Move to the previous set of pages
		             updatePageLinks(); // Update pagination links
		             loadPage(currentPage); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		         });

		         function loadPage(pageNumber) {
		             $.ajax({
		                 url: "festivallist2", // 페이지 데이터를 가져올 URL 설정
		                 data: {
		                     page: pageNumber
		                 },
		                 success: function(result) {
		                     $('.row2').html(result); // 검색 결과를 표시할 영역에 결과 업데이트
		                 },
		                 error: function() {
		                     alert('페이지 로딩에 실패했습니다.');
		                 }
		             });
		         }

		         // Initial call to update pagination links
		         updatePageLinks();
		     })
</script>
<meta charset="UTF-8">
<title>축제 목록</title>
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
        .pagination {
        display: flex;
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .pagination .page-item {
        margin: 0 5px;
    }

    .pagination .active {
        background-color: #0511f7; /* 원하는 강조 색상으로 변경 */
        color: white;
        border-radius: 4px;
        padding: 5px 10px;
    }

    .pagination .page-link {
        text-decoration: none;
    }
</style>
</head>
<body>
 <jsp:include page="/header.jsp" />
<div class="mb-3">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- 검색 창 -->
				<div class="input-group mt-3">
					<input type="text" id="searchInput" class="form-control" placeholder="검색어를 입력하세요">
					<div class="input-group-append">
						<a id="searchBtn" class="btn btn-primary"
							href="festivalSearch?page=1">검색</a>
					</div>
				</div>
			</div>
		</div>
	<br>
				<h3>축제 목록 : ${count}</h3>
				
				<hr color="white">
<hr color="white">
		 <div class="row2">
        <c:forEach items="${list2}" var="festival" varStatus="status">
            <div class="col-md-3">
                <div class="card">
                    <!-- 이미지와 제목을 클릭하면 해당 공연의 세부 정보 페이지로 이동 -->
                    <a href="<c:url value='/festivaldetail/${festival.fsv_id}'/>">
                        <div class="image-container">
                            <img src="${not empty festival.fsv_orgimg ? festival.fsv_orgimg : '../resources/img/thumb_ing.gif'}"
                                 alt="${festival.fsv_name}" class="card-img-top">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${festival.fsv_name}</h5>
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