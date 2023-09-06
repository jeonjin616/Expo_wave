<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Review Insert Page</title>
<!--     <link rel="stylesheet" href="header.css"> -->
<link rel="stylesheet" th:href="@{/css/style.css}"
	href="../../css/style.css"></link>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.js"></script>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            document.getElementById('preview').src = e.target.result;
        }

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<style>
form {
	padding-top: 20px;
}

h2 {
	margin-bottom: 10px;
}

hr {
	background-color: #8AAAE5;
	height: 5px; /* 굵기 조절 */
	border: 0px; /* 테두리 없애기 */
}

.main {
	margin-left: 155px;
	margin-right: 155px;
	margin-top: 40px;
	margin-bottom: 150px;
}

#review {
	padding-top: 8px;
	padding-left: 0px;
}

#title {
	width: 1045px;
	font-size: 15px;
	float: right; /* 우측 정렬 */
}

#contents {
	width: 1200px;
	height: 400px;
	font-size: 13px;
}

#autocomplete-results {
	border: 1px solid #ccc;
	max-height: 150px;
	overflow-y: auto;
}

#autocomplete-results div {
	padding: 5px;
	cursor: pointer;
}

#autocomplete-results div:hover {
	background-color: #eee;
}
/* 	table tr td{
		border-bottom: 1px solid #8AAAE5;
	} */
</style>
<script type="text/javascript">
$(document).ready(function() {
	/* $("#dropdown").change(function() {
        selectedValue = $(this).val();
	 }); */
    $("#searchText").on("keyup", function() {
        const query = $(this).val();
				const selectedValue = $("#select").val();
        
        if (query.length === 0) {
            $("#autocomplete-results").hide();
            return;
        }
				if(selectedValue === 'festival'){
					$.ajax({
			            url: 'search_fsv',
			            method: 'GET',
			            data: { 
			            	q: query
			            },
			            dataType: 'json',
			            success: function(data) {
			            	$("#autocomplete-results").empty();
			                if(data.length > 0) {
			                	console.log("2222" + data[0].fsv_id)
			                	$(data).each(function(i, json) {
			                		const resultItem = $('<div>').text(json.fsv_name).click(function() {
			                            $("#show_select").val(0);
			                            $("#fsv_select").val(json.fsv_id);
			                            $("#searchText").val(json.fsv_name);
			                            
			                            $("#autocomplete-results").hide();
			                        });
			                        $("#autocomplete-results").append(resultItem);
			                	})
			                   
			                    $("#autocomplete-results").show();
			                } else {
			                    $("#autocomplete-results").hide();
			                }
			            }
			        });
					
				} else {
					
				
        $.ajax({
            url: 'search_show',
            method: 'GET',
            data: { 
            	q: query
            },
            dataType: 'json',
            success: function(data) {
            	console.log("data >>> " + data);
            	$("#autocomplete-results").empty();
                if(data.length > 0) {
                	$("#autocomplete-results").empty();
	                if(data.length > 0) {
	                	$(data).each(function(i, json) {
	                		const resultItem = $('<div>').text(json.show_name).click(function() {
	                      
	                			$("#fsv_select").val(0);
	                			$("#show_select").val(json.show_id);
	                            $("#searchText").val(json.show_name);
	                            
	                            
	                            $("#autocomplete-results").hide();
	                        });
	                        $("#autocomplete-results").append(resultItem);
	                	})
	                   
	                    $("#autocomplete-results").show();
	                } else {
	                    $("#autocomplete-results").hide();
	                }
                    $("#autocomplete-results").show();
                } else {
                    $("#autocomplete-results").hide();
                }
            }
        });
				}
    });
});

</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="main">
		<h2>리뷰 등록하기</h2>
		<hr>
		<form action="insert" method="post" enctype="multipart/form-data">
			<input id="fsv_select" type="hidden" name="fsv_id" value=0> <input
				type="hidden" name="mem_id"
				value="<%=session.getAttribute("loginMember")%>"> <input
				id="show_select" type="hidden" name="show_id" value=0>
			<%-- <% value = "${mem_id}" %> --%>
			<table class="board_detail">
				<tr>
					<td><select id="select"
						style="width: 90px; display: inline-block;">
							<option value="">행사 선택</option>
							<option value="festival">축제</option>
							<option value="show">공연</option>
					</select></td>
					<td><input id="searchText" type="text" name="event_name"
						placeholder="Search..."
						style="width: 1045px; display: inline-block;">
						<div id="autocomplete-results"></div></td>
				</tr>
				<tr class="title">
					<td style="">제목</td>
					<td><input type="text" id="title" name="review_title"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="contents" name="review_content"></textarea>
					</td>
				</tr>
				<tr>
					<td><label>이미지 파일 첨부</label></td>
					<td style="width: 220px;"><input type="file" name="file"
						onchange="readURL(this);" style="width: 100%;" /> <img
						id="preview" src="#"
						style="max-width: 200px; max-height: 200px; align-content: flex-end;">
					</td>
				</tr>
			</table>
			<input type="submit" id="submit" value="저장" class="btn"
				style="float: right;">
		</form>



		<!-- origin code -->
		<!-- show_id : <input type="text" name="mem_id" value="apple"> <br> -->
	</div>
</body>
</html>




