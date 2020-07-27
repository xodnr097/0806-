<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO</title>
		
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="resources/css/common.css">
		<style type="text/css">
			html,body { 
				margin:0; 
				padding:0; 
				width:100%; height:100%;
			}
        	.box { 
        		width:100%; height:100%; 
        		position:relative; 
        		background-size: cover;
        	}
        	.title {
        		position: absolute;
        		top:30%;
        		left:70%;
        		color: #FFFFFF;
        		font-family: 'Nanum Gothic', sans-serif;
        		font-size: 30px;
        	}
		</style>
	</head>
	<body>
		<!-- Toolbar Start -->
		<jsp:include page="/view/toolbar.jsp" />
		<!-- Toolbar End -->
		
		<div class="box" style="background-image: url(resources/images/common/index.png);">
			<div class="title" align="right">자가 출판 플랫폼<br/>리브리베로</div>
		</div>
	    <div class="box" style="background-image: url(resources/images/common/index2.png);"></div>
	    <div class="box" style="background-image: url(resources/images/common/index3.jpg);"></div>
	</body>
	<script type="text/javascript">
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
</html>