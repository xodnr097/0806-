package com.libero.service.publish;

import java.util.Map;

import com.libero.service.domain.Publish;

public interface PublishService {
	
	public Map<String,Object> getPrintOptionList() throws Exception;
	
	public void addPrintOption(Publish publish) throws Exception;
	
	public int getPublishNo(String creator) throws Exception;
	
	public void updateManu(Publish publish) throws Exception;
	
	public void updatePublishInfo() throws Exception;
	
	public void updateRetailPrice() throws Exception;
	
	public void addProduct(Publish publish) throws Exception;
	
	public Publish getProduct(int prodNo) throws Exception;
	
	public void updateProduct(Publish publish) throws Exception;
	
	public void addOptionPrice() throws Exception;
	
	public void getOptionPrice() throws Exception;
	
	public void updateOptionPrice() throws Exception;

}
