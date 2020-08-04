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

<br/><br/><br/><br/><br/><br/>
<h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">서점</h6>
    <h3 class="font-weight-bold text-center dark-grey-text pb-2">ALL</h3>
    <hr class="w-header my-4">

		
    <!--First row-->
    <div class="row">

      <!--First column-->
      <div class="col-12">

   			<ul class="nav justify-content-center brown lighten-4 py-4">
			  <li class="nav-item">
			    <a class="nav-link active" href="/libero/product/getBookList">ALL</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/libero/product/getBookListByCategory/poetry">시</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/libero/product/getBookListByCategory/novel">소설</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/libero/product/getBookListByCategory/essay">수필</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/libero/product/getBookListByCategory/non">비문학</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="/libero/product/getBookListByCategory/edu">교육</a>
			  </li>
			</ul><br/><br/><br/><br/>

      </div>
      <!--First column-->

    </div>
    <!--First row-->

    <!--Tab panels-->
    <div class="tab-content mb-5">

      <!--Panel 1-->
      <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

        <!-- Grid row -->
        <div class="row" id="bookRow">

          <!-- Grid column -->
          
			
			 	<c:set var="i" value="0" />
		  		<c:forEach var="book" items="${book}" end="3">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-sm-3">
            <!-- Card -->
            <a class="card hoverable mb-4 z-depth-0" id="productcard" data-toggle="modal" data-target="#basicExampleModal">

              <!-- Card image -->
              <img class="card-img-top z-depth-1" src="../../resources/images/publish/fileUpload/${book.prodThumbnail}" alt="Card image cap" width="250px" height="400px">
     

              <!-- Card content -->
              <div class="card-body" id="card-body">

                <h5 class="my-3">${book.prodName}</h5>
                <p class="card-text text-uppercase mb-3">${book.author}</p>

              </div>

            </a></div>
         
            <!-- Card -->
            </c:forEach>
            </div></div></div>
            
            <button type="button" class="btn btn-brown" id="button" value="${i}">more</button >
            
            
            		<c:set var="k" value="0" />
		  		<c:forEach var="book" items="${book}">
					<c:set var="k" value="${k+1}"/>
						<input type="hidden" id="prodNo${k}"	value="${book.prodNo}">
						<input type="hidden" id="thumbnail${k}" value="${book.prodThumbnail}">
						<input type="hidden" id="author${k}" 	value="${book.author}">
						<input type="hidden" id="prodName${k}" 	value="${book.prodName}">
				</c:forEach>

</body>
</html>

<script>


			$("#button").on("click", function() {
				var endUnit = $("#button").val();
				alert(endUnit);	
				var displayValue = "<div class='row'>";
				endUnit = parseInt(endUnit)+1;
				
				
// 				var tn = $("#thumbnail"+k).val();
// 				var at = $("#author"+k).val();
// 				var pn = $("#prodName"+k).val();
// 				console.log(tn);
				
// 				displayValue +=
// 						"<div class='col-sm-3'>"
// 					  +"<a class='card hoverable mb-4 z-depth-0' id='productcard' data-toggle='modal' data-target='#basicExampleModal'>"
// 		              +"<img class='card-img-top z-depth-1' src='../resources/images/publish/fileUpload/"+tn+"' alt='Card image cap' width='250px' height='400px'>"
// 		              +"<div class='card-body' id='card-body'>"
// 		              +"<h5 class='my-3'>"+at+"</h5>"
// 		              +"<p class='card-text text-uppercase mb-3'>"+pn+"</p>"
// 		              +"</div>"
// 		              +"</a>"
// 		              +"</div>"
// 		              +"</div>"
		              
		              
		              
// 		              $("#panel31").append(displayValue);
				
				
				
				
				for(var k = endUnit ; k<endUnit+4 ; k++ ){
						var prodNo = $("#prodNo"+k).val();
				
						console.log(prodNo);
						
						if(prodNo == null){
							alert("목록이 더이상 없습니다");
							break;
						}else{
							

							var prodThumbnail = $("#thumbnail"+k).val();
							var prodName = $("#prodName"+k).val();
							var author = $("#author"+k).val();
							console.log(prodThumbnail);
							console.log(prodName);
							console.log(author);
								
							displayValue +=	
								"<div class='col-sm-3'>"
							  +"<a class='card hoverable mb-4 z-depth-0' id='productcard' data-toggle='modal' data-target='#basicExampleModal'>"
				              +"<img class='card-img-top z-depth-1' src='../../resources/images/publish/fileUpload/"+prodThumbnail+"' alt='Card image cap' width='250px' height='400px'>"
				              +"<div class='card-body' id='card-body'>"
				              +"<h5 class='my-3'>"+prodName+"</h5>"
				              +"<p class='card-text text-uppercase mb-3'>"+author+"</p>"
				              +"</div>"
				              +"</a>"
				              +"</div>"
							
							
						}
					

		              
				} 
				    displayValue += "</div>"
							$("#panel31").append(displayValue);
				    
				    $("#button").val(endUnit+3);

				
			});







</script>