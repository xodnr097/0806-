package com.libero.service.product.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.domain.Product;
import com.libero.service.product.ProductDAO;


@Repository("productDAOImpl")
public class ProductDAOImpl implements ProductDAO{
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
					this.sqlSession = sqlSession;
	}

	@Override
	public List<Product> getBookList() throws Exception{
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("ProductMapper.getBookList");
	}

	@Override
	public List<Product> getBookListByCategory(String category) {
		System.out.println("DAOImpl.getBookListByCategory : "+category);
		
	   return sqlSession.selectList("ProductMapper.getBookListByCategory", category);
	}
	
	@Override
	public List<Product> getProductList(String prodType) {
		System.out.println("DAOImpl.getBookListByCategory : "+prodType);
		
	   return sqlSession.selectList("ProductMapper.getProductList", prodType);
	}
	
	@Override
	public Product getProduct(int prodNo) {
		System.out.println("DAOImpl.getBook : "+prodNo);
		
	   return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public void addReview(HashMap<String, Object> hashMap) {
		sqlSession.insert("ProductMapper.addReview", hashMap);
	}
}//end class