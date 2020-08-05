package com.libero.service.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Cash implements Serializable {
		
	private int cashNo;
	private String userId;	
	private int cashAmount;
	private int cashCurrent;
	private int cashWithdraw;
	private int buyNo;
	
	public Cash() {
		
	}
}
