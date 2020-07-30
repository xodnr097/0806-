<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 리베로캐쉬 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			.row {
				margin: 10px;
			}
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row col-lg-12">
	   			<h1>정산 전입니다.</h1>
	   		</div>
	   		<div class="row text-center">
	   			<div class="col-lg-3">
	   				<h6>누적</h6>${cash.totalCash}원
	   			</div>
	   			<div class="col-lg-3">
	   				<h6>현재</h6>${cash.currentCash}원
	   			</div>
	   			<div class="col-lg-3">
	   				<h6>출금</h6>${cash.withdrawCash}원
	   			</div>
	   		</div>
	   		<div class="row d-flex justify-content-center">
	   		<form class="col-lg-10">
	   		<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <label class="input-group-text" for="inputGroupSelect01">은행선택</label>
			  </div>
			  <select class="browser-default custom-select" id="inputGroupSelect01">
			    <option selected>Choose...</option>
			    <option value="1">One</option>
			    <option value="2">Two</option>
			    <option value="3">Three</option>
			  </select>
			</div>
	   			<div class="md-form input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">계좌번호</span>
				  </div>
				  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default">
				</div>
	   		</form>
	   		</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
</html>