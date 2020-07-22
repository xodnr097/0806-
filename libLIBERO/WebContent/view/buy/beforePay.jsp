<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	
	$(function(){
		$("#pay").on("click",function(){
			pay();
		})
	})
	
	function pay(){
		$("form").attr("method","POST").attr("action" , "beforePay").submit();
	};
	
</script>
</head>
<body>

<form>

<input type="text" id="buyerId" name="buyerId" placeholder="아이디"><br>
<input type="text" id="deliveryRequest" name="deliveryRequest" placeholder="요청사항"><br>
<input type="text" id="paymentOption" name="paymentOption" placeholder="결제 방법"><br>
<input type="text" id="receiverName" name="receiverName" placeholder="수령자 이름"><br>
<input type="text" id="receiverAddr" name="receiverAddr"placeholder="주소"><br>
<input type="text" id="receiverPhone"name="receiverPhone" placeholder="연락처"><br>
<input type="number" id="actualPrice" name="actualPrice" placeholder="가격"><br>




<button id='pay'>결제</button>

</form>
</body>
</html>