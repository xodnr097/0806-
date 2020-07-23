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
				background-image: url(../resources/images/publish/freeTemplate/picture/picture.png);
			}
			.icon {
				background-image: url(../resources/images/publish/freeTemplate/icon/icon.png);
			}
			.img {
				background-image: url(../resources/images/publish/freeTemplate/img/image.png);
			}
			.img1 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t1_preview.png);
			}
			.img2 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t2_preview.png);
			}
			.img3 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t3_preview.png);
			}
			.img4 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t4_preview.png);
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
			#preview {
				width: 510px; height: 340px;
				border: 1px black solid;
				background-size: cover;
				position: relative;
			}
			#titlePreview {
				position: absolute;
				top: 55px;
				left: 345px; /*계산해서 스크립트로 추가*/
				float: right;
			}
			#preview #liberoImg {
				position: absolute;
				bottom:5px;
				right:0px;
				background-image: url("../resources/images/common/logo.png");
				background-size: cover;
				width: 80px; height: 20px;
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
	   					<input type="radio" name="coverSelect" value="freeTemplate" onclick="checkCover()" checked>무료 템플릿
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
			   				<input type="radio" name="imgType" value="picture" id="picture" checked>
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
	   						<input type="radio" name="imgSelect" value="t1" id="img1">
	   						<label class="img1 imgSelect text-center" for="img1"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t2" id="img2">
	   						<label class="img2 imgSelect text-center" for="img2"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t3" id="img3">
	   						<label class="img3 imgSelect text-center" for="img3"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t4" id="img4">
	   						<label class="img4 imgSelect text-center" for="img4"></label>
	   					</div>
	   				</div>
	   			</div>
	   			<!-- 이미지 선택 End -->
	   			<!-- 이미지 미리보기 Start -->
	   			<div class="form-group imgPreview">
	   				<div class="row col-lg-12 justify-content-center">
	   					<div id="preview">
		   					<div id="titlePreview">도서제목 div</div>
		   					<div id="liberoImg"></div>
	   					</div>
	   				</div>
	   			</div>
	   			<!-- 이미지 미리보기 End -->
	   			<!-- 무료템플릿 선택 End -->
	   			<!-- 직접 올리기 Start -->
	   			<!-- 직접 올리기 End -->
	   			<!-- 도서제목 입력 Start -->
	   			<div class="form-group md-form">
	   				<div class="md-form">
	   					<div class="formLabel">도서제목</div>
						<input placeholder="도서 제목" type="text" id="bookTitle" class="form-control" name="bookTitle" onblur="addTitle()">
					</div>
	   			</div>
	   			<!-- Grid row -->
				  <div class="row">
				    <!-- Grid column -->
				    <div class="col">
				      <!-- Material input -->
				      <div class="md-form mt-0">
				      	<div class="formLabel">저자</div>
				        <input type="text" class="form-control" placeholder="First name">
				      </div>
				    </div>
				    <!-- Grid column -->
				
				    <!-- Grid column -->
				    <div class="col">
				      <!-- Material input -->
				      <div class="md-form mt-0">
				      	<div class="formLabel">카테고리</div>
				      	<select name="bookCategory" class="browser-default custom-select">
				      		<option>소설</option>
				      	</select>
				      </div>
				    </div>
				    <!-- Grid column -->
				  </div>
	   			
	   			
	   		</form>
	   		<!-- 도서정보 등록 폼 End -->
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	<script type="text/javascript">
		$(function(){
			
			$("#liberoImg").hide();
			$("#titlePreview").hide();
			
			$("input[name='imgType']").on("click", function(){
				var type = $("input[name='imgType']:checked").val();
				console.log(type);
				$("div .imgSelect").show();
				$("div .imgPreview").show();
				$(".img1").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t1_preview.png)");
				$(".img2").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t2_preview.png)");
				$(".img3").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t3_preview.png)");
				$(".img4").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t4_preview.png)");
			});
			
			$("input[name='imgSelect']").on("click", function(){
				var type = $("input[name='imgType']:checked").val();
				var img = $("input[name='imgSelect']:checked").val();
				
				$("#preview").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/"+img+"_preview.png)");
				$("#liberoImg").show();
				$("#titlePreview").show();
			});
		});
		//============= 표지 종류 : 무료, 직접 선택 ===================
		function checkCover() {
			var cover = $("input[name='coverSelect']:checked").val();
			
			if (cover=="freeTemplate") {
				$("div .freeSelect").show();
				$("div .imgSelect").show();
				$("div .imgPreview").show();
			}
			if (cover=="fileUpload") {
				$("div .freeSelect").hide();
				$("div .imgSelect").hide();
				$("div .imgPreview").hide();
			}
		}
		
		function addTitle() {
			var title = $("input[name='bookTitle']").val();
			
			$("#titlePreview").html(title);
			
		}
	</script>
</html>