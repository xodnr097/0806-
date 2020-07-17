package com.libero.service.publish.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.domain.Product;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishDAO;

@Repository("publishDAOImpl")
public class PublishDAOImpl implements PublishDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public PublishDAOImpl() {
		System.out.println(this.getClass());
	}
	
	//method
	public List<User> getPrintOptionList() throws Exception {
		return sqlSession.selectList("PublishMapper.");
	}
	
	public void addPrintOption(Product product) throws Exception {
		
	}
	
	public List<Product> getPulish(int prodNo) throws Exception {
		return sqlSession.selectList("PublishMapper.getPublish");
	}
	
	public void updateManu(int prodNo) throws Exception {
		
	}
	
	public void updatePublishInfo() throws Exception {
		
	}
	
	public void updateRetailPrice() throws Exception {
		
	}
	
	public void addProduct(Product product) throws Exception{
		
	}
	
	public void updateProduct(int prodNo) throws Exception{
		
	}
	
	public void addOptionPrice() throws Exception{
		
	}
	
	public void getOptionPrice() throws Exception{
		
	}
	
	public void updateOptionPrice() throws Exception{
		
	}

}
