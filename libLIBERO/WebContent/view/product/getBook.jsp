<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	
	
	
	
	
	
<title>????  ????</title>
		
</head>


<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
		<jsp:include page="../community/addReport.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>

					梨?踰??? ${product.prodNo} <br/>
					???? ???? ${product.prodType} <br/>
					???? ???? ${product.prodDetail} <br/>
					????紐? ${product.prodName} <br/> 
					??鍮???媛? ${product.retailPrice} <br/>
					???? ${product.author} <br/>
					???몄?щ? ${product.blindCode} <br/>
					而щ?? ${product.colorType} <br/>
					??吏? ${product.coverType} <br/>
					?댁? ${product.innerType} <br/>
					???깆?? ${product.creator}	<br/>
					
	
		<img src="${wish}" id='wish_img' width="70px" height="70px"/><h6>designed by freepik</h6>
		<input type="number" name="buyAmount" id="buyAmount" onblur="buyAmount()" value="0">媛?</td>
		<div class="form-group" align="center">
			<button type="button" id="button" class="btn btn-info btn-block" 
				onclick="addCart()">
				
			</button>
		</div>
		<!-- ??怨? 異?媛? -->
		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
		<button id="reportBtn" class="btn btn-outline-info">占신곤옙</button>
		<input type="hidden" id="prodPost" name="prodPost" value="prod"/>
		
		<!-- Classic tabs -->
		<div class="classic-tabs">
		
		  <ul class="nav tabs-cyan" id="myClassicTab" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link  waves-light active show" id="profile-tab-classic" data-toggle="tab" href="#profile-classic"
		        role="tab" aria-controls="profile-classic" aria-selected="true">Profile</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link waves-light" id="follow-tab-classic" data-toggle="tab" href="#follow-classic" role="tab"
		        aria-controls="follow-classic" aria-selected="false">Follow</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link waves-light" id="contact-tab-classic" data-toggle="tab" href="#contact-classic" role="tab"
		        aria-controls="contact-classic" aria-selected="false">Contact</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link waves-light" id="awesome-tab-classic" data-toggle="tab" href="#awesome-classic" role="tab"
		        aria-controls="awesome-classic" aria-selected="false">Be awesome</a>
		    </li>
		  </ul>
		  <div class="tab-content border-right border-bottom border-left rounded-bottom" id="myClassicTabContent">
		    <div class="tab-pane fade active show" id="profile-classic" role="tabpanel" aria-labelledby="profile-tab-classic">
		      
		    </div>
		    <div class="tab-pane fade" id="follow-classic" role="tabpanel" aria-labelledby="follow-tab-classic">
						 
						 
			 		  <c:set var="i" value="0" />
							  <c:forEach var="review" items="${review}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="center">${ i }</td>
									<td align="left"  title="Click : 二쇰Ц??蹂? ????">
									
										${review.starRate} <br/>
										${review.userId }<br/>
										${review.regDate} <br/>
										${review.reviewContent} <br/>
										${review.reviewImage}
										<img src="../../resources/images/product/fileUpload/review/${review.reviewImage}">
										
									</td>
					          </c:forEach>
					
		    </div>
		    <div class="tab-pane fade" id="contact-classic" role="tabpanel" aria-labelledby="contact-tab-classic">
		      <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
		        deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
		        provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.
		        Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est
		        eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas
		        assumenda est, omnis dolor repellendus. </p>
		    </div>
		    <div class="tab-pane fade" id="awesome-classic" role="tabpanel" aria-labelledby="awesome-tab-classic">
		      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
		        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
		        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
		        eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
		        deserunt mollit anim id est laborum.</p>
		    </div>
		  </div>
		
		</div>
		<!-- Classic tabs -->
		
		 	

</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    //alert(${product.prodNo});
	    alert("${sessionScope.user.userId}");
	});
	
// 	$(function(){
// 		$("input").attr("onclick","buyAmount()");
// 	})
	
	function buyAmount(){
		var buyAmount = $("#buyAmount").val();
	}
	
	$(document).ready(function(){
			$('#wish_img').on("click", function(){
				var userId = "${sessionScope.user.userId}";
				if (userId=="") {
					alert("濡?洹몄?? ?댁＜?몄??.");
					return;
				}
				
				
			
				$.ajax({
					url : "/libero/product/json/addWish",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": ${product.prodNo}, "userId": "${sessionScope.user.userId}" },
					success : function(data){
						
						var wish_img = data.wishImage
			
						$('#wish_img').attr('src', wish_img);
					}//end success
				});//end ajax
			});//end click function
	});//end ready
	
	function addCart() {
		var userId = "${sessionScope.user.userId}";
		var phoneCode = "${sessionScope.user.phoneCode}";
		var buyAmount = $("#buyAmount").val();
		//alert(buyAmount);
		
		if (userId=="") {
			alert("濡?洹몄?? ?댁＜?몄??.");
			return;
		}
		if (phoneCode!=1) {
			alert("?대???? 蹂몄?몄?몄??? ??猷??? ????留? 媛??ν?⑸????.");
			return;
		}
		if (buyAmount==0) {
			alert("?????? ?????댁＜?몄??.");
			return;
		}
		
		$.ajax({
			url : "/libero/product/json/addCart",
			type: "POST",
			dataType: "json",
			header : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
			},
			data: {"prodNo": ${product.prodNo}, "prodType": "${product.prodType}", "userId": "${sessionScope.user.userId}", "buyAmount": buyAmount, "from": "product"},
			success : function(data){
						var message = data.result
						alert(message);
			}
		});//end ajax
		
	}//end addCart
		
		//$("form").attr("method" , "POST").attr("action" , "/libero/product/json/addCart").submit();
	</script>
</html>