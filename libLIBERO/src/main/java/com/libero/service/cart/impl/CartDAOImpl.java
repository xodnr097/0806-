package com.libero.service.cart.impl;

import java.util.HashMap;

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
			if(sqlSession.selectOne("ProductMapper.checkCart", hashMap) == null) {
				sqlSession.insert("ProductMapper.addCart", hashMap);
			}else {
				Product checkCart = sqlSession.selectOne("ProductMapper.checkCart", hashMap);
				int buyAmount = checkCart.getBuyAmount();
				int buyCount = (int) hashMap.get("buyCount");
				int updatedAmount = buyCount + buyAmount;
				hashMap.put("updatedAmount", updatedAmount);
				
				sqlSession.update("ProductMapper.updateAmount", hashMap); 
			}
			
		}//end addCart

	}//end class

