<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/cdn.jsp"></jsp:include>

<script type="text/javascript">
function relocate(payNo){
	self.location="/libero/buy/getFactoryBuy?payNo="+payNo;
}
</script>
</head>
<body>
		<div>
			<jsp:include page="/view/toolbar.jsp"></jsp:include>
		</div>
		<br>
	<div class ="container">
	 <c:set var="i" value="0" />
		  <c:forEach var="factorylist" items="${factorylist}">
			<c:set var="i" value="${ i+1 }" />
			
					<br/>------------------------------------<br/>
				<td align="center"><b>${ i }</b></td>
					<td align="center"  title="Click : 주문정보 확인" >
						<br>------------------------------------<br>
						<div id = "payNo" >
							결제 번호 	:<span id="spans" > <input type="button" class="classPay" name="payNoBtn" value="${factorylist.payNo}" onClick="relocate(${factorylist.payNo});"></span> <br/>
						</div>
						
						결제 방식 	: ${factorylist.receiverAddr} <br/>
						결제 상태 	: ${factorylist.receiverPhone} <br/>
						결제 날짜	: ${factorylist.payDate} <br/>		
						결제 자	: ${factorylist.buyerId }		
	<%-- 					<b>상품번호 :${factoryProdNo } </b> --%>
					</td>	
							
          </c:forEach>
     </div>
</body>
</html>