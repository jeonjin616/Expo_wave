<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="referrer"
	content="no-referrer-when-downgrade" />
<link rel="stylesheet" href="resources/css/my/my.css">
<title>내게 맞는 행사</title>
</head>
<style>
.place-list-item {
	border: 1px solid #000;
	width: 250px;
	margin-bottom: 20px;
	padding: 10px;
	cursor: pointer;
}

.place-name {
	color: black;
	font-weight: bold;
}

.place-image {
	width: 100%;
	max-height: 250px;
	display: block;
	margin-top: 10px;
}
</style>
<body>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 99vh; position: relative; overflow: hidden;"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<!-- <form onsubmit="searchPlaces(); return false;"> -->
					키워드 : <input type="text" id="keyword" size="15">
					<button id="find">검색하기</button>
					<!-- </form> -->
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a3357499d511c6afc57df688db86e7f&libraries=services,clusterer"></script>
	<script type="text/javascript" src="resources/js/jquery-3.6.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$
					.ajax({
						url : "my",
						dataType : "json",
						success : function(json_array) {
							console.log(json_array)
							var markers = [];// 마커를 담을 배열입니다
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center : new kakao.maps.LatLng(
										json_array[0].fsv_lat,
										json_array[0].fsv_lon), // 지도의 중심좌표
								level : 10
							// 지도의 확대 레벨
							};
							var map = new kakao.maps.Map(mapContainer,
									mapOption); // 지도를 생성합니다
							// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
							var mapTypeControl = new kakao.maps.MapTypeControl();
							// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
							// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
							map.addControl(mapTypeControl,
									kakao.maps.ControlPosition.TOPRIGHT);
							// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
							var zoomControl = new kakao.maps.ZoomControl();
							map.addControl(zoomControl,
									kakao.maps.ControlPosition.RIGHT);
							map.setMaxLevel(12);
							// 마커 클러스터러를 생성합니다 
							var clusterer = new kakao.maps.MarkerClusterer({
								map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
								averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
								minLevel : 10
							// 클러스터 할 최소 지도 레벨 
							})

							// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
							if (navigator.geolocation) {
								// GeoLocation을 이용해서 접속 위치를 얻어옵니다
								navigator.geolocation
										.getCurrentPosition(function(position) {
											var lat = position.coords.latitude, // 위도
											lon = position.coords.longitude; // 경도
											var locPosition = new kakao.maps.LatLng(
													lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
											message = '<div style="padding:5px;">당신의 현재 위치!</div>'; // 인포윈도우에 표시될 내용입니다
											// 마커와 인포윈도우를 표시합니다
											displayMarker(locPosition, message);
										});
							} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
								var locPosition = new kakao.maps.LatLng(
										33.450701, 126.570667), message = '당신의 위치를 모르겠어요...'
								displayMarker(locPosition, message);
							}
							// 지도에 마커와 인포윈도우를 표시하는 함수입니다
							function displayMarker(locPosition, message) {
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : locPosition
								});
								var iwContent = message, // 인포윈도우에 표시할 내용
								iwRemoveable = true;
								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
									content : iwContent,
									removable : iwRemoveable
								});
								// 인포윈도우를 마커위에 표시합니다 
								infowindow.open(map, marker);
								// 지도 중심좌표를 접속위치로 변경합니다
								map.setCenter(locPosition);
							}
							// 마커를 표시할 위치와 title 객체 배열입니다 
							var positions = []
							$(json_array).each(
									function(i, json) {
										positions.push({
											title : json.fsv_name,
											latlng : new kakao.maps.LatLng(
													json.fsv_lat, json.fsv_lon)
										})
									})
							// 마커 이미지의 이미지 주소입니다
							var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
							for (var i = 0; i < positions.length; i++) {
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new kakao.maps.Size(24, 35);
								// 마커 이미지를 생성합니다    
								var markerImage = new kakao.maps.MarkerImage(
										imageSrc, imageSize);
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
									map : map, // 마커를 표시할 지도
									position : positions[i].latlng, // 마커를 표시할 위치
									title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
									image : markerImage
								// 마커 이미지 
								});
								var ps = new kakao.maps.services.Places();
								// 마커에 표시할 인포윈도우를 생성합니다 
								var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								iwPosition = new kakao.maps.LatLng(33.450701,
										126.570667), //인포윈도우 표시 위치입니다
								iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성하고 지도에 표시합니다
								var infowindow = new kakao.maps.InfoWindow({
									map : map, // 인포윈도우가 표시될 지도
									position : iwPosition,
									content : iwContent,
									removable : iwRemoveable
								});
								// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
								// 이벤트 리스너로는 클로저를 만들어 등록합니다 
								// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다

							}
							// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
							function makeOverListener(map, marker, infowindow) {
								return function() {
									infowindow.open(map, marker);
								};
							}
							// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
							function makeOutListener(infowindow) {
								return function() {
									infowindow.close();
								};
							}
							// 키워드로 장소를 검색합니다
							//searchPlaces();
							// 키워드 검색을 요청하는 함수입니다
							function searchPlaces() {
								//alert('called....')
								var keyword = document
										.getElementById('keyword').value;
								//alert(keyword)
								if (!keyword.replace(/^\s+|\s+$/g, '')) {
									alert('키워드를 입력해주세요!');
									return false;
								}
								// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
								$
										.ajax({
											url : "my2",
											data : {
												find : $('#keyword').val()
											},
											dataType : "json",
											success : function(json_array2) {
												$('#map').empty()
												console.log(json_array2)
												var markers2 = [];// 마커를 담을 배열입니다
												var mapContainer2 = document
														.getElementById('map'), // 지도를 표시할 div
												mapOption2 = {
													center : new kakao.maps.LatLng(
															json_array2[0].fsv_lat,
															json_array2[0].fsv_lon), // 지도의 중심좌표
													level : 10
												// 지도의 확대 레벨
												};
												var map2 = new kakao.maps.Map(
														mapContainer2,
														mapOption2); // 지도를 생성합니다
												// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
												var mapTypeControl2 = new kakao.maps.MapTypeControl();
												// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
												// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
												map2
														.addControl(
																mapTypeControl2,
																kakao.maps.ControlPosition.TOPRIGHT);
												// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
												var zoomControl2 = new kakao.maps.ZoomControl();
												map2
														.addControl(
																zoomControl2,
																kakao.maps.ControlPosition.RIGHT);
												map2.setMaxLevel(12);

												var positions2 = []
												$(json_array2)
														.each(
																function(i,
																		json) {
																	positions2
																			.push({
																				title : json.fsv_name,
																				latlng : new kakao.maps.LatLng(
																						json.fsv_lat,
																						json.fsv_lon)
																			})
																})
												// 마커 이미지의 이미지 주소입니다
												var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
												for (var i = 0; i < positions2.length; i++) {
													// 마커 이미지의 이미지 크기 입니다
													var imageSize = new kakao.maps.Size(
															24, 35);
													// 마커 이미지를 생성합니다    
													var markerImage = new kakao.maps.MarkerImage(
															imageSrc, imageSize);
													// 마커를 생성합니다
													var marker2 = new kakao.maps.Marker(
															{
																map : map2, // 마커를 표시할 지도
																position : positions2[i].latlng, // 마커를 표시할 위치
																title : positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
																image : markerImage
															// 마커 이미지 
															});
													var ps2 = new kakao.maps.services.Places();
													// 마커에 표시할 인포윈도우를 생성합니다 
													var infowindow2 = new kakao.maps.InfoWindow(
															{
																content : positions2[i].content
															// 인포윈도우에 표시할 내용
															});
						
												}
												// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
												function makeOverListener(map,
														marker, infowindow) {
													return function() {
														infowindow2.open(map,
																marker);
													};
												}
												// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
												function makeOutListener(
														infowindow) {
													return function() {
														infowindow2.close();
													};
												}
												//검색 데이터 부분------------------------------------
												$(document)
														.ready(
																function() {
																	$(
																			json_array2)
																			.each(
																					function(
																							i,
																							json) {
																						//console.log('fsv_id:', json.fsv_id);
																						let listItem = $(
																								'<div>')
																								.addClass(
																										'place-list-item')
																								.text(
																										json.fsv_name)
																								.hover(
																										function() {
																											let image = $(
																													'<img>')
																													.addClass(
																															'place-image')
																													.attr(
																															'src',
																															json.fsv_thumb);
																											$(
																													this)
																													.append(
																															image);
																										},
																										function() {
																											$(
																													this)
																													.find(
																															'.place-image')
																													.remove();
																										});

																						listItem
																								.click(function() {
																									//console.log('Clicked fsv_id:', json.fsv_id); 
																									var linkUrl = 'festivaldetail/'
																											+ json.fsv_id;
																									window.location.href = linkUrl;
																								});

																						$(
																								'#placesList')
																								.append(
																										listItem);
																					});
																});
												// 검색결과 항목을 Element로 반환하는 함수입니다
												function getListItem(index,
														places) {
													var el = document
															.createElement('li'), itemStr = '<span class="markerbg marker_'
															+ (index + 1)
															+ '"></span>'
															+ '<div class="info">'
															+ '   <h5>'
															+ places.place_name
															+ '</h5>';
													if (places.road_address_name) {
														itemStr += '    <span>'
																+ places.road_address_name
																+ '</span>'
																+ '   <span class="jibun gray">'
																+ places.address_name
																+ '</span>';
													} else {
														itemStr += '    <span>'
																+ places.address_name
																+ '</span>';
													}
													itemStr += '  <span class="tel">'
															+ places.phone
															+ '</span>'
															+ '</div>';
													el.innerHTML = itemStr;
													el.className = 'item';
													return el;
												}
											},
											erro : function() {
												alert('my2 error')
											}
										})
								//ps2.keywordSearch( keyword, placesSearchCB); 
							}
							// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
							function placesSearchCB(data, status, pagination) {
								if (status === kakao.maps.services.Status.OK) {
									// 정상적으로 검색이 완료됐으면
									// 검색 목록과 마커를 표출합니다
									alert('placesSearch.....')
									displayPlaces(data);
									// 페이지 번호를 표출합니다
									displayPagination(pagination);
								} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
									alert('검색 결과가 존재하지 않습니다.');
									return;
								} else if (status === kakao.maps.services.Status.ERROR) {
									alert('검색 결과 중 오류가 발생했습니다.');
									return;
								}
							}
							// 검색 결과 목록과 마커를 표출하는 함수입니다
							function displayPlaces(places) {
								alert('displayPlaces.....')
								var listEl = document
										.getElementById('placesList'), menuEl = document
										.getElementById('menu_wrap'), fragment = document
										.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
								// 검색 결과 목록에 추가된 항목들을 제거합니다
								removeAllChildNods(listEl);
								// 지도에 표시되고 있는 마커를 제거합니다
								removeMarker();
								for (var i = 0; i < places.length; i++) {
									// 마커를 생성하고 지도에 표시합니다
									var placePosition = new kakao.maps.LatLng(
											places[i].y, places[i].x), marker = addMarker(
											placePosition, i), itemEl = getListItem(
											i, places[i]); // 검색 결과 항목 Element를 생성합니다
									// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									// LatLngBounds 객체에 좌표를 추가합니다
									bounds.extend(placePosition);
									// 마커와 검색결과 항목에 mouseover 했을때
									// 해당 장소에 인포윈도우에 장소명을 표시합니다
									// mouseout 했을 때는 인포윈도우를 닫습니다
									(function(marker, title) {
										kakao.maps.event.addListener(marker,
												'mouseover', function() {
													displayInfowindow(marker,
															title);
												});
										kakao.maps.event.addListener(marker,
												'mouseout', function() {
													infowindow.close();
												});
										itemEl.onmouseover = function() {
											displayInfowindow(marker, title);
										};
										itemEl.onmouseout = function() {
											infowindow.close();
										};
									})(marker, places[i].place_name);
									fragment.appendChild(itemEl);
								}
								// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
								listEl.appendChild(fragment);
								menuEl.scrollTop = 0;
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
								map.setBounds(bounds);
							}
							// 검색결과 항목을 Element로 반환하는 함수입니다
							function getListItem(index, places) {
								var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
										+ (index + 1)
										+ '"></span>'
										+ '<div class="info">'
										+ '   <h5>'
										+ places.place_name + '</h5>';
								if (places.road_address_name) {
									itemStr += '    <span>'
											+ places.road_address_name
											+ '</span>'
											+ '   <span class="jibun gray">'
											+ places.address_name + '</span>';
								} else {
									itemStr += '    <span>'
											+ places.address_name + '</span>';
								}
								itemStr += '  <span class="tel">'
										+ places.phone + '</span>' + '</div>';
								el.innerHTML = itemStr;
								el.className = 'item';
								return el;
							}
							// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
							function addMarker(position, idx, title) {
								var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
								imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
								imgOptions = {
									spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
									spriteOrigin : new kakao.maps.Point(0,
											(idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
									offset : new kakao.maps.Point(13, 37)
								// 마커 좌표에 일치시킬 이미지 내에서의 좌표
								}, markerImage = new kakao.maps.MarkerImage(
										imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
										{
											position : position, // 마커의 위치
											image : markerImage
										});
								marker.setMap(map); // 지도 위에 마커를 표출합니다
								markers.push(marker); // 배열에 생성된 마커를 추가합니다
								return marker;
							}
							// 지도 위에 표시되고 있는 마커를 모두 제거합니다
							function removeMarker() {
								for (var i = 0; i < markers.length; i++) {
									markers[i].setMap(null);
								}
								markers = [];
							}
							// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
							function displayPagination(pagination) {
								var paginationEl = document
										.getElementById('pagination'), fragment = document
										.createDocumentFragment(), i;
								// 기존에 추가된 페이지번호를 삭제합니다
								while (paginationEl.hasChildNodes()) {
									paginationEl
											.removeChild(paginationEl.lastChild);
								}
								for (i = 1; i <= pagination.last; i++) {
									var el = document.createElement('a');
									el.href = "#";
									el.innerHTML = i;
									if (i === pagination.current) {
										el.className = 'on';
									} else {
										el.onclick = (function(i) {
											return function() {
												pagination.gotoPage(i);
											}
										})(i);
									}
									fragment.appendChild(el);
								}
								paginationEl.appendChild(fragment);
							}
							// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
							// 인포윈도우에 장소명을 표시합니다
							function displayInfowindow(marker, title) {
								var content = '<div style="padding:5px;z-index:1;">'
										+ title + '</div>';
								infowindow.setContent(content);
								infowindow.open(map, marker);
							}
							// 검색결과 목록의 자식 Element를 제거하는 함수입니다
							function removeAllChildNods(el) {
								while (el.hasChildNodes()) {
									el.removeChild(el.lastChild);
								}
							}
							$('#find').on('click', function() {
								//alert('called ---0 ')
								searchPlaces()
							})
						}//success
					})//ajax
		})//$
	</script>
</body>
</html>