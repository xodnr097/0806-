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
	</head>
	<body>
		<c:set var="i" value="0" />
	  	<c:forEach var="st" items="${day}" >
		<c:set var="i" value="${ i+1 }" />
			${st.day}, ${st.dayCount}
		</c:forEach>
	</body>
	<script type="text/javascript">
	</script>
</html>