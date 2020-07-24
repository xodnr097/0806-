<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 가격 책정</title>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
		.hrColor {
			border-color: #8DCCBF;
		}
		.formLabel {
			font-size: 20px;
			background-color: #FFFFFF;
			color: rgb(62, 121, 108);
			width: 100%;
			padding-top: 10px;
			padding-bottom: 10px;
			margin-bottom: 0;
			font-family: 'Nanum Gothic', sans-serif;
		}
		</style>
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<!-- Horizontal Steppers -->
				<div class="row">
					<div class="col-md-12">
				
				    <!-- Stepers Wrapper -->
				    <ul class="stepper stepper-horizontal">
				
				    	<!-- First Step -->
				    	<li class="completed">
				        	<a href="#!">
				          		<span class="circle">1</span>
				          		<span class="label">인쇄옵션 등록</span>
				        	</a>
				      	</li>
				
				      	<!-- Second Step -->
				      	<li class="completed">
				        	<a href="#!">
				          		<span class="circle">2</span>
				          		<span class="label">원고 등록</span>
				        	</a>
				      	</li>
				
				      	<!-- Third Step -->
				      	<li class="completed">
					        <a href="#!">
					          	<span class="circle">3</span>
					          	<span class="label">도서 정보 등록</span>
					        </a>
				     	</li>
				     	
				     	<!-- Fourth Step -->
				      	<li class="active">
					        <a href="#!">
					          	<span class="circle">4</span>
					          	<span class="label">가격 책정</span>
					        </a>
				     	</li>
					
				    </ul>
				    <!-- /.Stepers Wrapper -->
				
				  	</div>
				</div>
				<!-- /.Horizontal Steppers -->
	   		<!-- 가격 책정 폼 Start -->
	   		<!-- Extended material form grid -->
			<form>
				<input type="hidden" name="prodNo" value="${param.prodNo}">
				<!-- Grid row -->
				<div class="form-row">
				    <!-- Grid column -->
				    <div class="col-lg-8">
					    <!-- Material input -->
					    <div class="md-form form-group">
			      			<div class="formLabel">가격 책정</div>
			      			<hr class="hrColor">
			      		</div>
			      		<div class="md-form input-group mb-0">
  							<input type="text" name="retailPrice" class="form-control col-lg-5" onblur="retailView()" value="${prod.retailPrice}">
  							<div class="input-group-append">
    							<span class="input-group-text md-addon">원</span>
  							</div>
						</div>
			    	</div>
			    	<!-- Grid column -->
			
			    	<!-- Grid column -->
			    	<div class="col-lg-4">
			    		<!-- Material input -->
			    		<div class="md-form form-group">
			      			<div class="formLabel">최종 소비자 가격</div>
			      			<hr class="hrColor">
			      			<!-- <table style="width: 100%">
			      				<tbody>
			      					<tr>
			      						<td class="text-right font-weight-bold">fdsaf</td>
			      						<th class="text-right font-weight-bold" style="width: 20px">원</th>
			      					</tr>
			      				</tbody>
			      			</table> -->
			      			<div class="text-right font-weight-bold retailView">${prod.retailPrice}원</div>
			      		</div>
				    </div>
				    <!-- Grid column -->
				</div>
			  	<!-- Grid row -->
			
				<!-- Grid row -->
				<div class="form-row">
					<!-- Grid column -->
					<div class="col-lg-8">
			    		<!-- Material input -->
			    		<div class="md-form form-group">
			      			<div class="formLabel">할인 적용 여부</div>
			      			<hr class="hrColor">
			      		</div>
						<div class="custom-control custom-checkbox custom-control-inline ">
						  <input type="checkbox" class="custom-control-input" id="discountCode" name="discountCode" value="x">
						  <label class="custom-control-label" for="discountCode">할인 제외</label>
						</div>
				    </div>
				    <!-- Grid column -->
				    
				    <!-- Grid column -->
			    	<div class="col-lg-4">
			    		<!-- Material input -->
			    		<div class="md-form form-group">
			      			<div class="formLabel">예상 수익금</div>
			      			<hr class="hrColor">
			      			<table style="width: 100%">
			      				<tbody>
			      					<tr>
			      						<th>소비자 가격</th>
			      						<td class="text-right retailView">${prod.retailPrice}원</td>
			      					</tr>
			      					<tr>
			      						<th>인쇄비</th>
			      						<td id="printPrice" class="text-right">- ${prod.printPrice}원</td>
			      					</tr>
			      					<tr>
			      						<th>리브리베로 수수료</th>
			      						<td id="fee" class="text-right"></td>
			      					</tr>
			      				</tbody>
			      			</table>
			      			<hr>
			      			<div id="finalPrice" class="text-right font-weight-bold"></div>
			      		</div>
				    </div>
				    <!-- Grid column -->
			  </div>
			  <!-- Grid row -->
			
			  
			  <!-- Grid row -->
			  <div class="md-form form-group" align="center">
			      		<button type="button" class="btn btn-cyan btn-block" 
			      			onclick="addRetailPrice()">
			      			최종 확인 및 등록
			      		</button>
			  		</div>
			</form>
			<!-- Extended material form grid -->
	   		<!-- 가격 책정 폼 End -->
	   	</div>
	</body>
	<script type="text/javascript">
		$(function(){
			var price = $("input[name='retailPrice']").val();
			var printPrice = "${prod.printPrice}";
			var fee = Math.ceil(price*0.3/10)*10;
			
			$("#fee").html("- "+fee+"원");
			
			$("#finalPrice").html(price-printPrice-fee+"원");
		});
		
		function retailView() {
			var price = $("input[name='retailPrice']").val();
			var printPrice = "${prod.printPrice}";
			// 10의 자리에서 올림
			var fee = Math.ceil(price*0.3/10)*10;
			price = Math.ceil(price/100)*100;
			
			// 올림값 반환
			$("input[name='retailPrice']").val(price);
			$(".retailView").html(price+"원");
			$("#fee").html("- "+fee+"원");
			
			$("#finalPrice").html(price-printPrice-fee+"원");
		}
		
		function addRetailPrice() {
			/* var price = $("input[name='retailPrice']").val(); */
			var finalPrice = $("#finalPrice").html();
			finalPrice = Number(finalPrice.slice(0,-1));
			
			/* if (price == "") {
				alert("가격을 입력해주세요");
				return;
			} */
			if (0>finalPrice) {
				alert("수익금이 마이너스입니다. 가격을 높여주세요");
				return;
			}
			$("form").attr("method" , "POST").attr("action" , "/libero/publish/addRetailPrice").submit();
		}
	</script>
</html>