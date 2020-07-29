<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row justify-content-center" style="margin-bottom: 100px">
	<button class="btn btn-default">내정보</button>
	<a href="/libero/user/getTempPublishList" 
			class="btn btn-default" role="button" 
			aria-pressed="true">임시 저장 도서 조회</a>
	<a href="/libero/buy/getUserBuyList?userId=${sessionScope.user.userId}" 
			class="btn btn-default" role="button" 
			aria-pressed="true">주문내역 조회</a>
	<a href="/libero/user/getUserPublishList?prodType=book" 
			class="btn btn-default" role="button" 
			aria-pressed="true">판매중인 도서 및 상품 조회</a>
	<a href="#" 
			class="btn btn-default" role="button" 
			aria-pressed="true">리베로캐쉬 조회</a>
</div>