package com.libero.service.publish.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.domain.Publish;
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
	
	public void addPrintOption(Publish publish) throws Exception {
		if (publish.getProdType().contentEquals("paper")) {
			sqlSession.insert("PublishMapper.addPaper", publish);
		}
		if (publish.getProdType().contentEquals("ebook")) {
			sqlSession.insert("PublishMapper.addEbook", publish);
		}
	}
	
	public int getPublishNo(String creator) throws Exception {
		return sqlSession.selectOne("PublishMapper.getPublishNo", creator);
	}
	
	public void updateManu(Publish publish) throws Exception {
		sqlSession.update("PublishMapper.updateManu", publish);
	}
	
	public void updatePublishInfo() throws Exception {
		
	}
	
	public void updateRetailPrice(Publish publish) throws Exception {
		sqlSession.update("PublishMapper.updateRetailPrice", publish);	
	}
	
	public void addProduct(Publish publish) throws Exception{
		sqlSession.insert("PublishMapper.addProduct",publish);
	}
	
	public Publish getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("PublishMapper.getProduct",prodNo);
	}
	
	public void updateProduct(Publish publish) throws Exception{
		sqlSession.update("PublishMapper.updateProduct", publish);
	}
	
	public void addOptionPrice() throws Exception{
		
	}
	
	public void getOptionPrice() throws Exception{
		
	}
	
	public void updateOptionPrice() throws Exception{
		
	}

}
