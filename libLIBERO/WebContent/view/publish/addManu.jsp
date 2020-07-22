<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 원고 등록</title>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			.formLabel {
				font-size: 15px;
				background-color: rgb(141, 204, 191);
				color: rgb(62, 121, 108);
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				padding-left: 5px;
				margin-bottom: 0;
				font-family: 'Nanum Gothic', sans-serif;
			}
			
			#file {
				margin-top: 60px;
				margin-bottom: 60px;
			}
			
		</style>
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<!-- 아이콘 들어갈자리 -->
	   		<div class="col-lg-12 text-center">
	   			원고등록 아이콘 자리
	   		</div>
	   		<!-- 원고파일 등록 폼 Start -->
	   		<form>
	   			<input type="hidden" name="prodNo" value="${prod.prodNo}">
	   			<div class="form-group">
	   				<label class="formLabel col-lg-12" for="manuFile">원고 파일 등록</label>
	   				<div align="center">
				        <input type="file" id="file" name="file" onchange="checkFile(this)"><br/>
			    	</div>
	   			</div>
	   			<div class="form-group" align="center">
		      		<button type="button" class="btn btn-info btn-block" 
		      			onclick="addManu()">
		      			도서 정보 등록
		      		</button>
			  	</div>
	   		</form>
	   		<!-- form End -->
	   	</div>
	   	<!-- //////////// Bootstrap Container End/////////////////// -->
	</body>
	<script type="text/javascript">
	//================ form submit ======================
	function addManu() {
		var file = $("#file").val();
		
		if (file=="") {
			alert("파일을 업로드 해주세요");
			return;
		}
		$("form").attr("method" , "POST").attr("action" , "/libero/publish/addManu").attr("enctype","multipart/form-data").submit();
	}
	//============== check file exc =====================
	function checkFile(f) {
		
		var file = f.files;
		
		if(!/\.(docx|pdf)$/i.test(file[0].name)) 
			alert("docx, pdf 파일만 업로드 가능합니다.");
		
		else return;
		
		f.outerHTML = f.outerHTML;
	}
	</script>
</html>