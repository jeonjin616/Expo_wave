<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		
		// 클라이언트 ID, 콜백 URL
		var naver_id_login = new naver_id_login("", "http://localhost:8080/wave/member/callback.jsp");
		// 접근 토큰 값 출력
//		alert(naver_id_login.oauthParams.access_token);
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
		 	//var id = naver_id_login.getProfileData('id')
		   	var name = naver_id_login.getProfileData('name')
			var email = naver_id_login.getProfileData('email')
			var nickname = naver_id_login.getProfileData('nickname')
			var profile_img = naver_id_login.getProfileData('profile_image')
			
	 		 $.ajax({	// 기존에 가입되어있는지 확인
				data: {
					mem_email : email,
				},
				url: 'naverEmailChk',
				success: function(result){
					console.log(result);
					if(result == "exist"){
						location.href="../index.jsp";
					} else {
						location.href="naver_join.jsp?email=" + email + '&profile_img=' + profile_img + '&name=' + name + '&nickname=' + nickname;
					}
					
				}, // success 종료
			});  // ajax 종료 
				
		}
	</script>
</body>
</html>