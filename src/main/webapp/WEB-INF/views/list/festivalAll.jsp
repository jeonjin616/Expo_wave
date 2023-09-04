<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
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
		         var currentPage = 1; 
		         var totalPages = ${pages}; 
		         var pagesPerPageSet = 10; 
		         var totalSets = Math.ceil(totalPages / pagesPerPageSet); 

		         function updatePageLinks() {
		             var currentSet = Math.ceil(currentPage / pagesPerPageSet); 
		             //console.log('Current Set:', currentSet);
		             var startPage = (currentSet - 1) * pagesPerPageSet + 1; 
		             //console.log('Start Page:', startPage);
		             var endPage = Math.min(startPage + pagesPerPageSet - 1, totalPages); 

		             //console.log('End Page:', endPage);
		             
		             
		             $('.pagination').empty(); 
		             // Display << button
		             if (currentSet > 1) {
		             // console.log('Displaying << button');
		                 $('.pagination').append('<button class="btn btn-secondary pages" data-page="1"><<</button>');
		                 $('.pagination').append('<button class="btn btn-secondary pages"  data-page="' + Math.floor(startPage - pagesPerPageSet, 1) + '"><</button>');
		             }

		             // Display page links
		             for (var i = startPage; i <= endPage; i++) {
		            	  // console.log('Displaying page link:', i);
		                 $('.pagination').append('<button class="btn btn-secondary keyword-button pages"  data-page="' + i + '">' + i + '</button>');
		             }

		             // Display >> button
		             if (currentSet < totalSets) {
		            	// console.log('Displaying >> button');
		                 $('.pagination').append('<button class="btn btn-secondary keyword-button pages"  data-page="' + (endPage + 1) + '" >></button>');
		                 $('.pagination').append('<button class="btn btn-secondary keyword-button pages"  data-page="' + totalPages + '">>></button>');
		             }
		             
		         }

		         $(document).on('click', '.pagination .pages', function() {
		             var pageNumber = $(this).data('page');
		             
		             //console.log('Page button clicked:', pageNumber);
		             currentPage = pageNumber;
		             updatePageLinks();

		             $('.pagination .pages').removeClass('active');
		             $(`.pagination .pages[data-page="${currentPage}"]`).addClass('active');

		             loadPage(pageNumber); // 페이지 번호에 해당하는 데이터를 불러와서 표시
		             
		            // console.log('Page button clicked:', pageNumber);
		         });

		        	    function loadPage(pageNumber) {
		        	        $.ajax({
		        	            url: "festivallist2", 
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
		        	    }

		        	    
		        	    updatePageLinks();
		        	});
	
</script>
<meta charset="UTF-8">
<title>축제 목록</title>
<!-- Bootstrap CSS를 추가할 수 있습니다. -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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
    color: #8AAAE5;
} 

.pagination .active {
    background-color: #8AAAE5; 
    color: #FEFEFE;
    border-radius: 4px;
    padding: 5px 10px;
}

.colored-hr {
    border-color: #8AAAE5; 
    border-width: 4px; 
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
	<!-- <div style="margin-bottom: 20px;"></div> -->
	<div class="mb-3">
		<div class="container">
			 <div class="row" style="display:none">
			<div class="col-md-12">
				검색 창
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
			<%-- <h3>축제 목록 : ${count}</h3> --%>
			 <hr class="colored-hr">
			<div class="row2">
				<c:forEach items="${list2}" var="festival" varStatus="status">
					<div class="col-md-3">
						<div class="card">
							<!-- 이미지와 제목을 클릭하면 해당 공연의 세부 정보 페이지로 이동 -->
							<a href="<c:url value='/festivaldetail/${festival.fsv_id}'/>">
								<div class="image-container">
									<img
										src="${not empty festival.fsv_orgimg ? festival.fsv_orgimg : '../resources/img/thumb_ing.gif'}"
										alt="${festival.fsv_name}" class="card-img-top">
								</div>
								<div class="card-body">
									<h5 class="card-title truncate bold-text">${festival.fsv_name}</h5>
									<h4 class="card-title  smaller-text">${festival.fsv_start} ~ ${festival.fsv_end}</h4>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<hr class="colored-hr">
			<div class="pagination mt-3 d-flex justify-content-center">
				<!-- Previous 10 pages button -->
				<button class="btn btn-secondary pages" data-page="1"><<</button>
				<button class="btn btn-secondary pages"
					data-page="${currentPage - 10}" id="prevPageSetBtn"><</button>

				<!-- Page links -->
				<c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
					<button
						class="btn btn-secondary keyword-button pages page-item ${pageNumber == currentPage ? 'active' : ''}"
						data-page="${pageNumber}">${pageNumber}</button>
				</c:forEach>

				<!-- Next 10 pages button -->
				<button class="btn btn-secondary keyword-button pages page-item"
					data-page="${endPage + 1}" id="nextPageSetBtn">></button>
				<button class="btn btn-secondary keyword-button pages page-item"
					id="lastPageBtn" data-page="${pages}">>></button>
			</div>
		</div>
	</div>
</body>
<!-- <div style="margin-bottom: 60px;"></div> -->
</html>