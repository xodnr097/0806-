
package com.libero.service.buy.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.buy.BuyDAO;
import com.libero.service.domain.Buy;

@Repository("buyDAOImpl")
public class BuyDAOImpl implements BuyDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	@Override
	public Buy getUserBuy(String userId) {
		System.out.println("BuyDaoImpl µµÂø");
		return sqlSession.selectOne("BuyMapper.getUserBuy",userId);
	}

	

}