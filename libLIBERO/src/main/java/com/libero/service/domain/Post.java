package com.libero.service.domain;

import java.io.Serializable;
import java.sql.Timestamp;


import lombok.Data;

@Data
public class Post implements Serializable{
	private String postType;
	private int postNo;
	private String postName;
	private String postContent;  
	private Timestamp regDate; 
	private String qnaRegType;
	private String qnaCode;
	private String blindCode; 
	private int viewCount;
	private int commentCount; 
	private int reportCount; 

	private User user;
	
	public Post() {
		
	}
}
