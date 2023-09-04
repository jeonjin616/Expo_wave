/**
 * 	memberJoin.js ( 회원가입 )
 */

$(document).ready(function() {
	// 이메일 선택 입력(select 창 활용)
	$('#domainList').on("change", function(){
		var selectedValue = $(this).val();
		// 직접입력이 아니면
		if(selectedValue !== 'directInput'){
			// 선택값을 텍스트에 넣고 텍스트창 막음
			$("#domainText").val(selectedValue);
			$("#domainText").attr("readonly", true);
			$("#domainText").css("background-color", "#D3D3D3");
		} else {
			// 공백을 넣고 텍스트창 오픈
			$("#domainText").val('');
			$("#domainText").attr("readonly", false);
			$("#domainText").css("background-color", "white");
		}
	});
	
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
	
	
	
});	// js 끝