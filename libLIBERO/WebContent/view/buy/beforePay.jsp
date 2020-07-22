<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>

//카카오 주소 API 사용
    function daumjuso() {
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
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//                     if(extraAddr !== ''){
//                         extraAddr = ' (' + extraAddr + ')';
//                     }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postCode").value = data.zonecode;
                document.getElementById("receiverAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("receiverName").focus();
            }
        }).open();
    }
</script>
</head>
<body>
  <script>
    $(function(){
    	$("#payment").on("click",function(){
            var IMP = window.IMP; // 생략가능
            IMP.init('imp17527359'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
            var msg;
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : $("#paymentOption").val(),
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '리브리베로 결제창',
                amount : $("#price").val(),
                buyer_email : $("#email").val(),
                buyer_name : $("#receiverName").val(),
                buyer_tel : $("#receiverPhone").val(),
                buyer_addr :$("#postCode").val()+" " +$("#receiverAddr").val()+ " "+$('#extraAddress').val()
               
                //m_redirect_url : 'http://www.naver.com'
            }, function(rsp) {
                if ( rsp.success ) {
                	var sendData = JSON.stringify({
                    	"payNo" : rsp.imp_uid,
                        "merchantUid" : rsp.merchant_uid,
                        "actualPrice" : rsp.paid_amount,
                        "paymentOption" : rsp.pay_method,
                        "payStatus" : rsp.status,
                        "receiverName" : rsp.buyer_name,
                        "receiverPhone" : rsp.buyer_tel,
                        "receiverAddr" : rsp.buyer_addr,
                        "buyerId" : rsp.buyer_email
                	})
                	
                    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                    jQuery.ajax({
                        url: '/libero/buy/json/beforePay', //교체 하기
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json',
                        data: sendData
                    }).done(function(data,status) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (status === 'success') {
                        	msg += '\n고유ID : ' + rsp.imp_uid;
                			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                			msg += '\결제 금액 : ' + rsp.paid_amount;
                			msg += '카드 승인번호 : ' + rsp.apply_num;
                			msg += '결제 일시 : '+rsp.paid_at;
                            
                            alert(msg);
                        } else {
                            //[3] 아직 제대로 결제가 되지 않았습니다.
                            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                        	msg = '결제에 실패하였습니다. 다시 시도해 주세요.';
                            
                        	alert(msg);
                        }
                    });
                    //성공시 이동할 페이지
                    <%-- location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>
                } else {
                    msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    //실패시 이동할 페이지
                   	<%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                    alert(msg);
                }
            });    		
    		
    	})
    });
    </script>
    
<input type="text" id = "price"placeholder="가격"><br/>
<input type="text" id = "email"placeholder="아이디"><br/>
<input type="text" id = "receiverPhone"placeholder="전화번호"><br/>

<input type="text" id="postCode" placeholder="우편번호">
<input type="button" onclick="daumjuso()" value="우편번호 찾기"><br>
<input type="text" id="receiverAddr" placeholder="주소"><br>
<input type="text" id="extraAddress" placeholder="상세주소"><br>
<input type ="text" id ="receiverName"placeholder="이름"><br>
<select id="paymentOption">
    <option value="">결제 방법 선택</option>
    <option value="card">신용카드</option>
    <option value="phone">휴대폰</option>
    <option value="기타"></option>
</select><br/>
  <input type="button" id="payment" value="결제하기"/><br/>
</body>
</html>