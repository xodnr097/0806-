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

    #getBook{
      width: 150px;
      height: 150px;
      margin: 50px;

      /* list 앞에 점마크 지우기*/
      list-style: none;

      /* inline 배치로 바꾸기 */
      display: inline-block;
    }

    #getBook{

      /* 일렬로 나열 */
      white-space: nowrap;
    }

</style>


</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
<!--  
<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="book" items="${book}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : 주문정보 확인">
				
					${book.prodNo} <br/>
					${book.prodName} <br/>
					${book.prodType} <br/>
					${book.retailPrice} <br/>
					${book.printPrice} <br/>
					${book.author} <br/>
					${book.purposeCode} <br/>
					${book.regDate} <br/>
					${book.discountCode} <br/>
				</td>
          </c:forEach>
        
        </tbody>
 -->       
        <br/>
        <br/>
        <br/>
        <tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="book" items="${book}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				
				 <!--Grid row-->
      <div class="row" id="getBook">

        <!--Grid column-->
        <div class="col-lg-4 col-md-8 mb-4">
        <!-- Card -->
				<span class="card promoting-card" style="height: 200px; width:200px">
				
				  <!-- Card content -->
				  <div class="card-body d-flex flex-row">
				
				    <!-- Avatar -->
				    <!-- <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg" class="rounded-circle mr-3" alt="avatar"> -->
				
				    <!-- Content -->
				    <div>
				
				      <!-- Title -->
				      <!--<h4 class="card-title font-weight-bold mb-2">#</h4>-->
				      <!-- Subtitle -->
				      <!--  <p class="card-text"><i class="far fa-clock pr-2"></i></p>-->
				
				    </div>
				
				  </div>
				
				  <!-- Card image -->
				  <div class="view overlay">
				    <img class="card-img-top rounded-0" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg" alt="Card image cap" style="height: 150px; width:100px">
				    <a href="#!">
				      <div class="mask rgba-white-slight"></div>
				    </a>
				  </div>
				
				  <!-- Card content -->
				  <div class="card-body">
				
				    <div class="collapse-content">
				
				      <!-- Text -->
				      <p class="card-text collapse" id="collapseContent">
									<h6 class="card-title font-weight-bold mb-2"><a href="/libero/product/getProduct/${book.prodNo}">상품명:${book.prodName}</h6></a>
									<h6 class="card-title font-weight-bold mb-2">상품종류:${book.prodType}</h6>
									<h6 class="card-title font-weight-bold mb-2">작가:${book.author}</h6>
				      </p>
				      <!-- Button -->
				      <a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed" data-toggle="collapse" href="#collapseContent" aria-expanded="false" aria-controls="collapseContent"></a>
				      <i class="fas fa-share-alt text-muted float-right p-1 my-1" 	 data-toggle="tooltip" data-placement="top" title="Share this post"></i>
				      <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3" 	 data-toggle="tooltip" data-placement="top" title="I like it"></i>
				
				    </div>
				
				  </div>
				
				</div>
				</div>
				</div>
<!-- Card -->
					
				</td>
          </c:forEach>
          
          
        
</tbody>

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
		  		<c:forEach var="book" items="${book}">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-sm-3">
            <!-- Card -->
            <a class="card hoverable mb-4 z-depth-0" id="productcard" data-toggle="modal" data-target="#basicExampleModal">

              <!-- Card image -->
              <img class="card-img-top" src="libero/resources/images/publish/fileUpload/${book.prodThumbnail}" alt="Card image cap">
              <br/>${book.prodThumbnail}

              <!-- Card content -->
              <div class="card-body" id="card-body">

                <h5 class="my-3">${book.prodName}</h5>
                <p class="card-text text-uppercase mb-3">Bag, Box</p>

              </div>

            </a></div>
         
            <!-- Card -->
            </c:forEach>
            </div></div></div>


</body>
</html>