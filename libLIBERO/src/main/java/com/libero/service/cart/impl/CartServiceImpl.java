package com.libero.service.cart.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.libero.service.cart.CartDAO;
import com.libero.service.cart.CartService;
import com.libero.service.domain.Product;
import com.libero.service.product.ProductDAO;

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

	
}



