<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
				<title>상품리뷰</title>
				<style>
				     		.starR1{
							    background: url('../../resources/images/product/star_review.png') no-repeat -52px 0;
							    background-size: auto 100%;
							    width: 15px;
							    height: 30px;
							    float:left;
							    text-indent: -9999px;
							    cursor: pointer;
							}
							.starR2{
							    background: url('../../resources/images/product/star_review.png') no-repeat right 0;
							    background-size: auto 100%;
							    width: 15px;
							    height: 30px;
							    float:left;
							    text-indent: -9999px;
							    cursor: pointer;
							}
							.starR1.on{background-position:0 0;}
							.starR2.on{background-position:-15px 0;}
				</style>
</head>
<body>
<jsp:include page="/common/cdn.jsp"></jsp:include>

<ul class="navbar-nav">
				<li class="nav-item" id="review">
					<a class="nav-link" href="#" data-toggle="modal" data-target="#addReviewModal">리뷰 등록</a>
				</li>
</ul>


<ul class="navbar-nav">
				<li class="nav-item" id="review">
					<a class="nav-link" href="#" data-toggle="modal" data-target="#updateReviewModal">리뷰 등록</a>
				</li>
</ul>

				
<div class="modal fade" id="addReviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
				<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">리뷰 등록</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
						</button>
				
				</div>
				<div class="modal-body">
						<form name="addReviewForm">
								<div class="form-group">
								<label for="recipient-name" class="col-form-label">별점</label>
									<div class="starRev">
									  <span class="starR1 on" id="5" >별1_왼쪽</span>
									  <span class="starR2" id="10" >별1_오른쪽</span>
									  <span class="starR1" id="15" >별2_왼쪽</span>
									  <span class="starR2" id="20" >별2_오른쪽</span>
									  <span class="starR1" id="25" >별3_왼쪽</span>
									  <span class="starR2" id="30" >별3_오른쪽</span>
									  <span class="starR1" id="35" >별4_왼쪽</span>
									  <span class="starR2" id="40" >별4_오른쪽</span>
									  <span class="starR1" id="45" >별5_왼쪽</span>
									  <span class="starR2" id="50" >별5_오른쪽</span>
									  <input type="hidden" id="starRate" name="starRate" value="">
									</div></br></br>
								
								<!--Material textarea-->
									
									<div class="md-form">
										  <textarea id="textarea-char-counter" class="form-control md-textarea" length="120" rows="3" name="reviewContent">하이요</textarea>
										  <label for="textarea-char-counter" id="review">Type your text</label>
										  <input type="hidden" id="reviewContent" name="reviewContent">
									</div>
								
								</div>
						
						</form>
				
				</div>
				
				<div class="modal-footer">
						<button type="button" class="btn btn-cyan" id="addButton">등록</button>
						<button type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">취소</button>
				</div>
			</div>
			</div>
		</div>
		</div>			
		</ul>
	</body>
	<script type="text/javascript">
				$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  var content = $("#textarea-char-counter").text();
					  var starRate = $(this).attr("id");
					  
					  $("#starRate").val(starRate);
					  var star = $("#starRate").val();
					  alert(star);
					 
					  alert(content);
					  alert(starRate);
					  
					  
					  
					  
					  
					  return false;
					});
				
				$('#addButton').click(function(){
					$("form").attr("method" , "POST").attr("action" , "/libero/product/json/addReview").submit();	
				})
				
	</script>
</html>