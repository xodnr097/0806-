<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- //실제 복사하여 사용시에는 모든 주석을 지운 후 사용하세요 -->
<script type="text/javascript">

var IMP = window.IMP; // 생략가능
IMP.init('imp17527359'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용


IMP.request_pay({
    pg : 'danal', // version 1.1.0부터 지원.
    pay_method : '${addBuy.paymentOption}',
    merchant_uid : 'liblibero' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : ${addBuy.price} ,
    buyer_email : '${addBuy.buyerId}',
    buyer_name : '${addBuy.receiverName}',
    buyer_tel : '${addBuy.receiverPhone}',
    buyer_addr : '${addBuy.receiverAddr}',
    buyer_postcode : '123-456'
   
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
       
    }
    alert(msg);
});
</script>

</head>
<body>

</body>
</html>