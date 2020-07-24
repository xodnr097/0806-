
package com.libero.service.buy.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.buy.BuyDAO;
import com.libero.service.buy.BuyService;
import com.libero.service.domain.Pay;

@Service("buyServiceImpl")
public class BuyServiceImpl implements BuyService{
	
	//Field
	@Autowired
	@Qualifier("buyDAOImpl")
	private BuyDAO buyDao;
	
	public void setBuyDao(BuyDAO buyDao) {
		this.buyDao=buyDao;
	}
	
	//Constructor
	public BuyServiceImpl() {
		// TODO Auto-generated constructor stub
	}

//	@Override
//	public void removeBuy() {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void getPayStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePayStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getDeliveryStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateDeliveryStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addCancelation() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pay addBuy(Pay pay) {
		return	buyDao.addBuy(pay);
	}

	

	@Override
	public Map<String, Object> getUserBuyList(String userId) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		
		System.out.println("\n\n\n****"+buyDao.getProdNo(userId)+"***\n\n\n");
		
		
		map.put("prodNo",buyDao.getProdNo(userId));//null -> getProdNo으로 교체 아마 prodNo 도 list로 받을듯
		map.put("list",buyDao.getUserBuyList(userId));
		
		return map;
	}

	@Override
	public void getFactoryBuy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> getFactoryBuyList() {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		
		map.put("factorylist", buyDao.getFactoryBuyList());
		
		return map;
		
	}

	@Override
	public Pay getUserBuy(String userId, String payNo) {
		Pay pay = new Pay();
		pay.setBuyerId(userId);
		pay.setPayNo(payNo);
		return buyDao.getUserBuy(pay);
	}

}
