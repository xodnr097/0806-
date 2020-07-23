package com.libero.service.publish.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.domain.Publish;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishDAO;
import com.libero.service.publish.PublishService;

@Service("publishServiceImpl")
public class PublishServiceImpl implements PublishService{
	
	///Field
	@Autowired
	@Qualifier("publishDAOImpl")
	private PublishDAO publishDAO;
	public void setPublishDAO(PublishDAO publishDAO) {
		this.publishDAO = publishDAO;
	}
	
	///Constructor
	public PublishServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public Map<String,Object> getPrintOptionList() throws Exception{
		
		List<User> list= publishDAO.getPrintOptionList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		
		return map;
	}
	
	public void addPrintOption(Publish publish) throws Exception{
		publishDAO.addPrintOption(publish);
	}
	
	public int getPublishNo(String creator) throws Exception {
		return publishDAO.getPublishNo(creator);
	}
	
	public void updateManu(Publish publish) throws Exception{
		publishDAO.updateManu(publish);
	}
	
	public void updatePublishInfo() throws Exception{
		
	}
	
	public void updateRetailPrice(Publish publish) throws Exception{
		publishDAO.updateRetailPrice(publish);
	}
	
	public void addProduct(Publish publish) throws Exception{
		publishDAO.addProduct(publish);
	}
	
	public Publish getProduct(int prodNo) throws Exception{
		return publishDAO.getProduct(prodNo);
	}
	
	public void updateProduct(Publish publish) throws Exception{
		publishDAO.updateProduct(publish);
	}
	
	public void addOptionPrice() throws Exception{
		
	}
	
	public void getOptionPrice() throws Exception{
		
	}
	
	public void updateOptionPrice() throws Exception{
		
	}

}
