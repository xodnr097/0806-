package com.libero.service.wish.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.domain.Product;
import com.libero.service.wish.WishDAO;

@Repository("wishDAOImpl")
public class WishDAOImpl implements WishDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public List<Product> getWishList(String userId) {
		
			return sqlSession.selectList("ProductMapper.getWishProduct", userId);
	}
	
	@Override
	public void addWish(HashMap<String, Object> hashMap) {
			sqlSession.insert("ProductMapper.addWish", hashMap);
	}
	
	@Override
	public void removeWish(HashMap<String, Object> hashMap) {
			sqlSession.delete("ProductMapper.removeWish", hashMap);
	}
	
}
