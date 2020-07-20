package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Pay implements Serializable{

	// 실제 결제 정보를 가지고있는 domain
	private int payNo;	
	private String deliveryRequest;
	private String paymentOption;	
	private int payStatus;
	private int deliveryStatus; 
	private String receiverName;
	private String receiverAddr;
	private String receiverPhone;
	private int actualPrice;
	private String cancelReason;
	private String buyerId; //buy 
	private List<Product> prodNo; //������ ��ǰ ���� ==> ��ǰ �� , ��ǰ ���� , ���� / â���� �̸� , �Ѱ�������?(�մܿ��� �����´�?), ��ǰ �̹���,
	private List<Publish> publish;//��ǰ Ÿ��.( ��ǰ Ÿ�Կ� ���� ����� �Է� â ��� ���� Ȯ��) 
								  //ī�װ� ?, �ؽ��±� ?.( ��踦 �� �� �ʿ�?)
								  // ����Ʈ -> �������� ��ǰ�� ���� �� �־ �ʿ� �ϴ� ����.
	 //�μ�� �ֹ� ���� ,product �� �ش��ϴ� ��ǰ �ϳ��ϳ��� ���� �ޱ� �ʿ�� ���� ����Ʈ ���.�³�?
	private Date payDate;
	
	/////////////////추가/////////////////////
	
	
	
	
}
