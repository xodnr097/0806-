<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
		.navbar-light {
		    border-bottom: 2px solid #8DCCBF;
		    font-family: 'Nanum Gothic', sans-serif;
		}
		
		#mobileNav {
			border-bottom: 0px;
		}

		/* change the brand and text color */
		.navbar-light .navbar-brand,
		.navbar-light .navbar-text {
		    color: #8DCCBF;
		}

		/* change the link color */
		.navbar-light .nav-item.active .nav-link,
		.navbar-light .navbar-nav .nav-link {
		    color: #8DCCBF;
		}
		
		/* change the color of active or hovered links */
		.navbar-light .nav-item:hover .nav-link {
		    color: #3E796C;
		}
		
		.navbar-light .dropdown-item {
		    color: #8DCCBF;
		}
		
		.navbar-light .dropdown-item:hover {
		    color: #3E796C;
		    background-color: #EAEAEA;
		}
		
		.navbar-light .dropdown-item:focus {
			color: #3E796C;
			background-color: #EAEAEA;
		}
</style>
</head>

	<!-- Custom nvbar color -->
		<nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
		    <a href="/libero/index.jsp" class="navbar-brand">
		    	<img src="http://127.0.0.1:8080/libero/resources/images/common/logo.png" width="80" height="25" alt="" loading="lazy">
		    </a>
		    <!-- 모바일 navbar -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			</button>
			<!-- 모바일 navbar 끝 -->
		    <!-- left Button Start -->
		    <div class="collapse navbar-collapse" id="navbarNavDropdown">
			    <ul class="navbar-nav mr-auto">
			    	<!-- 책만들기 Start -->
			    	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	책만들기
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="/libero/publish/addPrintOption?prodType=paper">종이책 만들기</a>
				          <a class="dropdown-item" href="/libero/publish/addPrintOption?prodType=ebook">전자책 만들기</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="/libero/publish/addProduct?prodType=cover">표지디자인 등록</a>
				          <a class="dropdown-item" href="/libero/publish/addProduct?prodType=correct">교정교열 등록</a>
				        </div>
			      	</li>
			      	<!-- 책만들기 End -->
			      	<!-- 작가서비스 Start -->
			      	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	작가서비스
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="/libero/product/getProductList/design">표지디자인</a>
				          <a class="dropdown-item" href="/libero/product/getProductList/target">맞춤형 표지디자인</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="/libero/product/getProductList/correct">교정 교열</a>
				        </div>
			      	</li>
			      	<!-- 서점 Start -->
			      	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="/libero/product/getBookList" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	서점
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				        <a class="dropdown-item" href="/libero/product/getBookList">메인</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="/libero/product/getBookListByCategory/poetry">시</a>
				          <a class="dropdown-item" href="/libero/product/getBookListByCategory/novel">소설</a>
				          <a class="dropdown-item" href="/libero/product/getBookListByCategory/essay">수필</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="/libero/product/getBookListByCategory/non">비문학</a>
				          <a class="dropdown-item" href="/libero/product/getBookListByCategory/edu">교육</a>
				          
				        </div>
			      	</li>
			      	<!-- 커뮤니티 Start -->
			      	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	커뮤니티
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="/libero/community/getPostList">공지사항</a>
				          <a class="dropdown-item" href="#">자유게시판</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="#">1:1문의</a>
				        </div>
			      	</li>
			      	<!-- 커뮤니티 End -->
			    </ul>
			    <!-- right nav Start -->
			    <ul class="navbar-nav">
			    		<!-- <div id="login"> -->
					        <li class="nav-item" id="login">
		                    	<a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">로그인</a>
	              			</li>
	              		<!-- </div> -->
				    
				    	<!-- 회원 dropdown Start -->
				    	
				      	<li class="nav-item dropdown" id="userDropdown">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					          	${sessionScope.user.nickname}님
					        </a>
					        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
					          <a class="dropdown-item" href="#">마이페이지</a>
					          <a class="dropdown-item" href="/libero/product/getCartList">장바구니</a>
					          <a class="dropdown-item" href="/libero/publish/getUserPublishList?prodType=book">판매 도서 및 상품 조회</a>
					          <c:if test="${sessionScope.user.role=='f'}">
					          	<c:if test="${sessionScope.user.colorPrice==''}">
					          		<a class="dropdown-item" href="/libero/publish/addOptionPrice">인쇄옵션 가격 등록</a>
					          	</c:if>
					          	<c:if test="${sessionScope.user.colorPrice!=''}">
						          	<a class="dropdown-item" href="/libero/publish/getOptionPrice">인쇄옵션 가격 조회</a>
					          	</c:if>
					          </c:if>
					          <div class="dropdown-divider"></div>
					          <a class="dropdown-item" href="/libero/user/logout">로그아웃</a>
					        </div>
				      	</li>
				      	<!-- 회원 dropdown End -->
	            </ul>
			</div>
		</nav>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="exampleModalLabel">libLIBERO 로그인</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
		        		<form name="loginForm">
		          			<div class="form-group">
		            			<label for="recipient-name" class="col-form-label">아이디</label>
		            			<input type="text" class="form-control" id="userId" name="userId">
		          			</div>
		          			<div class="form-group">
		            			<label for="message-text" class="col-form-label">비밀번호</label>
		            			<input type="password" class="form-control" id="password" name="password">
		          			</div>
		        		</form>
		      		</div>
		      		<div class="modal-footer">
		      			<button type="button" class="btn btn-cyan" id="loginButton">로그인</button>
		        		<button type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">취소</button>
		        		<a href="#"><button type="button" class="btn btn-info" id="addUser">회원가입</button></a>
		      		</div>
		    	</div>
		  	</div>
		</div>
		<!-- Modal End -->
	</body>
	<script>
	//============= 회원가입============
		$("#addUser").on("click",function(){
			self.location="/libero/view/user/addUser.jsp"
		//회원가입 온클릭 함수 
		})
	//============= modal 로그인 화면이동 =============
	$('#myModal').on('shown.bs.modal', function () {
		$('#userId').focus()
	})
	//============= modal 로그인 처리 =============
	$(function(){
		var session = "${sessionScope.user.userId}";
		
		if (session!="") {
			$("#login").hide();
			$("#userDropdown").show();
		} else if (session==""){
			$("#login").show();
			$("#userDropdown").hide();
		}
		
		$("#loginButton").on("click", function(){
			
			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			//============login ajax=====================
			$.ajax({
				url : "/libero/user/json/login",
				method : "POST" ,
				data : JSON.stringify({"userId": id, "password": pw}) ,
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data , status) {
					
					$('#myModal').modal("hide"); // modal 닫기
					$("#userDropdown").show(); // 회원 dropdown show
					$("#login").hide(); // 로그인 버튼 hide
					$("#userDropdown").children().first().prepend(data.nickname); //닉네임 출력
					window.location.reload();
				}
			});
			//===========login ajax end========================
		});
	});
	</script>