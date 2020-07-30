package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class Publish implements Serializable {
	
	private int prodNo;
	private String prodType;
	private String prodName;
	private String prodDetail;
	private int retailPrice;
	private int printPrice;
	private String blindCode;
	private String prodThumbnail;
	private String coverFile;
	private String hashtagName;
	private String discountCode;
	private String creator;
	private String author;
	private String purposeCode;
	private String bookCategory;
	private String manuFile;
	private int bookPage;
	private String colorType;
	private String sizeType;
	private String coverType;
	private String innerType;
	private String factoryId;
	private Date regDate;
	
	private String coverSelect;
	private String imgType;
	private String imgSelect;
	
	private int salesCount;
	
	private short reportType;
	
	public Publish() {
		
	}

}
