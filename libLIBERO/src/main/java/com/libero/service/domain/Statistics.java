package com.libero.service.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Statistics implements Serializable{
	
	private int prodNo;
	
	private int jan;
	private int feb;
	private int mar;
	private int apr;
	private int may;
	private int jun;
	private int jul;
	private int aug;
	private int sep;
	private int oct;
	private int nov;
	private int dec;
	private int totalCount;
	
	private int male;
	private int female;
	private int teenager;
	private int twenty;
	private int thirty;
	private int forty;
	
	private int prodCount;
	private int creatorCount;
	private int salesCount;
	private int nowCount;
	
	public Statistics() {
		
	}
}
