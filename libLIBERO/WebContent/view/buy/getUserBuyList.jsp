<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<jsp:include page="/view/toolbar.jsp"></jsp:include>
	
<head>
	<script type="text/javascript">
	
	function relocate(payNo,userId){
		self.location="/libero/buy/getUserBuy?userId="+userId+"&payNo="+payNo;
	}
	

	
	</script>
		
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>

<div class="container">	

<div class="col">
  <c:set var="i" value="0" />
		  <c:forEach var="buyList" items="${buyList}">
			<c:set var="i" value="${ i+1 }" />
			
			<script>
			$(function(){
				
				var payNo =	$("#forajaxPayNo"+${i}).val();
				var deliveryStatus = $("#forajaxDeliverystat"+${i}).val();
					alert("결제 번호 , 배송상태 번호 : "+payNo+","+deliveryStatus)
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
			
			<tr>
					<br>					<br>
				<td align="center"><b>${ i }</b></td>
				<td align="left"  title="Click : 주문정보 확인">
				
					<br>					<br>
					<td align="center" >결제 번호 	:<input type="button" id="forajaxPayNo${i}" value="${buyList.payNo}" onClick="relocate(${buyList.payNo},${session.userId });" > <br/></td>
					<td align="center">결제 방식 	: ${buyList.paymentOption} <br/></td>
					<td align="center" >결제 상태 	: ${buyList.payStatus} <br/></td>
					<td align="center">수령자		: ${buyList.receiverName} <br/></tr>
					<td align="center">수령자주소	: ${buyList.receiverAddr} <br/><td>
					<td align="center">연락처		: ${buyList.receiverPhone} <br/></td>
					<td align="center">가격		: ${buyList.actualPrice} <br/></td>
					<td align="center">결제 일자	: ${buyList.payDate} <br></td>
					<td align="center">배송 상태 	: <input type="button" value="${buyList.deliveryStatus }" id="forajaxDeliverystat${i}" ></td>
					
					
					
					<!-- 결제 완료 후, 제작 준비 중 -->
<div class="row${i}">
  <div class="col-md-8${i}">

    <!-- Stepers Wrapper -->
    <ul class="stepper stepper-horizontal">

      <!-- First Step -->
      <li id="listSelect${i}" class="${buyList.deliveryStatus == 1 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-cubes"></i></span>
          <span class="label">상품 준비 중</span>
        </a>
      </li>

      <!-- Second Step -->
      <li id="listSelect${i}" class="${buyList.deliveryStatus == 2 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-clipboard"></i></span>
          <span class="label"><font color="gray">제작 중</font></span>
        </a>
      </li>

      <!-- Third Step -->
      <li id="listSelect${i}" class="${buyList.deliveryStatus == 3 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-rocket"></i></span>
          <span class="label"><font color="gray">배송 중</font></span>
        </a>
      </li>
	<!-- Forth Step -->
	  <li id="listSelect${i}" class="${buyList.deliveryStatus == 4 ? 'active' : '' }">
	  	<a href="#!">
	  		<span class="circle" ><i class="fas fa-exclamation"></i></span>
	  		<span class="label"><font color="gray">구매확정</font></span>
	  	</a>
	  	</li>
    </ul>
    <!-- /.Stepers Wrapper -->

  </div>
</div>

		 
				
			
          </c:forEach>
          </div>
          </div>		
</body>
</html>