<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 종이책 인쇄 옵션 조회</title>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<!-- ////////////////// form Start /////////////////////-->
			<form>
				<div class="form-group">
					    <label class="formLabel" for="colorType">도서 컬러 선택</label>
					    <div>
					    	<ul>
                            <input type="radio" name="colorType" value="color">
                            <label class="colorType black" for="black"></label> 흑백
                            <input type="radio" name="colorType" value="black"> 컬러
                            </ul>
                        </div>
					</div>
			</form>
			<!-- ////////////////// form End ////////////////////// -->
	   	</div>
	   	<!-- ///////////// Bootstrap Container End ////////////////// -->
	</body>
</html>