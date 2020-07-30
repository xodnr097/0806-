package com.libero.web.buy;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Pay;

@RestController
@RequestMapping("/buy/*")
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
	

	
	@RequestMapping(value = "json/beforePay", method = RequestMethod.POST)
	public Pay beforePay(@RequestBody Pay pay) throws Exception {
		System.out.println("------------------------");
		System.out.println("\n\n\n [RESTController :  beforePay]\n\n\n");
		System.out.println("------------------------");
		System.out.println(pay);
	
		System.out.println("\n\n\n");
		return	 buyService.addBuy(pay);
	}	
	
	
	@RequestMapping(value="json/updateDeliveryStatus/{payNo}/{deliveryStatus}",method=RequestMethod.GET)
	public Map updateDeliveryStatus(@PathVariable("payNo") String payNo, 
										@PathVariable("deliveryStatus") int deliveryStatus) throws Exception{
		System.out.println("------------------------");
		System.out.println(" [RESTController :  updateDeliveryStatus]");
		System.out.println("------------------------");
		int result = 0;
		
		if(deliveryStatus == 1) {
			result = buyService.updateDeliveryStatus(payNo,2);	
		}else if(deliveryStatus ==2) {
			result = buyService.updateDeliveryStatus(payNo, 3);
		}else if(deliveryStatus ==3) {
			result = buyService.updateDeliveryStatus(payNo, 4);
		}else if(deliveryStatus ==4) {
			result = buyService.updateDeliveryStatus(payNo, 5);
		}
		
		Map map = new HashMap();
		map.put("result", result);
		return map;
	}
	
	
	
	
}
