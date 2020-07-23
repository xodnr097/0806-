package com.libero.service.product;

import java.util.List;

import com.libero.common.Search;
import com.libero.service.domain.Product;

public interface ProductDAO {

	//public Product getProduct(int prodNo) throws Exception;
	
	public List<Product> getBookList() throws Exception;

	public List<Product> getBookListByCategory(String category);
	
	public List<Product> getProductList(String prodType) throws Exception;

	public Product getProduct(int prodNo);
	
	
}
