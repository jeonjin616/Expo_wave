<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page Banner</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<script type="text/javascript" src="resources/js/jquery-3.6.1.js"></script>
<script type="text/javascript">
	var shows = [];
	var currentIndex = 0;
	
	function loadBanner() {
	  var showContainer = document.getElementById("showbanner");
	  showContainer.innerHTML = '';
	
	  if (shows.length > 0) {
	    var show = shows[currentIndex];
	    var imgSrc = show.imgSrc;
	    var name = show.name;
	    var linkUrl = show.linkUrl;
	
	    var imgElement = document.createElement("img");
	        imgElement.src = imgSrc;
	        imgElement.alt = name + " 이미지";
	
	    var linkElement = document.createElement("a");
	        linkElement.href = linkUrl;
	        linkElement.appendChild(imgElement);
	
	        showContainer.appendChild(linkElement);
	    }
	}
	
	$(function() {
	  $.ajax({
		  url: "list_show",
	    success: function(data) {
	      console.log("Ajax 요청 성공:", data);
	      var showsData = data.getElementsByTagName("item");
	
	      for (var i = 0; i < showsData.length; i++) {
	           var show = showsData[i];
	           var id = show.querySelector("show_id").textContent;
	           var name = show.querySelector("show_name").textContent;
	           var imgSrc = show.querySelector("show_poster").textContent;
	           var linkUrl = 'showdetail/' + id;
	
	               shows.push({ imgSrc: imgSrc, name: name, linkUrl: linkUrl });
	            }
	
	            loadBanner();
	
	           
	            setInterval(function() {
	                if (shows.length > 0) {
	                    currentIndex = (currentIndex + 1) % shows.length;
	                    loadBanner();
	                }
	            }, 3000); 
	        },
	        error: function(error) {
	            console.error("Ajax 요청 실패:", error);
	        }
	    });
	
	    $("#prevButton").click(function() {
	        if (shows.length > 0) {
	            currentIndex = (currentIndex - 1 + shows.length) % shows.length;
	            loadBanner();
	        }
	    });
	
	    $("#nextButton").click(function() {
	        if (shows.length > 0) {
	            currentIndex = (currentIndex + 1) % shows.length;
	            loadBanner();
	        }
	    });
	});
</script>
<style>
   	body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    #bannerContainer {
      display: flex;
      align-items: center;
      justify-content: center;
    }

    #showbanner {
      width: 1380px; 
      max-height: 100%;
      overflow: hidden;
      text-align: center;
    }

    #showbanner img {
      width: 100%; 
      height: 350px; 
      object-fit: cover; 
    }

    #prevButton,
    #nextButton {
      margin-top: 20px;
      background: transparent;
      border: none;
      cursor: pointer;
      font-size: 24px;
    }

    #prevButton {
      margin-right: 20px; 
    }

    #nextButton {
      margin-left: 20px; 
    }
</style>
<body>
  <div id="bannerContainer">
  	<button id="prevButton"><i class="fas fa-chevron-left"></i></button>
      <div id="showbanner">
      	<!-- The banner content will be loaded here -->
      </div>
      <button id="nextButton"><i class="fas fa-chevron-right"></i></button>
   </div>
</body>
</html>