<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <c:set var="i" value="0" />
		  <c:forEach var="buyList" items="${buyList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
					<br/>------------------------------------<br/>
				<td align="center"><b>${ i }</b></td>
				<td align="left"  title="Click : 주문정보 확인">
					<br>------------------------------------<br>
					결제 번호 	: ${buyList.payNo} <br/>
					결제 방식 	: ${buyList.paymentOption} <br/>
					결제 상태 	: ${buyList.payStatus} <br/>
					수령자	: ${buyList.receiverName} <br/>
					수령자주소	: ${buyList.receiverAddr} <br/>
					연락처	: ${buyList.receiverPhone} <br/>
					가격		:${buyList.actualPrice} <br/>
					결제 일자	:${buyList.payDate} <br>
					
						
					<b>상품번호 :${prodNo } </b>
				</td>
          </c:forEach>
</body>
</html>