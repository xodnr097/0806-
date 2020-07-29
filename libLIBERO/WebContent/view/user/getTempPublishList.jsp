<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 임시 저장 도서 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row col-lg-12">
		   		<c:set var="i" value="0" />
			  	<c:forEach var="prod" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				
					<div class="col-lg-3">
					    <div class="card" style="margin-bottom: 35px">
					      	<div class="card-body">
						        <h5 class="card-title">
						        		${prod.prodType eq 'paper' ? '종이책' : '전자책' }${prod.prodNo}
						        </h5>
						        <c:if test="${prod.prodName!=null}">
						        	<p>${prod.prodName}</p>
						        </c:if>
						        <c:if test="${prod.prodName==null}">
						        	<p>제목 없음</p>
						        </c:if>
						        <a href="/libero/publish/addManu?prodNo=${prod.prodNo}" class="">수정</a>
						        <a href="/libero/publish/removeTempPublish?prodNo=${prod.prodNo}" class="">삭제</a>
					      </div>
					    </div>
				  	</div>
				  
				</c:forEach>
			</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
</html>