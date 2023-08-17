<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>������</title>
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
}

header {
	text-align: center;
}

header img {
	width: 100%;
	/* �̹��� ũ�⸦ �������ּ���. */
}

nav {
	background-color: #f0f0f0; /* �޴� ���ù� ���� */
	padding: 1rem;
}

nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	justify-content: center;
}

nav li {
	margin-right: 20px; /* �޴� ������ �������ּ���. */
}

nav a {
	text-decoration: none;
	color: #666; /* �⺻ ���ڻ� */
	padding-bottom: 2px;
	border-bottom: 2px solid transparent;
	transition: color 0.2s ease, border-bottom-color 0.2s ease;
}

nav a:hover {
	color: #000; /* ���콺 ���� �� ���ڻ� ���� */
	border-bottom-color: #000; /* ���콺 ���� �� ���� ���� */
}

 /* �˻�â ��Ÿ�� */
        .search-container {
            text-align: center;
            margin: 50px auto;
            display: inline-block; /* �ζ��� ��� ��ҷ� �����Ͽ� ���� �ٿ� ��ġ */
            position: relative;
            background-color: #c2f0c2; /* ���� �ʷϻ� ��� ���� */
            border-radius: 30px;
        }

        #search-input {
            padding: 10px;
            width: 500px;
            height: 40px;
            border: none;
            border-radius: 30px;
            font-size: 18px;
            background-color: transparent; /* �˻�â ���� ����� �����ϰ� ���� */
            outline: none; /* ��Ŀ�� �� �׵θ� ���� */
            text-indent: 30px; /* ���� ���� ���� */
        }

        #search-input::placeholder {
            color: #777;
        }

        #search-button {
            padding: 10px;
            background-color: transparent; /* �˻� ��ư ����� �����ϰ� ���� */
            border: none;
            cursor: pointer;
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            right: 15px; /* ������ ���� �ø� */
        }

        

        /* �˻� ��� ������ ��Ÿ�� */
        .search-results {
            text-align: center;
            margin: 50px auto;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin-bottom: 10px;
        }

        ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            font-size: 18px;
        }
</style>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<img src="resources/img/banner1.png" alt="������" />
	

	<header>
		<nav>
			<ul>
				<li><a href="home.jsp">Ȩ</a>
				<li><a href="notice">��������</a></li>
				<li><a href="faq">�����ϴ� ����</a></li>
				<li><a href="inqu.jsp">ȸ�� 1:1 ���ǰԽ���</a></li>
				<li><a href="chatbot.jsp">ê��</a></li>
			</ul>
		</nav>

		<div class="search-container">
			<form action="search_result.jsp" method="get">
				<input type="text" id="search-input" name="query"
					placeholder="�˻�� �Է��ϼ���" autocomplete="off">
				<button type="submit" id="search-button">
				<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#000000}</style><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
				</button>
			</form>
		</div>
</header>
	

		<!-- <script>
        const searchInput = document.getElementById('search-input');
        const searchSuggestions = document.getElementById('search-suggestions');

        searchInput.addEventListener('input', async () => {
            const query = searchInput.value;

            // ������ �˻�� ������ ���õ� �˻� �ϼ� ����� ������
            const suggestions = await fetch(`/get_suggestions?query=${query}`);
            const suggestionsJson = await suggestions.json();

            // �˻� �ϼ� ����� ǥ��
            searchSuggestions.innerHTML = '';
            suggestionsJson.forEach(suggestion => {
                const suggestionItem = document.createElement('div');
                suggestionItem.textContent = suggestion;
                suggestionItem.classList.add('suggestion');
                searchSuggestions.appendChild(suggestionItem);
            });
        });
    </script> -->

</body>
</html>