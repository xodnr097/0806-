
package com.libero.service.buy.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.buy.BuyDAO;
import com.libero.service.domain.Pay;

@Repository("buyDAOImpl")
public class BuyDAOImpl implements BuyDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void SqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Pay getUserBuy(Pay pay) {
		System.out.println("BuyDaoImpl 도착");
		return sqlSession.selectOne("BuyMapper.getUserBuy",pay);
	}
	@Override
	public void addBuy(Pay pay) {
		// TODO Auto-generated method stub
		System.out.println("BuyDaoImpl 도착");
		sqlSession.insert("BuyMapper.addBuy",pay);
	}

	

}