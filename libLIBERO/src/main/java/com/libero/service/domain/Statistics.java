package com.libero.service.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Statistics implements Serializable{
	
	private int prodNo;
	private String day;
	private int dayCount;
	
	private int male;
	private int female;
	private int teenager;
	private int twenty;
	private int thirty;
	private int forty;
	
	private int startDate;
	private int endDate;
	
	public Statistics() {
		
	}
}
