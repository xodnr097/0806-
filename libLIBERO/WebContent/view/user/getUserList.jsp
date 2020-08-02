<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 전체 회원 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
		
		
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   	
	   	<table id="dtVerticalScrollExample" class="table table-striped table-bordered table-sm" cellspacing="0"  width="100%">
			  <thead>
			    <tr>
			      <th class="th-sm">유저ID
			      </th>
			      <th class="th-sm">정산 신청여부
			      </th>
			    </tr>
			  </thead>
			  <tbody>
	   		<c:set var="i" value="0" />
		  	<c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
				
			    <tr>
			      <td>${user.userId}</td>
			      <td>
			      	<c:if test="${user.cashCode!='bf'}">
						<button type="button" class="btn btn-default">정산하기</button>
					</c:if>
					<c:if test="${user.cashCode=='bf'}">
						신청 안함
					</c:if>
				  </td>
			    </tr>
			  
			</c:forEach>
			</tbody>
			
			  
			</table>
	   	</div>
		<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	<script type="text/javascript">
	
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</html>