<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="/common/cdn.jsp"></jsp:include>
<jsp:include page="../toolbar.jsp"></jsp:include>
<script type="text/javascript">
function relocate(payNo){
	self.location="/libero/buy/getFactoryBuy?payNo="+payNo;
}
</script>
</head>
<body>
		<div>
			<jsp:include page="/view/toolbar.jsp"></jsp:include>
		</div>
		<br>
	<div class ="container">
	 <c:set var="i" value="0" />
		  <c:forEach var="factorylist" items="${factorylist}">
			<c:set var="i" value="${ i+1 }" />
				<script>
			$(function(){
				
				var payNo =	$("#payNoBtn"+${i}).val();
				var deliveryStatus = $("#forajaxDeliverystat"+${i}).val();
					alert("결제 번호 , 배송상태 번호 : "+payNo+","+deliveryStatus);
					
					
				$("#forajaxDeliverystat"+${i}).on("click",function(){
				alert("you are in the function now");
			$.ajax({
				url:"/libero/buy/json/updateDeliveryStatus/"+payNo+'/'+deliveryStatus,
				method:"GET",
				dataType:"json",
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}, 
				success:function(result){
					
					alert(result.result);
					$("#forajaxDeliverystat"+${i}).val(result.result)
					$("#listSelect${i}").attr("value",result.result);
 					$(".col-md-8${i}").remove();
					
						//alert('하하호호');
						if(result.result ==2){
						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
								+'<span class="label">상품 준비 중</span>'+'</a>'
								+'</li>'
								+"<li class='active' id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
								+'</li>'
								+'<li id="listSelect${i}">'
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
								+'</li>'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
								+'</li></ul>'+'</div>');
						$("#forajaxDeliverystat${i}").attr("value",result.result);
					}else if(result.result==3){
						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
								+'<span class="label">상품 준비 중</span>'+'</a>'
								+'</li>'
								+"<li  id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
								+'</li>'
								+'<li class="active" id="listSelect${i}">'
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
								+'</li>'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
								+'</li></ul>'+'</div>');
						
					}else if(result.result==4){
						
						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
								+'<span class="label">상품 준비 중</span>'+'</a>'
								+'</li>'
								+"<li  id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
								+'</li>'
								+'<li  id="listSelect${i}">'
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
								+'</li>'
								+"<li class='active' id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
								+'</li></ul>'+'</div>');
						
					}
					
						
				}
				
					})
				})
			})
			
			</script>
			
					<br/>------------------------------------<br/>
				<td align="center"><b>${ i }</b></td>
					<td align="center"  title="Click : 주문정보 확인" >
						<br>------------------------------------<br>
						<div id = "payNo" >
							결제 번호 	:<span id="spans" > <input type="button" class="classPay" id="payNoBtn${i}" value="${factorylist.payNo}" onClick="relocate(${factorylist.payNo});"></span> <br/>
						</div>
						
						결제 방식 	: ${factorylist.receiverAddr} <br/>
						결제 상태 	: ${factorylist.receiverPhone} <br/>
						결제 날짜	: ${factorylist.payDate} <br/>		
						결제자 명	: ${factorylist.buyerId }<br>	
						배송 상태	: <input type="button" value="${factorylist.deliveryStatus}" id="forajaxDeliverystat${i}">	
	<%-- 					<b>상품번호 :${factoryProdNo } </b> --%>
					</td>	
					<div class="row${i}">
  <div class="col-md-8${i}">

    <!-- Stepers Wrapper -->
    <ul class="stepper stepper-horizontal">

      <!-- First Step -->
      <li id="listSelect${i}" class="${factorylist.deliveryStatus == 1 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-cubes"></i></span>
          <span class="label">상품 준비 중</span>
        </a>
      </li>

      <!-- Second Step -->
      <li id="listSelect${i}" class="${factorylist.deliveryStatus == 2 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-clipboard"></i></span>
          <span class="label"><font color="gray">제작 중</font></span>
        </a>
      </li>

      <!-- Third Step -->
      <li id="listSelect${i}" class="${factorylist.deliveryStatus == 3 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-rocket"></i></span>
          <span class="label"><font color="gray">배송 중</font></span>
        </a>
      </li>
	<!-- Forth Step -->
	  <li id="listSelect${i}" class="${factorylist.deliveryStatus == 4 ? 'active' : '' }">
	  	<a href="#!">
	  		<span class="circle" ><i class="fas fa-exclamation"></i></span>
	  		<span class="label"><font color="gray">배송 완료</font></span>
	  	</a>
	  	</li>
    </ul>
    <!-- /.Stepers Wrapper -->

  </div>
</div>		
          </c:forEach>
     </div>
</body>
</html>