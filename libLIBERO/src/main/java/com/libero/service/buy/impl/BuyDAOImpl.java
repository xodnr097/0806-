
package com.libero.service.buy.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.buy.BuyDAO;
import com.libero.service.domain.Buy;
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
	public List<Pay> getUserBuy(Map userPayMap) {
		System.out.println("BuyDaoImpl 도착");		
		return sqlSession.selectList("BuyMapper.getUserBuy",userPayMap);
	}
	@Override
	public Pay addBuy(Pay pay) {
		// TODO Auto-generated method stub
		System.out.println("BuyDaoImpl 도착 : addBuy() ");
		sqlSession.insert("BuyMapper.addBuy",pay);
		
	//	sqlSession.selectOne("BuyMapper.nextAdd");
	//	System.out.println("\n\n1번 pay"+pay.getPayNo());
		
//		pay=sqlSession.selectOne("BuyMapper.getBuy")
//		pay.setPayNo();
		
		
		//pay = sqlSession.selectOne("BuyMapper.getBuy",pay);
		System.out.println("\n\n [[pay보자]] : "+pay+"\n\n");
		return pay;
	}

	@Override
	public List getUserBuyList(String userId) {
		// TODO Auto-generated method stub
		System.out.println("\n\n[[ "+userId+" ]] \n\n");
		return sqlSession.selectList("BuyMapper.getUserBuyList",userId);
		
	}

//	@Override
//	public List getUserProdNo(Map forProdNo) {
//		// TODO Auto-generated method stub
//		
//		forProdNo.get("userId");
//		forProdNo.get("payNo");
//		return sqlSession.selectList("BuyMapper.getUserProdNo",forProdNo);
//	}

	@Override
	public List getFactoryBuyList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BuyMapper.getFactoryBuyList");
	}

	@Override
	public List getFactoryBuy(String payNo) {
		
		
		return sqlSession.selectList("BuyMapper.getFactoryBuy", payNo);
	}

	@Override
	public boolean updateDeliveryStatus(Pay pay) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("BuyMapper.updateDeliveryService",pay);
		if(result > 0) {
			return true;
		}else {
			return false;
			
		}
	}

	
//	@Override
//	public List getFactoryProdNo(String payNo) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("BuyMapper.getFactoryProdNo",payNo);
//	}
//	

}