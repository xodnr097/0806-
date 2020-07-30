<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
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
				

</body>
</html>