package com.libero.service.buy;

import java.util.List;
import java.util.Map;

import com.libero.service.domain.Pay;

public interface BuyDAO {

	public Pay getUserBuy(Pay pay);
	
	public Pay addBuy(Pay pay);
	
	public List getUserBuyList(String userId);
	
	public List getProdNo(String userId);
	
	public List getFactoryBuyList();
}
