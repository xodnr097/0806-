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
		
		<style type="text/css">
			.formLabel {
				font-size: 15px;
				background-color: rgb(141, 204, 191);
				color: rgb(62, 121, 108);
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				padding-left: 5px;
			}
			.typeSelector input{
		    	margin:0;padding:0;
		    	-webkit-appearance:none;
		       	-moz-appearance:none;
		        appearance:none;
			}
			.black {
				background-image: url(http://127.0.0.1:8080/libero/resources/images/publish/book_black.png);
				/* background-size: 200px; */
			}
			.color {
				background-image: url(http://127.0.0.1:8080/libero/resources/images/publish/book_color.png);
				/* background-size: 200px; */
			}
			.a5 {
				background-image: url(http://127.0.0.1:8080/libero/resources/images/publish/size_a5.png);
			}
			.colorType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    margin-left:35px;
			    width:182px; height:125px;
			    margin-top: 10px;
			    padding-top: 130px;
			}
			
			.sizeType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    margin-left:35px;
			    width:80px; height:90px;
			    margin-top: 10px;
			    padding-top: 110px;
			}
			
			input[type="radio"]:checked + label {
    			border: black 1px solid;
			}
			
			.rightform {
				position: relative;
				float: right;
			}
			
			.detail {
				height: 300px;
				background-color: #EAEAEA;
				padding: 10px;
			}
		</style>
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<c:if test="${param.prodType=='paper'}">
	   		<!-- ////////////////// paper form Start /////////////////////-->
			<form>
				<div class="form-group col-lg-4 rightform">
					<div class="row justify-content-right">
						<label class="formLabel" for="publishDetail">상세정보</label>
					</div>
					<div class="row detail text-left">
						<table>
							<tbody>
								<tr>
									<th>제본방식</th>
									<td>: 무선제본</td>
								</tr>
								<tr>
									<th>컬러</th>
									<td id="colorType">: </td>
								</tr>
								<tr>
									<th>종이 규격</th>
									<td id="sizeType">: </td>
								</tr>
							</tbody>
						</table>
					</div>				
				</div>
				<!-- 컬러선택 Start -->
				<div class="form-group typeSelector">
					<label class="formLabel col-lg-7" for="colorType">도서 컬러 선택</label>
				    <div class="row col-lg-7 justify-content-center">
					    <div class="col">
	                    	<input type="radio" name="colorType" value="black" id="black">
	                        <label class="colorType black text-center" for="black">흑백<br/>표지:컬러 내지:흑백</label>
	                    </div>
	                    <div class="col">
	                        <input type="radio" name="colorType" value="color" id="color">
	                        <label class="colorType color text-center" for="color">컬러<br/>표지:컬러 내지:컬러</label>
                        </div>
                    </div>
				</div>
				<!-- 컬러선택 End -->
				<!-- 종이 규격 선택 Start -->
				<div class="form-group typeSelector">
					<label class="formLabel col-lg-7" for="sizeType">종이 규격 선택</label>
					<div class="row col-lg-7 justify-content-center">
						<div class="col">
							<input type="radio" name="sizeType" value="a5" id="a5">
							<label class="sizeType a5 text-center" for="a5">A5</label>
						</div>
					</div>
				</div>
			</form>
			</c:if>
			<!-- ////////////////// paper form End ////////////////////// -->
			<!-- /////////////////////eBook form Start/////////////////// -->
			<c:if test="${param.prodType=='ebook'}">
				<form>
					<div class="form-group" align="center">
			      		<button type="button" class="btn btn-primary btn-block" 
			      			onclick="addPrintOption()">
			      			원고 등록
			      		</button>
			  		</div>
				</form>
			</c:if>
	   	</div>
	   	<!-- ///////////// Bootstrap Container End ////////////////// -->
	</body>
	<script type="text/javascript">
		//============= 컬러 선택 Event=====================
		$(function(){
			$("input[name='colorType']").on("click",function(){
				var colorType = $("input[name='colorType']:checked").val();
				//alert(colorType);
				if (colorType=="color") {
					$("#colorType").html(": 컬러 도서");
				} else {
					$("#colorType").html(": 흑백 도서");
				}
			});
		});
	</script>
</html>