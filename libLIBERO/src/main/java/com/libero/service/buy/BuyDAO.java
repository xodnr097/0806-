package com.libero.service.buy;

import java.util.List;
import java.util.Map;

import com.libero.service.domain.Buy;
import com.libero.service.domain.Pay;

public interface BuyDAO {

	public List getUserBuy(Map userPayMap);
	
	public Pay addBuy(Pay pay);
	
	public List getUserBuyList(String userId);
	
//	public List getUserProdNo(Map forProdNo);
	
	public List getFactoryBuyList();
	
//	public List getFactoryProdNo(String payNo);
	
	public List getFactoryBuy(String payNo);
	
}
