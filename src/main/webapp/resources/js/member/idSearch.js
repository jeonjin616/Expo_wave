/**
 * 	memberJoin.js ( 회원가입 )
 */

$(document).ready(function() {
	var at = "@";
	var certNumber;
	var emailAuthCheck = "fail";	
	var smsAuthCheck = "fail";	
	
	// 이메일 선택 입력(select 창 활용)
	$('#domainList').on("change", function(){
		// 직접입력이 아니면
		if(event.target.value !== 'directInput'){
			// 선택값을 텍스트에 넣고 텍스트창 막음
			$("#domainText").val(event.target.value);
			$("#domainText").attr("readonly", true);
			$("#domainText").css("background-color", "#D3D3D3");
		} else {
			// 공백을 넣고 텍스트창 오픈
			$("#domainText").val('');
			$("#domainText").attr("readonly", false);
			$("#domainText").css("background-color", "white");
		}
	});
	
	// 인증번호 요청 클릭
	$('#mailRequestBtn').on('click', function() {
		// input 값 합치기(이메일 합치기)
		const mem_email = $('#insertEmail').val() + at + $('#domainText').val();	
		console.log("이메일 : " + mem_email);
		const cert_num = $('#certNum');		// 인증번호 입력
		
		if($('#mem_name').val() == ""){
			alert("이름을 입력하시기 바랍니다.")
		} else {	// 이름 입력 O
			$.ajax({
				type:'post',
				url: 'nameCheck',	// 이름과 메일이 맞는지 체크하기
				data: {
					'mem_name' : $('#mem_name').val(),
					'mem_email' : mem_email
				},
				success:function(data){
					console.log("data : " + data);	
					if(data == "true"){
						$.ajax({
							type:'post',
							url:'idCertNumByEmail',
							data:{'mem_email': mem_email},
							success:function(data){
								console.log("인증번호 : " + data);
								cert_num.attr("disabled", false);	// 인풋 태그 활성화(false)
								alert('인증번호가 전송되었습니다.');
								certNumber = data;
							}
						})
					} else {	// 정보가 다를 경우 안내 메시지 출력
						alert('이름과 메일을 다시한번 확인바랍니다.');
					}
				}
			});	// ajax 종료
		}	// else 문 종료
	});	// 인증번호 요청 버튼 끝
	
	// 인증번호 비교하기(인풋 태그 활성화 후 발생)
	$('#certNum').on('keyup', function(){
		const inputNum = $(this).val();
		const $resultMsg = $('#mailCheckMsg');	// 제이쿼리 변수 사용
		
		if(inputNum == certNumber){
			$resultMsg.html('인증번호가 일치합니다.');
			// 제이쿼리가 아닌 일반 변수 사용 시 위 문장은 다음과 같이 변함
			// document.getElementById('resultMsg').innerHTML="인증번호가 일치합니다."
			$resultMsg.css('color','green');
			$('#mailRequestBtn').attr('disabled', true);	// 인증번호 요청 클릭을 막음
			$('#insertEmail').attr('readonly', true);		// 이메일 작성과 관련된 모든 곳의 조작을 막음
			$('#domainText').attr('readonly', true);
			$('#domainList').attr('readonly', true);
			emailAuthCheck = "success"
		} else {
			$resultMsg.html('인증번호가 불일치합니다. 다시 입력하시기 바랍니다.');
			$resultMsg.css('color','red');
		}
	});	// 인증번호 비교 끝
	
	// 다음버튼 클릭 시
	$('#idNextBtn').on('click', function(){
		const mem_email = $('#insertEmail').val() + at + $('#domainText').val();
		const mem_name = $('#mem_name').val();
		if(emailAuthCheck == 'success'){
			location.href='idSearchRes/' + mem_email + '/' + mem_name;
//			location.href='idSearchRes?mem_name=' + mem_name + '&mem_email=' + mem_email;	//리퀘스트 파람 버전 url
		} else {
			alert('작성되지 않은 정보가 있습니다.' +'<br> 이메일 인증부분을 다시 확인 부탁드립니다.')
		}
	}); //다음 버튼 클릭 종료
	
	
});	// ready 끝