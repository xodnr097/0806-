<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
<br/>
<br/>
<br/>
<br/>
<tbody>
		<h2>${sessionScope.user.userId}의 장바구니</h2>
		<form group>
		  <c:set var="totalPrice" value="0"/>
		  <c:set var="i" value="0" />
		  <c:forEach var="cartList" items="${cartList}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var="totalPrice" value="${totalPrice + cartList.buyAmount * cartList.retailPrice }"/>
			<tr>
				<td align="center">${ i }</td>
				<form id="form${i}" value="${i}">
		<!--  	 <input type="checkbox" id="checkbox${i}" name="price" value="#"> -->
				 	<input type="hidden" class="eachPrice" id="eachPrice${i}" name="eachPrice${i}"  value="${cartList.buyAmount * cartList.retailPrice}">
				 	구매번호 : ${buyNoList[i-1]}</br> 
					상품번호 : ${cartList.prodNo }	 <br/>	<input type="hidden" class="prodNo" id="prodNo${i}" name="prodNo${i}"  value="${cartList.prodNo}">
					상품타입 : ${cartList.prodType} <br/>
					상품명 : ${cartList.prodName} <br/>
					가격 : ${cartList.retailPrice} <br/><input type="hidden" class="retailPrice" name="retailPrice${i}" id="retailPrice${i}" value="${cartList.retailPrice}">
					수량 : ${cartList.buyAmount}<br/><input type="number" class="buyAmount" name="buyAmount${i}" id="${i}" value="${cartList.buyAmount}">개
					<p id="each${i}">가격 : ${cartList.buyAmount * cartList.retailPrice}</p> 
					<input type="hidden" class="eachPrice" id="eachPrice${i}" name="eachPrice${i}"  value="${cartList.buyAmount * cartList.retailPrice}">
					<button type="button" class="removeButton" id="button${i}" class="btn btn-info btn-block" value="${cartList.prodNo}">삭제</button>
					
				</form></tr>
          </c:forEach>
          </form>
					<h1 id="totalPrice">총액 : ${totalPrice} </h1>
					<form>
					<input type="hidden" name="buyNoList" value="${buyNoList}">
					<input type="hidden" id="actualPrice" name="actualPrice" value="${totalPrice}">
					</form>
      
          
        </tbody>        
        <button type="button" id="button" class="btn btn-info btn-block" >
				구매
		</button>


</body>



<script type = "text/javascript">
	
	
// 		$(function() {
// 			var total = 0;
			
			
// 			$("input:checkbox").on("click", function(){
// 				if($("input:checkbox").is(":checked")==true){
// 					alert("dd")
// 				var i = $(this).next().val();
// 				alert(i)


// 				total = total + parseInt(i);
// 				alert(total)
// 				})	
// 			})
// 		})

		$(function() {
			
			$('.buyAmount').click(function(){
					
				var buyAmount = $(this).val();
				alert(buyAmount);
				//i는 포문의 몇번째인지 뽑기 위해 일부로 buyAmount의 id를 i로 설정해놓고 뽑아온것
				var i = $(this).attr("id"); //상품이 리스트중 몇번째 상품인지 추출
				//alert(i);
				var prodNo = $("#prodNo"+i).val();
				var retailPrice = $("#retailPrice"+i).val();
				//alert(retailPrice);
				var eachPrice = parseInt(retailPrice)*parseInt(buyAmount);
				//alert(eachPrice)
				$("#each"+i).html("가격 : "+eachPrice);//업데이트된 eachPrice 화면출력
				$("#eachPrice"+i).val(eachPrice);//업데이트된 eachPrice input의 value 업데이트
				var each = $("#eachPrice"+i).val()
				alert(each);
				var k = $(".buyAmount:Last").attr("id"); //상품 리스트 갯수 추출
				var kk = parseInt(k)+1;
				//alert(k);
				//alert(kk);
				
				
// 				var eachPrice1 = $("#eachPrice1").val();
// 				var eachPrice2 = $("#eachPrice2").val();
// 				var eachPrice3 = $("#eachPrice3").val();
// 				alert(eachPrice1);
// 				alert(eachPrice2);
// 				alert(eachPrice3);
				var totalPrice=0;
				for (var i=1; i<kk ; i++){
					
							var eachPrice=parseInt($("#eachPrice"+i).val());
							totalPrice += eachPrice;
				}
				$("#totalPrice").html("총액 : "+totalPrice);
				$("#actualPrice").val(totalPrice);
				var actualPrice = $("#actualPrice").val();
				alert(actualPrice);
				
				//var prodNo = $("#prodNo"+i).val();//for 문 때문에 i 변한듯 위에서 선언해야됨
				alert(prodNo);
				$.ajax({
					url : "/libero/product/json/addCart",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": prodNo, "userId": "${sessionScope.user.userId}", "buyAmount": buyAmount, "from": "cart"},
					success : function(data){
								var message = data.result
								//alert(message);
					}
				});//end ajax
			})
		})
		
		$(function(){
			
			$("#button").on("click", function(){
				$("form").attr("method", "POST").attr("action", "/libero/buy/beforePay").submit();
			})
		});
		
		
		$(function(){
			$(".removeButton").on("click", function(){
				
				var prodNo = $(this).val();
				
				
				$.ajax({
					url : "/libero/product/json/removeCart",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": prodNo, "userId": "${sessionScope.user.userId}" },
					success : function(data){
						var message = data.result
						alert(message);
						window.location.reload();
					}//end success
				});//end ajax
			})
		});
		//$(function() {
			
		//})
	
// 		for (var i = 0; i <= colorPrice.length; i++) {
		
// 		var buyAmount = $(this).next().val();
// 		alert(buyAmount);	
// 	}
	
// 	function totalPrice(){
// 		alert("hi")
// 		var totalPrice = 0
		
// 		<c:forEach items="${cartList}" var="cartList">
// 		var eachPrice = 
// 		</c:forEach>
// 	}
	



</script>


</html>	