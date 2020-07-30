<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/cdn.jsp"></jsp:include>
<jsp:include page="../toolbar.jsp"></jsp:include>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="row">
  <div class="col-md-8">

    <!-- Stepers Wrapper -->
    <ul class="stepper stepper-horizontal">

      <!-- First Step -->
      <c:if test="${buyList.deliveryStatus eq 1}">
      
      </c:if>
        <a href="#!">
          <span class="circle"><i class="fas fa-cubes"></i></span>
          <span class="label">상품 준비 중</span>
        </a>
      </li>

      <!-- Second Step -->
      <li>
        <a href="#!">
          <span class="circle"><i class="fas fa-clipboard"></i></span>
          <span class="label"><font color="gray">제작 중</font></span>
        </a>
      </li>

      <!-- Third Step -->
      <li>
        <a href="#!">
          <span class="circle"><i class="fas fa-rocket"></i></span>
          <span class="label"><font color="gray">배송 중</font></span>
        </a>
      </li>
	<!-- Forth Step -->
	  <li >
	  	<a href="#!">
	  		<span class="circle" ><i class="fas fa-exclamation"></i></span>
	  		<span class="label"><font color="gray">배송 완료</font></span>
	  	</a>
    </ul>
    <!-- /.Stepers Wrapper -->

  </div>
</div>

</body>
</html>