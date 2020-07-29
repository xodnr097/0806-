<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
	   		<div class="row justify-content-center" style="margin-bottom: 100px">
	   			<button class="btn btn-default">내정보</button>
	   			<a href="/libero/publish/getTempPublishList" 
		   				class="btn btn-default" role="button" 
		   				aria-pressed="true">임시 저장 도서 조회</a>
	   			<button class="btn btn-default">주문내역 조회</button>
	   			<a href="/libero/publish/getUserPublishList?prodType=book" 
		   				class="btn btn-default" role="button" 
		   				aria-pressed="true">판매중인 도서 및 상품 조회</a>
	   		</div>
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
						        <p>${prod.prodName}</p>
						        <a href="/libero/publish/addManu?prodNo=${prod.prodNo}" class="">수정</a>
					      </div>
					    </div>
				  	</div>
				  
				</c:forEach>
			</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
</html>