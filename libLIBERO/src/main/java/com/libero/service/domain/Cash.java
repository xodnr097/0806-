package com.libero.service.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Cash implements Serializable {
	
	private User user;
	private int currentCash;
	private int totalCash;
	private int withdrawCash;
	
	public Cash() {
		
	}
}
