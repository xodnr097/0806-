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
		return sqlSession.selectList("PublishMapper.getPrintOptinList");
	}
	
	public void addPrintOption(Product product) throws Exception {
		if (product.getProdType().contentEquals("paper")) {
			sqlSession.insert("PublishMapper.addPaper", product);
		}
		if (product.getProdType().contentEquals("ebook")) {
			sqlSession.insert("PublishMapper.addEbook", product);
		}
	}
	
	public int getPublishNo(String creator) throws Exception {
		return sqlSession.selectOne("PublishMapper.getPublishNo", creator);
	}
	
	public void updateManu(Product product) throws Exception {
		sqlSession.update("PublishMapper.updateManu", product);
	}
	
	public void updatePublishInfo() throws Exception {
		
	}
	
	public void updateRetailPrice() throws Exception {
		
	}
	
	public void addProduct(Product product) throws Exception{
		sqlSession.insert("PublishMapper.addProduct",product);
	}
	
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("PublishMapper.getProduct",prodNo);
	}
	
	public void updateProduct(Product product) throws Exception{
		sqlSession.update("PublishMapper.updateProduct", product);
	}
	
	public void addOptionPrice() throws Exception{
		
	}
	
	public void getOptionPrice() throws Exception{
		
	}
	
	public void updateOptionPrice() throws Exception{
		
	}

}
