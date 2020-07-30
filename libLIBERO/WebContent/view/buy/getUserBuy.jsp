<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/cdn.jsp"></jsp:include>
<jsp:include page="../toolbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
function relocate(prodNo){
	self.location="/libero/product/getProduct/"+prodNo;	
}

</script>
	
</head>
<body>
<br><br><br><br>


<c:set var="i" value="0" />
		  <c:forEach var="getProduct" items="${getProduct}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
					<br/>------------------------------------<br/>
				<td align="center"><b>${ i }</b></td>
				<td align="left"  title="Click : 주문정보 확인">
					<br>------------------------------------<br>
					상품 번호	:<input type="button" value="${getProduct.prodNo}" onClick="relocate(${getProduct.prodNo});">  <br/>
					상품 이름	:${getProduct.prodName }<br/>
					상품 가격	:${getProduct.retailPrice }<br/>
					상품 표지 	:${getProduct.prodThumbnail}
				</td>
          </c:forEach>
</body>



</body>
</html>
