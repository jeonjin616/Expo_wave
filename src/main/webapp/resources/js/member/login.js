/**
 * 	memberJoin.js ( 회원가입 )
 */

$(document).ready(function() {
	$('#loginForm').on('submit', function() {
		event.preventDefault();
		$.ajax({
			type:"post",
			url: 'login',
			data : {
				'mem_id' : $('#id').val(),
				'mem_pw' : $('#pw').val(),
				},
			dataType: 'text',
			success:function(result){
				console.log(result);
				if(result){
					location.href="../index.jsp";
				} else {
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				}
			}
		});	// ajax 끝
	});	// 로그인 폼 
});	// ready 끝