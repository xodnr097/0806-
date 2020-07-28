package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Report implements Serializable{
	/// Field
	private int reportNo;
	private String reportType;
	private Timestamp  regDate; 
	
	private User user;
	private Product product;
	private Post post;
	/// Constructor
	public Report() {
	}
	
}