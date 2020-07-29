<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<style>

.collapse-content .fa.fa-heart:hover {
  color: #f44336 !important;
}
.collapse-content .fa.fa-share-alt:hover {
  color: #0d47a1 !important;
}

    div.row{
      width: 150px;
      height: 150px;
      margin: 35px;

      /* list 앞에 점마크 지우기*/
      list-style: none;

      /* inline 배치로 바꾸기 */
      display: inline-block;
    }

    div.row{

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

<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				
				 <!--Grid row-->
      <div class="row">

        <!--Grid column-->
        <div class="col-lg-4 col-md-8 mb-4">
        <!-- Card -->
				<span class="card promoting-card" style="height: 200px; width:200px">
				
				  <!-- Card content -->
				  <div class="card-body d-flex flex-row">
				
				    <!-- Avatar -->
				    <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-8.jpg" class="rounded-circle mr-3" alt="avatar">
				
				    <!-- Content -->
				    <div>
				
				      <!-- Title -->
				      <h4 class="card-title font-weight-bold mb-2">#</h4>
				      <!-- Subtitle -->
				      <p class="card-text"><i class="far fa-clock pr-2"></i>07/24/2018</p>
				
				    </div>
				
				  </div>
				
				  <!-- Card image -->
				  <div class="view overlay">
				    <img class="card-img-top rounded-0" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/full page/2.jpg" alt="Card image cap" style="height: 10px; width:10px">
				    <a href="#!">
				      <div class="mask rgba-white-slight"></div>
				    </a>
				  </div>
				
				  <!-- Card content -->
				  <div class="card-body">
				
				    <div class="collapse-content">
				
				      <!-- Text -->
				      <p class="card-text collapse" id="collapseContent">
									<h6 class="card-title font-weight-bold mb-2">상품명:${product.prodName}</h6>
									<h6 class="card-title font-weight-bold mb-2">상품종류:${product.prodType}</h6>
									<h6 class="card-title font-weight-bold mb-2">작가:${product.creator}</h6>
				      </p>
				      <!-- Button -->
				      <a class="btn btn-flat red-text p-1 my-1 mr-0 mml-1 collapsed" data-toggle="collapse" href="#collapseContent" aria-expanded="false" aria-controls="collapseContent"></a>
				      <i class="fas fa-share-alt text-muted float-right p-1 my-1" data-toggle="tooltip" data-placement="top" title="Share this post"></i>
				      <i class="fas fa-heart text-muted float-right p-1 my-1 mr-3" data-toggle="tooltip" data-placement="top" title="I like it"></i>
				
				    </div>
				
				  </div>
				
				</div>
				</div>
				</div>
<!-- Card -->
					
				</td>
          </c:forEach>
        
</tbody>
        
        
        

</body>
</html>