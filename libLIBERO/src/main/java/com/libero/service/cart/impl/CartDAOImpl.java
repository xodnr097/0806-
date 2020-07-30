package com.libero.service.cart.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.cart.CartDAO;
import com.libero.service.domain.Product;
	
	@Repository("cartDAOImpl")
	public class CartDAOImpl implements CartDAO {
			
			@Autowired
			@Qualifier("sqlSessionTemplate")
			private SqlSession sqlSession;
			public void setSqlSession(SqlSession sqlSession) {
							this.sqlSession = sqlSession;
			}//end setSqlSession
		
		@Override
		public void addCart(HashMap<String, Object> hashMap){
			System.out.println("1");
			if(hashMap.get("from").equals("cart")) {
			System.out.println("2");
				int updatedAmount = (int) hashMap.get("buyAmount");
				System.out.println("3");
				hashMap.put("updatedAmount", updatedAmount);
				sqlSession.update("ProductMapper.updateAmount", hashMap);
			}else {
						if(sqlSession.selectOne("ProductMapper.checkCart", hashMap) == null) {
							sqlSession.insert("ProductMapper.addCart", hashMap);
						}else {
							Product checkCart = sqlSession.selectOne("ProductMapper.checkCart", hashMap);
							int buyAmount = checkCart.getBuyAmount();
							int addBuyAmount = (int) hashMap.get("buyAmount");
							int updatedAmount = addBuyAmount + buyAmount;
							hashMap.put("updatedAmount", updatedAmount);
							
							sqlSession.update("ProductMapper.updateAmount", hashMap); 
						}//end else
			}//end else
		}//end addCart
		
		
		public List<Product> getCartList(String userId){
			
			return sqlSession.selectList("ProductMapper.getCartList", userId);
			
		}

		@Override
		public void removeCart(HashMap<String, Object> hashMap) {
				sqlSession.delete("ProductMapper.removeCart", hashMap);
			
		}

	}//end class

