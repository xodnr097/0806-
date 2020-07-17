package com.libero.service.domain;

import java.sql.Date;

import lombok.Data;


@Data
public class Product {
	
	private int prodNo;
	private String prodType;
	private String prodName;
	private String prodDetail;
	private int retailPrice;
	private int printPrice;
	private String blindCode;
	private String prodThumbnail;
	private String coverFile;
	private Date regDate;
	private String discountCode;
	private String creator;
	private int salesCount;
	private int likeCount;
	private String author;
	private String purposeCode;
	private String manuFile;
	private int bookPage;
	private String colorType;
	private String sizeType;
	private String coverType;
	private String innerType;
	private short tempCode;
	private User factoryId;
	
	public Product() {
		
	}
	
}
