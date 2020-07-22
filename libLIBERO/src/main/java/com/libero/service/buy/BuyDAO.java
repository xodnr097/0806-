package com.libero.service.buy;

import com.libero.service.domain.Pay;

public interface BuyDAO {

	public Pay getUserBuy(Pay pay);
	
	public Pay addBuy(Pay pay);
}