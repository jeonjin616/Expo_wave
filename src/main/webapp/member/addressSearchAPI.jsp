<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<input type="hidden" id="sample6_postcode" placeholder="우편번호">
<input type="hidden" id="sample6_address" placeholder="주소"><br>
<input type="hidden" id="sample6_detailAddress" placeholder="상세주소">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addr_Search() {
    	
    	/* 테마 변경 시 사용 */
    	//아래 코드처럼 테마 객체를 생성합니다.(color값은 #F00, #FF0000 형식으로 입력하세요.)
    	//변경되지 않는 색상의 경우 주석 또는 제거하시거나 값을 공백으로 하시면 됩니다.
    	var themeObj = {
    	   bgColor: "#83CAEE", //바탕 배경색
    	   searchBgColor: "#0B65C8", //검색창 배경색
    	   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    	   pageBgColor: "#339EE8", //페이지 배경색
    	   textColor: "#161616", //기본 글자색
    	   queryTextColor: "#FFFFFF" //검색창 글자색
    	   //postcodeTextColor: "", //우편번호 글자색
    	   //emphTextColor: "", //강조 글자색
    	   //outlineColor: "", //테두리
    	};
    	
		
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memZipcode').value = data.zonecode;
                document.getElementById("memAddr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memAddr2").focus();
            },theme: themeObj
        }).open();
    }
</script>
