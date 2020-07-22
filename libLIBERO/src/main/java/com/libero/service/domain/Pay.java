package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Pay implements Serializable{

	// 실제 결제 정보를 가지고있는 domain
	private String payNo;	
	private String deliveryRequest;
	private String paymentOption;	
	private String payStatus;
	private int deliveryStatus; 
	private String receiverName;
	private String receiverAddr;
	private String receiverPhone;
	private int actualPrice;
	private String cancelReason;
	private String buyerId; //buy 
	private List<Product> prodNo; //
	private List<Publish> publish;// 
								  //
								  //
	 //
	private int payDate;
	//payStatus , payNo , paymentOption  데이터 베이스에서 다 VARCHAR 로 바꿈,.
	/////////////////추가/////////////////////
	private String impUid;
	private String merchantUid;
	
	
}
