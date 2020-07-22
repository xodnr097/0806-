package com.libero.web.buy;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Pay;

@RestController
@RequestMapping("/view/buy/*")
public class BuyRestController {

	//field
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;
	public BuyRestController() {
		System.out.println(" ---------------------------------------");
		System.out.println("[ "+this.getClass()+" ]");
		System.out.println(" ---------------------------------------");
	}
	
	@RequestMapping(value="json/addPay",method=RequestMethod.POST)
	public Map addPay(@RequestBody Pay pay) throws Exception{
		
		buyService.addBuy(pay);
		
		Map map = new HashMap();
		map.put("pay",pay);
		
		return map;
	}
	

}
