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
		  <c:forEach var="factorylist" items="${factorylist}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
					<br/>------------------------------------<br/>
				<td align="center"><b>${ i }</b></td>
				<td align="center"  title="Click : 주문정보 확인">
					<br>------------------------------------<br>
					결제 번호 	: ${factorylist.payNo} <br/>
					결제 방식 	: ${factorylist.receiverAddr} <br/>
					결제 상태 	: ${factorylist.receiverPhone} <br/>
					결제 날짜	: ${factorylist.payDate} <br/>
				
						
					<b>상품번호 :${prodNo } </b>
					
<%-- 					${buyList.prodNo} <br/> --%>
				</td>
          </c:forEach>
</body>
</html>