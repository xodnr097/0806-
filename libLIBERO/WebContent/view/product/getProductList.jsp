<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>

<style>

.collapse-content .fa.fa-heart:hover {
  color: #f44336 !important;
}
.collapse-content .fa.fa-share-alt:hover {
  color: #0d47a1 !important;
}

    /* #product{
     

      /* list 앞에 점마크 지우기*/
      /* list-style: none; */

      /* inline 배치로 바꾸기 */
      /* display: inline-block; */
   /* } */

    


</style>


</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
<!-- 
<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				
					${product.prodName} </br>
					${product.prodType}
				</td>
          </c:forEach>
        
        </tbody>
-->       

<br/>
<br/>
<br/>

 <h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">portfolio</h6>
    <h3 class="font-weight-bold text-center dark-grey-text pb-2">Product Designs</h3>
    <hr class="w-header my-4">
    <p class="lead text-center text-muted pt-2 mb-5">You can find several product design by our professional team in
      this section.</p>
		
    <!--First row-->
    <div class="row">

      <!--First column-->
      <div class="col-12">

        <!-- Nav tabs -->
        <ul class="nav md-pills flex-center flex-wrap mx-0" role="tablist">
          <li class="nav-item">
            <a class="nav-link active font-weight-bold text-uppercase" data-toggle="tab" href="#panel31" role="tab">ALL</a>
          </li>
          <li class="nav-item">
            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#panel32" role="tab">Design</a>
          </li>
          <li class="nav-item">
            <a class="nav-link font-weight-bold text-uppercase" data-toggle="tab" href="#panel33" role="tab">Mockup</a>
          </li>
        </ul>

      </div>
      <!--First column-->

    </div>
    <!--First row-->

    <!--Tab panels-->
    <div class="tab-content mb-5">

      <!--Panel 1-->
      <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

        <!-- Grid row -->
        <div class="row">

          <!-- Grid column -->
          
			
			 	<c:set var="i" value="0" />
		  		<c:forEach var="product" items="${product}">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-sm-3">
            <!-- Card -->
            <a class="card hoverable mb-4 z-depth-0" id="productcard" data-toggle="modal" data-target="#basicExampleModal">

              <!-- Card image -->
              <img class="card-img-top" src="../../resources/images/publish/fileUpload/${product.prodThumbnail}" alt="Card image cap">
              <br/>${product.prodThumbnail}

              <!-- Card content -->
              <div class="card-body" id="card-body">

                <h5 class="my-3">${product.prodName}</h5>
                <p class="card-text text-uppercase mb-3">Bag, Box</p>

              </div>

            </a></div>
         
            <!-- Card -->
            </c:forEach>
            </div></div></div>

<!-- <tbody> -->
		<div class="container">
		<div class="row">
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }" />
			
	<!--<tr> <td align="center">${ i }</td> -->			
				

	
		<div class="col-3">
		 <!-- Card -->
			<div class="card booking-card">
			
			  <!-- Card image -->
			  <div class="view overlay">
			    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/8-col/img (5).jpg" alt="Card image cap">
			    <a href="#!">
			      <div class="mask rgba-white-slight"></div>
			    </a>
			  </div>
			
			  <!-- Card content -->
			  <div class="card-body">
			
			    <!-- Title -->
			    <h4 class="card-title font-weight-bold"><a>La Sirena restaurant</a></h4>
			    <!-- Data -->
			    <ul class="list-unstyled list-inline rating mb-0">
			      <li class="list-inline-item mr-0"><i class="fas fa-star amber-text"> </i></li>
			      <li class="list-inline-item mr-0"><i class="fas fa-star amber-text"></i></li>
			      <li class="list-inline-item mr-0"><i class="fas fa-star amber-text"></i></li>
			      <li class="list-inline-item mr-0"><i class="fas fa-star amber-text"></i></li>
			      <li class="list-inline-item"><i class="fas fa-star-half-alt amber-text"></i></li>
			      <li class="list-inline-item"><p class="text-muted">3.5 (413)</p></li>
			    </ul>
			    <p class="mb-2">$ • American, Restaurant</p>
			    <!-- Text -->
			    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
			    <hr class="my-4">
			    <p class="lead"><strong>Tonight's availability</strong></p>
			    
			    <!-- Button -->
			    <a href="#" class="btn btn-flat deep-purple-text p-1 mx-0 mb-0">Button</a>
				
			  </div>
			
			</div>
<!-- Card -->
		</div>
	
     
					
				<!--</td>  -->
				
          </c:forEach>
          </div>
			</div>
        
<!-- </tbody> -->
        <br/>
        <br/>

        <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }" />
				<c:if test="i % 6 equal 0">
					<ul><h6>안녕하세요</h6>
					         <c:if test="[i % 6] eq 0">안녕하세요!</c:if>
       						 <c:if test="[i mod 6] eq 0">안녕하세요1</c:if>
     					     <c:if test="${i mod 6} eq 0">안녕하세요2</c:if>
     					     <c:if test="[${i mod 6} % 6] eq 0">안녕하세요3</c:if>
        
				</c:if>
				<li>
					상품명:${product.prodName}
				</li>
				<c:if test="i % 6 equal 5">
					</ul><h6>안녕히가세요</h6></h6><br/><br/>
				</c:if>
			
        </c:forEach>
        

</body>
</html>