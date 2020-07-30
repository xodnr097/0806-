package com.libero.service.cart.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.cart.CartDAO;
import com.libero.service.cart.CartService;
import com.libero.service.domain.Product;

@Service("cartServiceImpl")
public class CartServiceImpl implements CartService {	
	
	@Autowired
	@Qualifier("cartDAOImpl")
	private CartDAO cartDAO;
	public void setCartDAO(CartDAO cartDAO) {
					this.cartDAO = cartDAO;
	}
	
	@Override
	public void addCart(HashMap<String, Object> hashMap) {
			
			cartDAO.addCart(hashMap);
	}
	
	@Override
	public List<Product> getCartList(String userId){
		
		return	cartDAO.getCartList(userId);
		
	}
	
	public void removeCart(HashMap<String, Object> hashMap) {
			
			cartDAO.removeCart(hashMap);
	}

	
}



