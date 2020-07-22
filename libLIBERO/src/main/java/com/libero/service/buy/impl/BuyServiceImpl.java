
package com.libero.service.buy.impl;

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
	public void getBuyStatus() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBuyStatus() {
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
	public void getUserBuyList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getFactoryBuy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getFactoryBuyList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pay getUserBuy(String userId, String payNo) {
		Pay pay = new Pay();
		pay.setBuyerId(userId);
		pay.setPayNo(payNo);
		return buyDao.getUserBuy(pay);
	}

}
