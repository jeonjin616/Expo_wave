/**
 * 	memberJoin.js ( 회원가입 )
 */

$(document).ready(function() {
	$('#mem_idChkBtn').on('click', function() {
		if($('#mem_id').val() == '') {
			// 경고문 출력
			alert("아이디를 입력해주세요.");
		} else { // ID 중복 확인 시작
			console.log($('#mem_id').val())
			$.ajax({
				type:"post",
				url: 'idChk',
				data : {'mem_id' : $('#mem_id').val() },
				dataType: 'text',
				success:function(result){
					console.log(result);
					if(result =='yes'){
						alert("중복된 아이디입니다. 다시 입력해주세요")
						$('#mem_id').val('')
					} else {
						alert("사용 가능한 아이디입니다.")
					}
				}
			});	// ajax 끝
		} // else 문
		
	});	// id 중복체크 버튼 끝

});	// ready 끝