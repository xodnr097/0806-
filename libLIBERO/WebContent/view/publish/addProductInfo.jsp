<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 도서정보 등록</title>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			.formLabel {
				font-size: 15px;
				background-color: #FFFFFF;
				color: rgb(62, 121, 108);
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				padding-left: 5px;
				margin-bottom: 0;
				font-family: 'Nanum Gothic', sans-serif;
			}
			.freeSelect input{
		    	margin:0;padding:0;
		    	-webkit-appearance:none;
		       	-moz-appearance:none;
		        appearance:none;
			}
			.imgSelector input{
		    	margin:0;padding:0;
		    	-webkit-appearance:none;
		       	-moz-appearance:none;
		        appearance:none;
			}
			.picture {
				background-image: url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/picture/picture.png);
			}
			.icon {
				background-image: url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/icon/icon.png);
			}
			.img {
				background-image: url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/img/image.png);
			}
			.imgType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:82px; height:100px;
			    margin-top: 10px;
			    padding-top: 105px;
			    font-size: 12px;
			}
			.imgSelect {
				cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:145px; height:100px;
			    margin-top: 10px;
			}
			input[type="radio"]:checked + label {
    			border: black 1px solid;
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
	   			도서정보 아이콘 자리
	   		</div>
	   		<!-- 도서정보 등록 폼 Start -->
	   		<form>
	   			<input type="hidden" name="prodNo" value="${prod.prodNo}">
	   			<!-- 표지타입 선택 Start -->
	   			<div class="form-group">
	   				<label class="formLabel col-lg-12" for="coverSelect">표지 등록</label>
	   				<div class="col-lg-12">
	   					<input type="radio" name="coverSelect" value="freeTemplate" onclick="checkCover()">무료 템플릿
	   				</div>
	   				<div class="col-lg-12">
	   					<input type="radio" name="coverSelect" value="fileUpload" onclick="checkCover()">직접 올리기
	   				</div>
	   			</div>
	   			<!-- 표지타입 선택 End -->
	   			<!-- 무료템플릿 선택 Start -->
	   			<!-- 타입 선택 Start -->
	   			<div class="form-group freeSelect">
	   				<div class="row col-lg-12 justify-content-left d-flex">
	   					<div class="p-3">
			   				<input type="radio" name="imgType" value="picture" id="picture">
			   				<label class="picture imgType text-center" for="picture"><b>사진형</b></label>
			   			</div>
			   			<div class="p-3">
			   				<input type="radio" name="imgType" value="icon" id="icon">
			   				<label class="icon imgType text-center" for="icon"><b>아이콘형</b></label>
		   				</div>
		   				<div class="p-3">
			   				<input type="radio" name="imgType" value="img" id="img">
			   				<label class="img imgType text-center" for="img"><b>이미지형</b></label>
		   				</div>
	   				</div>
	   			</div>
	   			<!-- 타입선택 End -->
	   			<!-- 이미지 선택 Start -->
	   			<div class="form-group imgSelector">
	   				<div class="row col-lg-12 justify-content-left d-flex">
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="1" id="img1">
	   						<label class="img1 imgSelect text-center" for="img1"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="2" id="img2">
	   						<label class="img2 imgSelect text-center" for="img2"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="3" id="img3">
	   						<label class="img3 imgSelect text-center" for="img3"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="4" id="img4">
	   						<label class="img4 imgSelect text-center" for="img4"></label>
	   					</div>
	   				</div>
	   			</div>
	   			<!-- 이미지 선택 End -->
	   			<div class="form-group imgPreview">
	   				<div class="row col-lg-12">
	   					<canvas id="preview" width="300px" height="150px"></canvas>
	   				</div>
	   			</div>
	   			<!-- 무료템플릿 선택 End -->
	   		</form>
	   		<!-- 도서정보 등록 폼 End -->
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	<script type="text/javascript">
		$(function(){
			$("div .freeSelect").hide();
			$("div .imgSelect").hide();
			$("div .imgPreview").hide();
			
			$("input[name='imgType']").on("click", function(){
				var type = $("input[name='imgType']:checked").val();
				console.log(type);
				$("div .imgSelect").show();
				$("div .imgPreview").show();
				$(".img1").css("background-image", "url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/"+type+"/t1_preview.png)");
				$(".img2").css("background-image", "url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/"+type+"/t2_preview.png)");
				$(".img3").css("background-image", "url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/"+type+"/t3_preview.png)");
				$(".img4").css("background-image", "url(http://127.0.0.1:8080/libero/resources/images/publish/freeTemplate/"+type+"/t4_preview.png)");
			});
		});
		//============= 표지 종류 : 무료, 직접 선택 ===================
		function checkCover() {
			var cover = $("input[name='coverSelect']:checked").val();
			
			if (cover=="freeTemplate") {
				$("div .freeSelect").show();
			}
			if (cover=="fileUpload") {
				$("div .freeSelect").hide();
				$("div .imgSelect").hide();
			}
		}
	</script>
</html>