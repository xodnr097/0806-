<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 통계 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<style type="text/css">
		</style>
	</head>
	<body>
		<canvas id="lineChart"></canvas>
	</body>
	<script type="text/javascript">
	//line
	var ctxL = document.getElementById("lineChart").getContext('2d');
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