package com.libero.service.domain;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
@Data
public class Buy implements Serializable{
	
	//장바구니 도메인
	
	private int buyNo;
	private int buyAmount;
	private User buyerId;// 장바구니 등록한 사람 아이디.
	private int prodNo;// 등록한 상품의 번호
	private String buyStatus; 
	// 상품의 구매 상태 (장바구니 인지 결제 완료인지.)
	private int payNo;
	private String prodType;

}
