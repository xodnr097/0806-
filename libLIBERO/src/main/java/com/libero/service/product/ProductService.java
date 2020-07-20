package com.libero.service.product;

import java.util.Map;

import com.libero.service.domain.Product;

public interface ProductService {	
	//public Product getProduct(int prodNo) throws Exception;
	
	//public Map<String, Object> getProductList(Search search) throws Exception;

	public Map<String, Object> getBookList() throws Exception;

	public Map<String, Object> getBookListByCategory(String bookCategory) throws Exception;

	public Map<String, Object> getProductList(String prodType) throws Exception;

	//public Product getBook(int prodNo);

	public Product getProduct(int prodNo);

	
}
