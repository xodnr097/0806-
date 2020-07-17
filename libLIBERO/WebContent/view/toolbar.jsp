<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>libLIBERO</title>
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
        <nav class="navbar navbar-default">
            <div class="container-fluid">
              
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">
                        <img alt="Brand" src="resources/images/common/logo.png" width="80" height="25">
                    </a>
                </div>
                <!-- header End -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                	<!-- left Button Start -->
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Main <span class="sr-only">(current)</span></a></li>
                        <!-- 책만들기 Drop Down Start -->
                        <li class="dropdown">
                            <a href="/publish/selectProdType" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">책만들기<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                            	<li><a href="publish/selectProdType">책만들기</a></li>
                                <li><a href="publish/addPrintOption?prodType=paper">종이책 만들기</a></li>
                                <li><a href="publish/addPrintOption?prodType=ebook">전자책 만들기</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">표지디자인 등록</a></li>
                                <li><a href="#">교정교열 등록</a></li>
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
	             			<li><a href="#">로그아웃</a></li>
	             		</c:if>
				    </ul>
                </div><!-- /.navbar-collapse -->
          </div>
        </nav>
    </body>
</html>