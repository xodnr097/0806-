<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h2>${userId}의 위시리스트</h2>
		
		
		  <c:set var="i" value="0" />
		  <c:forEach var="wishList" items="${wishList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : 주문정보 확인">		
					${wishList.prodType} </br>
					${wishList.prodName} <br/>
					${wishList.retailPrice} <br/>
				</td>
          </c:forEach>
        
        </tbody>


</body>
</html>