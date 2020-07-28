package com.libero.service.cart;

import java.util.HashMap;
import java.util.List;

import com.libero.service.domain.Product;

public interface CartService {
	
	public void addCart(HashMap<String, Object> hashMap);

	List<Product> getCartList(String userId);

}
