<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 등록 도서  조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			.prodThumbnail {
				width: 80px;
				height: 100px;
			}
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<div class="row justify-content-center" style="margin-bottom: 100px">
	   			<button class="btn btn-default">내정보</button>
	   			<a href="/libero/publish/getTempPublishList" 
		   				class="btn btn-default" role="button" 
		   				aria-pressed="true">임시 저장 도서 조회</a>
	   			<button class="btn btn-default">주문내역 조회</button>
	   			<a href="/libero/publish/getUserPublishList?prodType=book" 
		   				class="btn btn-default" role="button" 
		   				aria-pressed="true">판매중인 도서 및 상품 조회</a>
	   		</div>
	   		<div class="row">
		   		<div class="col-lg-2">
		   			<a href="/libero/publish/getUserPublishList?prodType=book" 
		   				class="btn btn-outline-default waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">도서</a>
		   				
		   			<a href="/libero/publish/getUserPublishList?prodType=prod" 
		   				class="btn btn-outline-default waves-effect btn-block" role="button" 
		   				aria-pressed="true">서비스상품</a>
		   		</div>
		   		<div class="col-lg-9">
			   		<c:set var="i" value="0" />
				  	<c:forEach var="prod" items="${list}">
					<c:set var="i" value="${ i+1 }" />
						<div class="card border-light mb-3" style="margin-bottom: 20px">
							<div class="card-body">
								<div class="row">
								
							  		<div class="col-lg-2">
							  			<c:if test="${prod.prodThumbnail!=null}">
							  				<img class="prodThumbnail" src="../resources/images/publish/fileUpload/${prod.prodThumbnail}">
							  			</c:if>
							  			<c:if test="${prod.prodThumbnail==null}">
							  				<img class="prodThumbnail" src="../resources/images/publish/fileUpload/null.png">
							  			</c:if>
							  		</div>
							  		
							  		<div class="col-lg-7 align-self-center">
							  			<table>
							  				<tbody>
							  					<tr>
							  						<th>도서 제목</th>
							  						<td>: ${prod.prodName}</td>
							  					</tr>
							  					<c:if test="${param.prodType=='book'}">
								  					<tr>
								  						<th>저자</th>
								  						<td>: ${prod.author}</td>
								  					</tr>
							  					</c:if>
							  					<tr>
							  						<th>등록 일자</th>
							  						<td>: ${prod.regDate}</td>
							  					</tr>
							  					<tr>
							  						<th>판매량</th>
							  						<td>: ${prod.salesCount}</td>
							  					</tr>
							  				</tbody>
							  			</table>
							  		</div>
							  		
							  		<div class="col-lg-3">
							  			<a href="javascript:popup(${prod.prodNo})" 
							   				class="btn btn-default btn-block" role="button" 
							   				aria-pressed="true" style="margin-bottom: 10px">판매 통계 조회</a>
							  			<button class="btn btn-default btn-block">판매 중지</button>
							  		</div>
						  		</div>
						  		<!-- row End -->
						  	</div>
						  	<!-- Card Body End -->
						</div>
					</c:forEach>
				</div>
			</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	
	<script type="text/javascript">
	
	//==============판매 통계 팝업 ====================
		function popup(prodNo){
	        var url = "/libero/publish/getStatistics?prodNo="+prodNo;
	        var name = "판매 통계 조회";
	        var option = "width = 700, height = 400, top = 100, left = 200, location = no"
	        window.open(url, name, option);
	    }
	</script>
</html>