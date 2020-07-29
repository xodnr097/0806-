package com.libero.service.publish;

import java.util.Map;

import com.libero.service.domain.Publish;
import com.libero.service.domain.Statistics;
import com.libero.service.domain.User;

public interface PublishService {
	
	public Map<String,Object> getPrintOptionList() throws Exception;
	
	public int addPrintOption(Publish publish) throws Exception;
	
	public void updateManu(Publish publish) throws Exception;
	
	public void updatePublishInfo(Publish publish) throws Exception;
	
	public void updateRetailPrice(Publish publish) throws Exception;
	
	public void addProduct(Publish publish) throws Exception;
	
	public Publish getProduct(int prodNo) throws Exception;
	
	public void updateProduct(Publish publish) throws Exception;
	
	public void addOptionPrice() throws Exception;
	
	public User getOptionPrice(String userId) throws Exception;
	
	public void updateOptionPrice(User user) throws Exception;
	
	public Map<String, Object> getUserPublishList(Publish publish) throws Exception;
	
	public Map<String, Object> getStatistics(Statistics Statistics) throws Exception;

}
