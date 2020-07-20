<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<!-- Bootstrap CSS -->
    	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
		<!--   jQuery , Bootstrap CDN  -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  		
  		<!-- Bootstrap Dropdown Hover CSS -->
	   	<link href="/css/animate.min.css" rel="stylesheet">
	   	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	    <!-- Bootstrap Dropdown Hover JS -->
	   	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	   	<!-- Google Fonts CDN -->
	   	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
	   	
  		<style>
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

	<body>
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
				          <a class="dropdown-item" href="/libero/publish/selectProdType">책만들기</a>
				          <a class="dropdown-item" href="/libero/publish/addPrintOption?prodType=paper">종이책 만들기</a>
				          <a class="dropdown-item" href="/libero/publish/addPrintOption?prodType=ebook">전자책 만들기</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="/libero/publish/addProduct?prodType=cover">표지디자인 등록</a>
				          <a class="dropdown-item" href="/libero/publish/addProduct?prodType=correct">교정교열 등록</a>
				        </div>
			      	</li>
			      	<!-- 책만들기 End -->
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">서비스상점</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">서점</a>
			      	</li>
			      	<!-- 커뮤니티 Start -->
			      	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	커뮤니티
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">공지사항</a>
				          <a class="dropdown-item" href="#">자유게시판</a>
				          <div class="dropdown-divider"></div>
				          <a class="dropdown-item" href="#">1:1문의</a>
				        </div>
			      	</li>
			      	<!-- 커뮤니티 End -->
			    </ul>
			    <!-- right nav Start -->
			    <ul class="navbar-nav">
			    	<c:if test="${sessionScope.user.userId == null}">
			    		<!-- <div id="user"> -->
					        <li class="nav-item">
		                    	<a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">로그인</a>
	              			</li>
	              		<!-- </div> -->
				   	</c:if>
				    <c:if test="${sessionScope.user.userId != null}">
				    
				    	<!-- 회원 dropdown Start -->
				      	<li class="nav-item dropdown">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					          	${sessionScope.user.nickname}님
					        </a>
					        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					          <a class="dropdown-item" href="#">마이페이지</a>
					          <a class="dropdown-item" href="#">넣어야됨</a>
					          <div class="dropdown-divider"></div>
					          <a class="dropdown-item" href="/libero/user/logout">로그아웃</a>
					        </div>
				      	</li>
				      	<!-- 회원 dropdown End -->
	             	</c:if>
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
		      			<button type="button" class="btn btn-primary" id="login">로그인</button>
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
		<!-- Modal End -->
	</body>
	<script>
	//============= modal 로그인 화면이동 =============
	$('#myModal').on('shown.bs.modal', function () {
		$('#userId').focus()
	})
	//============= modal 로그인 처리 =============
	$(function(){
		$("#login").on("click", function(){
			
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
			
			$("form[name='loginForm']").attr("method","POST").attr("action","/libero/user/login").attr("target","_parent").submit();
			
			/* var queryString = $("form[name='loginForm']").serialize() ;
			alert(queryString);
			
			$.ajax({
				url : "/libero/user/json/login",
				type : "POST" ,
				data : queryString ,
				dataType : "json",
				error: function(xhr, status, error){
	                alert("에러");
            	},
				success : function(JSONData , status) {
					alert("ok");
					$("#user").html("로그아웃");
				}
			}); */
		});
	});
	</script>
</html>