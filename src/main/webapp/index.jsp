<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<script type="text/javascript" src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
	// Ajax 요청을 보냅니다.
	$(function() {
		// 문서가 준비되면 이 코드 블록이 실행됩니다.

		$
				.ajax({
					url : "list_festival",
					success : function(data) {
						// Ajax 요청이 성공하면 이 코드 블록이 실행됩니다.
						console.log("Ajax 요청 성공:", data);
						var festivalContainer = document
								.getElementById("festivalContainer");
						var festivals = data.getElementsByTagName("item");

						// 최대 5개의 행만 선택
						for (var i = 0; i < 4; i++) {
							var festival = festivals[i];

							// 필요한 데이터 추출

							var id = festival.querySelector("fsv_id").textContent;
							var name = festival.querySelector("fsv_name").textContent;
							var imgSrc = festival.querySelector("fsv_thumb").textContent;
							if (!imgSrc) {
								imgSrc = defaultImageSrc; // Use the default image if no image data is available.
							}
							var defaultImageSrc = 'resources/img/thumb_ing.gif';
							// 이미지를 클릭할 때 이동할 동적 URL 설정
							var linkUrl = 'festivaldetail/' + id; // 동적 URL 생성

							// 페스티벌 정보 및 이미지를 가로로 정렬하여 추가
							var festivalItem = document.createElement("div");
							festivalItem.className = "festival-item";

							var linkElement = document.createElement("a");
							linkElement.href = linkUrl; // 이미지 클릭 시 이동할 동적 URL 설정

							var imgElement = document.createElement("img");
							imgElement.src = imgSrc;
							imgElement.alt = name + " 이미지";

							var festivalInfo = document.createElement("div");
							festivalInfo.className = "festival-info";
							festivalInfo.innerHTML = "<div class='festival-name'>"
									+ name + "</div>";

							linkElement.appendChild(imgElement); // <a> 태그 내에 이미지 추가
							festivalItem.appendChild(linkElement); // 링크된 이미지를 festivalItem에 추가
							festivalItem.appendChild(festivalInfo); // 페스티벌 정보를 festivalItem에 추가

							festivalContainer.appendChild(festivalItem);
						}

					},
					error : function(error) {
						// Ajax 요청이 실패한 경우 이 코드 블록이 실행됩니다.
						console.error("Ajax 요청 실패:", error);
					}
				});

		$.ajax({
			url : "list_show",
			success : function(data) {
				// Ajax 요청이 성공하면 이 코드 블록이 실행됩니다.
				console.log("Ajax 요청 성공:", data);
				var showContainer = document.getElementById("showContainer");
				var shows = data.getElementsByTagName("item");

				// 최대 5개의 행만 선택
				for (var i = 0; i < 4; i++) {
					var show = shows[i];

					// 필요한 데이터 추출
					var id = show.querySelector("show_id").textContent;
					var name = show.querySelector("show_name").textContent;
					var imgSrc = show.querySelector("show_poster").textContent;
					if (!imgSrc) {
						imgSrc = defaultImageSrc; // Use the default image if no image data is available.
					}
					var defaultImageSrc = 'resources/img/thumb_ing.gif';

					// 이미지를 클릭할 때 이동할 동적 URL 설정
					var linkUrl = 'showdetail/' + id; // 동적 URL 생성

					// 페스티벌 정보 및 이미지를 가로로 정렬하여 추가
					var showItem = document.createElement("div");
					showItem.className = "show-item";

					var linkElement = document.createElement("a");
					linkElement.href = linkUrl; // 이미지 클릭 시 이동할 동적 URL 설정

					var imgElement = document.createElement("img");
					imgElement.src = imgSrc;
					imgElement.alt = name + " 이미지";

					var showInfo = document.createElement("div");
					showInfo.className = "show-info";
					showInfo.innerHTML = "<div class='show-name'>" + name
							+ "</div>";

					linkElement.appendChild(imgElement); // <a> 태그 내에 이미지 추가
					showItem.appendChild(linkElement); // 링크된 이미지를 showItem에 추가
					showItem.appendChild(showInfo); // 페스티벌 정보를 showItem에 추가

					showContainer.appendChild(showItem); // showItem을 컨테이너에 추가
				}

			},
			error : function(error) {
				// Ajax 요청이 실패한 경우 이 코드 블록이 실행됩니다.
				console.error("Ajax 요청 실패:", error);
			}
		});
	});
</script>
<style>
.header {
	 position: relative;
    margin-top: 200px; 
}

#header {
	padding-top: 0px;
	padding-bottom: 0px;
	width: 100%;
} 

.banner {
	position: relative;
	margin-top: 25px;
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
	padding-left: 110px;

}

@media ( max-width : 1200px) {
	p {
		padding-left: 27px;
	}
}

.recommend {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	margin: 0;
}

.festival-item, .show-item {
	width: calc(20% - 10px);
	height: 200px;
	margin: 5px;
	text-align: center;
	padding: 0 10px;
}

.festival-item img, .show-item img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

p {
	margin-bottom: 20px;
	margin-top: 20px;
}

#festivalContainer {
	margin-top: 20px;
}

#showContainer {
	margin-top: 20px;
	margin-bottom: 150px;
}

.festival-item img, .show-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 10px; /* 이미지 모서리 둥글게 만들기 */
    border: 2px solid lightgray; /* 테두리 추가 */
}

</style>
</head>
<body>
	<div class="header"></div>
	<%@ include file="header.jsp"%>
	<div class="banner"></div>
	<%@ include file="banner.jsp"%>
	</div>
	<section>
		<p>추천하는 Hot한 축제</p>
		<div class="recommend fsv" id="festivalContainer"></div>
		<br><br><br><br>
		<hr style="width: 1100px; background-color: #8AAAE5;">
		<p>추천하는 Hot한 공연</p>
		<div class="recommend show" id="showContainer"></div>
	</section>
</body>
</html>