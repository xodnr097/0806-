package com.libero.service.publish;

import java.util.List;

import com.libero.service.domain.Product;
import com.libero.service.domain.User;

public interface PublishDAO {
	
	public List<User> getPrintOptionList() throws Exception;
	
	public void addPrintOption(Product product) throws Exception;
	
	public int getPublishNo(String creator) throws Exception;
	
	public void updateManu(Product product) throws Exception;
	
	public void updatePublishInfo() throws Exception;
	
	public void updateRetailPrice() throws Exception;
	
	public void addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
	public void addOptionPrice() throws Exception;
	
	public void getOptionPrice() throws Exception;
	
	public void updateOptionPrice() throws Exception;

}
