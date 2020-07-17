package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Buy implements Serializable{

	
	private int buyNo;
	private int buyAmount;
	private String deliveryRequest;
	private String paymentOption;
	private String deliveryStatus; //배송 상태 
	private String receiverName;
	private String receiverAddr;
	private String receiverPhone;
	private int actualPrice;
	private int buyStatus; //장바구니에 있는 건지 결제 된 상품인지 알리는 상태
	private String cancelReason;
	private User buyerId; // 회원 이름 , 아이디(이메일) , 구매자 주소 , 휴대폰 번호
	private List<Product> prodNo; //가져올 상품 정보 ==> 상품 명 , 상품 가격 , 저자 / 창작자 이름 , 총결제가격?(앞단에서 가져온다?), 상품 이미지,
								  //상품 타입.( 상품 타입에 따라 배송지 입력 창 출력 여부 확인) 
								  //카테고리 ?, 해시태그 ?.( 통계를 낼 때 필요?)
								  // 리스트 -> 여러가지 상품을 받을 수 있어서 필요 하다 싶음.
	private List<Publish> publish; //인쇄소 주문 정보 ,product 에 해당하는 상품 하나하나의 정보 받기 필요로 인한 리스트 사용.맞나?
	private Date payDate;
	
	/////////////////추가/////////////////////
	private int payNo;
	
	
	
}
