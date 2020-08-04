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
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row">
		   		<div class="col-lg-2">
		   			<a href="/libero/user/getUserPublishList?prodType=book" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">도서</a>
		   				
		   			<a href="/libero/user/getUserPublishList?prodType=prod" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
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
							  				<img class="prodThumbnail" src="../resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}">
							  			</c:if>
							  			<c:if test="${prod.prodThumbnail==null}">
							  				<img class="prodThumbnail" src="../resources/images/publish/fileUpload/null.png">
							  			</c:if>
							  		</div>
							  		
							  		<div class="col-lg-7 align-self-center">
							  			<table>
							  				<tbody>
							  					<tr>
							  						<th>
							  							${param.prodType=='book' ? '도서' : '상품' } 제목</th>
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
							   				class="btn btn-brown btn-block" role="button" 
							   				aria-pressed="true" style="margin-bottom: 10px">판매 통계 조회</a>
							   			<c:if test="${prod.blindCode=='show'}">
							  				<button class="btn btn-outline-brown waves-effect btn-block">판매 중지</button>
							  			</c:if>
							  			<c:if test="${prod.blindCode=='hide'}">
							  				<button class="btn btn-brown btn-block">판매 재개</button>
							  			</c:if>
							  			<c:if test="${prod.blindCode=='report'}">
							  				<button class="btn btn-brown btn-block">수정 요청</button>
							  			</c:if>
							  		</div>
						  		</div>
						  		<!-- row End -->
						  		<div class="row col-lg-12">
									<c:if test="${prod.blindCode=='report'}">
										<p style="margin: 0">신고로 숨김 처리 당한 상품입니다.<br/>신고사유 : ${prod.reportType}</p>
									</c:if>
								</div>
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
	        var option = "width = 1000, height = 500, top = 50, left = 50, location = no"
	        window.open(url, name, option);
	    }
	</script>
</html>