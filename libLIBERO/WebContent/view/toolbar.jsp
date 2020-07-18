<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <!--   jQuery , Bootstrap CDN  -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <!-- Bootstrap Dropdown Hover CSS -->
       <link href="/css/animate.min.css" rel="stylesheet">
       <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

        <!-- Bootstrap Dropdown Hover JS -->
       <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
        
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
              
                <div class="navbar-header">
                    <a class="navbar-brand" href="/libero/index.jsp">
                        <img alt="Brand" src="http://127.0.0.1:8080/libero/resources/images/common/logo.png" width="80" height="25">
                    </a>
                </div>
                <!-- header End -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                	<!-- left Button Start -->
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Main <span class="sr-only">(current)</span></a></li>
                        <!-- 책만들기 Drop Down Start -->
                        <li class="dropdown">
                            <a href="/libero/publish/selectProdType" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">책만들기<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                            	<li><a href="/libero/publish/selectProdType">책만들기</a></li>
                                <li><a href="/libero/publish/addPrintOption?prodType=paper">종이책 만들기</a></li>
                                <li><a href="/libero/publish/addPrintOption?prodType=ebook">전자책 만들기</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/libero/publish/addProduct?prodType=cover">표지디자인 등록</a></li>
                                <li><a href="/libero/publish/addProduct?prodType=correct">교정교열 등록</a></li>
                            </ul>
                        </li>
                        <!-- 책만들기 End -->
                        <!-- 서비스 상점 Start -->
                        <li><a href="#">서비스 상점</a></li>
                        <li><a href="#">서점</a></li>
                        <!-- 커뮤니티 Drop Down Start -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자유게시판</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">1:1문의</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- left Button End -->
                    <!-- right Button Start -->
                    <ul class="nav navbar-nav navbar-right">
                    	<c:if test="${sessionScope.user.userId == null}">
				        	<li><a href="#" data-toggle="modal" data-target="#myModal">로그인</a></li>
				        </c:if>
				        <c:if test="${sessionScope.user.userId != null}">
	             			<li><a href="/libero/user/logout">로그아웃</a></li>
	             		</c:if>
				    </ul>
                </div>
                <!-- /.navbar-collapse -->
          </div>
        </nav>
        <!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">libLIBERO 로그인</h4>
		      </div>
		      <div class="modal-body">
		      		<form class="form-horizontal">
			  
						  <div class="form-group">
						    <label for="userId" class="col-sm-4 control-label">아 이 디</label>
						    <div class="col-sm-6">
						      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
						    <div class="col-sm-6">
						      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
						    </div>
						  </div>
				
					</form>
	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="login">로그인</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Modal End -->
    </body>
    <script>
	//============= modal 로그인 화면이동 =============
	$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})
	//============= modal 로그인 처리 =============
	$( function() {
		$("#login").on("click" , function() {
			
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
			
			$("form").attr("method","POST").attr("action","/libero/user/login").attr("target","_parent").submit();
		});
	});
	</script>
</html>