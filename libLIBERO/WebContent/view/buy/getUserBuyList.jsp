<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<jsp:include page="/view/toolbar.jsp"></jsp:include>
<head>
	<script type="text/javascript">
	
	function relocate(payNo,userId){
		self.location="/libero/buy/getUserBuy?userId="+userId+"&payNo="+payNo;
	}
	
	
	
	$("#updateDeli").on("click",function(deliverStatus,payNo){
		$("form").attr("method","POST").attr("action","").submit();
	})
	</script>
		
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>

	
		
  <c:set var="i" value="0" />
		  <c:forEach var="buyList" items="${buyList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
					<br/>------------------------------------<br/>
				<td align="center"><b>${ i }</b></td>
				<td align="left"  title="Click : 주문정보 확인">
				<form>
					<br>------------------------------------<br>
					결제 번호 	:<input type="button" value="${buyList.payNo}" onClick="relocate(${buyList.payNo},${session.userId1 });"> <br/>
					결제 방식 	: ${buyList.paymentOption} <br/>
					결제 상태 	: ${buyList.payStatus} <br/>
					수령자	: ${buyList.receiverName} <br/>
					수령자주소	: ${buyList.receiverAddr} <br/>
					연락처	: ${buyList.receiverPhone} <br/>
					가격		: ${buyList.actualPrice} <br/>
					결제 일자	: ${buyList.payDate} <br>
					배송 상태 	: <c:if test="${buyList.deliveryStatus eq 1}"><input id="updateDeli"type ="hidden" value="${buyList.payNo}"></c:if>
							  <c:if test="${buyList.deliveryStatus == 2}">제작 중</c:if>
				</form>
				</td>
          </c:forEach>
</body>
</html>