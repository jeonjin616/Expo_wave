// infinityScroll.js

// 무한 스크롤을 위한 변수들 설정
var loading = false;
var page = 2; // 최초에 로드된 페이지 다음부터 시작

// 스크롤 이벤트 감지
window.addEventListener("scroll", function() {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100) {
        loadMore();
    }
});

// 데이터를 불러오는 함수
function loadMore() {
    if (!loading) {
        loading = true;
        
        // AJAX를 사용하여 추가 데이터 요청
        var xhr = new XMLHttpRequest();
        xhr.open("GET", contextPath + "/instar/instarpage?page=" + page, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var newCards = JSON.parse(xhr.responseText);
                appendCards(newCards);
                loading = false;
                page++;
            }
        };
        xhr.send();
    }
}

// 새로운 카드를 화면에 추가하는 함수
function appendCards(cards) {
    var cardContainer = document.querySelector(".card-row");
    for (var i = 0; i < cards.length; i++) {
        var card = cards[i];
        var cardDiv = document.createElement("div");
        cardDiv.classList.add("card-news");
        
        var img = document.createElement("img");
        img.src = card.media_url;
        img.alt = card.caption;
        img.style.maxHeight = "300px";
        
        var username = document.createElement("br");
        var usernameText = document.createTextNode("작성자 = " + card.username);
        username.appendChild(usernameText);
        
        cardDiv.appendChild(img);
        cardDiv.appendChild(username);
        
        cardContainer.appendChild(cardDiv);
    }
}