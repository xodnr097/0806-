package com.libero.service.wish.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.wish.WishDAO;

@Repository("WishDAOImpl")
public class WishDAOImpl implements WishDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int getWish(int prodNo, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ProductMapper.getWish");
	}
	
}
