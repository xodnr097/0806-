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





</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    alert(${product.prodNo});
	    alert("${product.creator}");
	});
	
	
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
					data: {"prodNo": ${product.prodNo}, "userId": "${product.creator}" },
					success : function(data){
						
						var wish_img = data.wishImage
			
						$('#wish_img').attr('src', wish_img);
					}
				});
			});
	});
	
	</script>
</html>