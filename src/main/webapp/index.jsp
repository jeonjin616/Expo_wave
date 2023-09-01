<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<style>
	.banner {
    position: relative;
    padding-top: 144px;
  }

  .banner img {
    width: 100%; /* 이미지 너비 조정 */
    height: auto; /* 이미지 높이 자동 조정 */
  }

	p {
		font-size: 18px;
		font-weight: bold;
		color: #393939;
		padding-top: 30px;
		padding-left: 180px;
		/* margin: auto;
		transition: padding-left 0.5s ease; */
	}

	@media (max-width: 1200px) {
		p {
			padding-left: 27px;
		}
	}

</style>
<script type="text/javascript" 
	src="resources/js/jquery-3.6.1.js" ></script>
<script type="text/javascript">
$(function() {
    // 문서가 준비되면 이 코드 블록이 실행됩니다.

    // Ajax 요청을 보냅니다.
    $.ajax({
        url: "list_festival",
        success: function(data) {
            // Ajax 요청이 성공하면 이 코드 블록이 실행됩니다.
            console.log("Ajax 요청 성공:", data);
            var festivalContainer = document.getElementById("festivalContainer");
        var festivals = data.getElementsByTagName("item");

        // 최대 5개의 행만 선택
        for (var i = 0; i < 5; i++) {
            var festival = festivals[i];

            // 필요한 데이터 추출
            var name = festival.querySelector("fsv_name").textContent;
            var imgSrc = festival.querySelector("fsv_thumb").textContent;

            // 페스티벌 정보 및 이미지를 가로로 정렬하여 추가
            var festivalItem = document.createElement("div");
            festivalItem.className = "festival-item";

            var imgElement = document.createElement("img");
            imgElement.src = imgSrc;
            imgElement.alt = name + " 이미지";
						imgElement.width = 100;
						imgElement.height = 200;
						
            var festivalInfo = document.createElement("div");
            festivalInfo.className = "festival-info";
            festivalInfo.innerHTML = "<div class='festival-name'>" + name + "</div>";

            festivalItem.appendChild(imgElement);
            festivalItem.appendChild(festivalInfo);

            festivalContainer.appendChild(festivalItem);
        }
            
        },
        error: function(error) {
            // Ajax 요청이 실패한 경우 이 코드 블록이 실행됩니다.
            console.error("Ajax 요청 실패:", error);
        }
    });
    
    
    
    $.ajax({
        url: "list_show",
        success: function(data) {
            // Ajax 요청이 성공하면 이 코드 블록이 실행됩니다.
            console.log("Ajax 요청 성공:", data);
            var festivalContainer = document.getElementById("showContainer");
        var festivals = data.getElementsByTagName("item");

        // 최대 5개의 행만 선택
        for (var i = 0; i < 5; i++) {
            var festival = festivals[i];

            // 필요한 데이터 추출
            var name = festival.querySelector("show_name").textContent;
            var imgSrc = festival.querySelector("show_poster").textContent;

            // 페스티벌 정보 및 이미지를 가로로 정렬하여 추가
            var festivalItem = document.createElement("div");
            festivalItem.className = "show-item";

            var imgElement = document.createElement("img");
            imgElement.src = imgSrc;
            imgElement.alt = name + " 이미지";

            var festivalInfo = document.createElement("div");
            festivalInfo.className = "show-info";
            festivalInfo.innerHTML = "<div class='show-name'>" + name + "</div>";

            festivalItem.appendChild(imgElement);
            festivalItem.appendChild(festivalInfo);

            festivalContainer.appendChild(festivalItem);
        }
            
        },
        error: function(error) {
            // Ajax 요청이 실패한 경우 이 코드 블록이 실행됩니다.
            console.error("Ajax 요청 실패:", error);
        }
    });
});
</script>

</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="banner">
	<%@ include file="banner.jsp" %>
	</div>
	<section>
	<p>추천하는 Hot한 축제</p>
		<div class="recommend fsv" id="festivalContainer">
			
		</div>
		<p>추천하는 Hot한 공연</p>
		<div class="recommend show" id="showContainer">
			
		</div>
	</section>
</body>
</html>