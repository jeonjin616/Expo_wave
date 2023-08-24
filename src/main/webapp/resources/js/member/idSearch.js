/**
 * 	memberJoin.js ( 회원가입 )
 */

$(document).ready(function() {
	var at = "@";
	
	// 이메일을 선택하여 입력
	$('#domainList').on("change", function(){
		// 직접입력이 아니면
		if(event.target.value !== 'directInput'){
			// 선택값을 텍스트에 넣고 텍스트창 막음
			$("#domainText").val(event.target.value);
			$("#domainText").attr("readonly", true);
		} else {
			// 공백을 넣고 텍스트창 오픈
			$("#domainText").val('');
			$("#domainText").attr("readonly", false);
		}
	});
	
	$('#mailRequestBtn').on('click', function() {
		const mem_email = $('#insertEmail').val() + at + $('#domainText').val();	// input 값 합치기
		console.log("이메일 : " + mem_email);
		
		if($('#mem_name').val() == ""){
			alert("이름을 입력하시기 바랍니다.")
		} else {	// 이름 입력 O
			$.ajax({
				type:'get',
				url: 'reqCertNum',
				data: {
					'mem_name' : $('#mem_name').val(),
					'mem_email' : mem_email
				},
				success:function(data){
					// 컨트롤러 작성하기
					console.log("data : " + data);	
				}
				
			});	// ajax 종료
		}	// else 문 종료
		
	});	// 인증번호 요청 버튼 끝
	
	
	
	
});	// ready 끝