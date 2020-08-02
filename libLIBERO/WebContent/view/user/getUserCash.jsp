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
	   			<h1>정산 전입니다.</h1><br/>
	   		</div>
	   		<div class="row col-lg-12">
	   			<h6>정산일은 매월 15일 입니다.</h6>
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
	   			<canvas id="dayChart" class="row col-lg-12"></canvas>
	   		</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	<script type="text/javascript">
	//monthly
	var ctxL = document.getElementById("dayChart").getContext('2d');
	<c:set var="i" value="0" />
  	<c:forEach var="st" items="${day}" >
	<c:set var="i" value="${ i+1 }" />
	
	var myLineChart = new Chart(ctxL, {
		type: 'line',
		data: {
			labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"],
			datasets: [
				{
					label: "판매량",
					data: ["${st.jan}", "${st.feb}", "${st.mar}", "${st.apr}", "${st.may}", "${st.jun}", "${st.jul}","${st.aug}","${st.sep}","${st.oct}","${st.nov}","${st.dec}"],
					backgroundColor: ['rgba(165, 222, 159, .4)',],
					borderColor: ['rgba(47, 157, 39, .7)',],
					borderWidth: 2
				}
			]
		},
		options: {
			responsive: true
		}
	});
	</c:forEach>
	</script>
</html>