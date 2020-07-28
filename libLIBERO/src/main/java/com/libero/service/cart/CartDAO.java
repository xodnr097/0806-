package com.libero.service.cart;

import java.util.HashMap;
import java.util.List;

import com.libero.service.domain.Product;

public interface CartDAO {

	public void addCart(HashMap<String, Object> hashMap);

	public List<Product> getCartList(String userId);

}
