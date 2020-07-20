package com.libero.service.product.impl;

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
		System.out.println("6");
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("ProductMapper.getBookList");
	}

	@Override
	public List<Product> getBookListByCategory(String bookCategory) {
		System.out.println("DAOImpl.getBookListByCategory : "+bookCategory);
		
	   return sqlSession.selectList("ProductMapper.getBookListByCategory", bookCategory);
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
}