<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	
	
	
	
<title>Insert title here</title>
</head>


<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>

					책번호 ${product.prodNo} <br/>
					상품 타입 ${product.prodType} <br/>
					상품 상세 ${product.prodDetail} <br/>
					상품명 ${product.prodName} <br/> 
					소비자가 ${product.retailPrice} <br/>
					저자 ${product.author} <br/>
					할인여부 ${product.blindCode} <br/>
					컬러 ${product.colorType} <br/>
					표지 ${product.coverType} <br/>
					내지 ${product.innerType} <br/>
					작성자 ${product.creator}	<br/>
					
	
		<img src="${wish}" id='wish_img' width="70px" height="70px"/>
		<input type="number" name="buyCount" id="buyCount" onblur="buyCount()">개</td>
		<div class="form-group" align="center">
			<button type="button" id="button" class="btn btn-info btn-block" 
				onclick="addCart()">
				장바구니
			</button>
		</div>
		
		 	

</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    //alert(${product.prodNo});
	    alert("${sessionScope.user.userId}");
	});
	
// 	$(function(){
// 		$("input").attr("onclick","buyCount()");
// 	})
	
	function buyCount(){
		var buyCount = $("#buyCount").val();
	}
	
	$(document).ready(function(){
			$('#wish_img').on("click", function(){
			
				$.ajax({
					url : "/libero/product/json/addWish",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": ${product.prodNo}, "userId": "${sessionScope.user.userId}" },
					success : function(data){
						
						var wish_img = data.wishImage
			
						$('#wish_img').attr('src', wish_img);
					}//end success
				});//end ajax
			});//end click function
	});//end ready
	
	function addCart() {
		var userId = "${sessionScope.user.userId}";
		var phoneCode = "${sessionScope.user.phoneCode}";
		var buyCount = $("#buyCount").val();
		alert(buyCount);
		
		if (userId=="") {
			alert("로그인 해주세요.");
			return;
		}
		if (phoneCode!=1) {
			alert("휴대폰 본인인증을 완료한 회원만 가능합니다.");
			return;
		}
		if (buyCount==null) {
			alert("수량을 선택해주세요.");
			return;
		}
		
		$.ajax({
			url : "/libero/product/json/addCart",
			type: "POST",
			dataType: "json",
			header : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
			},
			data: {"prodNo": ${product.prodNo}, "userId": "${sessionScope.user.userId}", "buyCount": buyCount},
			success : function(data){
						var message = data.result
						alert(message);
			}
		});//end ajax
		
	}//end addCart
		
		//$("form").attr("method" , "POST").attr("action" , "/libero/product/json/addCart").submit();
	</script>
</html>