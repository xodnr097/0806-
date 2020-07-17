package com.libero.web.buy;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Buy;

@Controller
@RequestMapping("/buy/*")
public class BuyController {
	
	//Field
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;
	
	//Constructor
	public BuyController() {
		System.out.println(" ---------------------------------------");
		System.out.println("[ "+this.getClass()+" ]");
		System.out.println(" ---------------------------------------");
	}
	
	//Method
	@RequestMapping(value="getUserBuy",method=RequestMethod.GET)
	public ModelAndView getUserBuy() throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getUserBuy : GET");
		System.out.println(" ---------------------------------------");
		
		Buy buy = buyService.getUserBuy("wjddbstp95@gmail.com");
		System.out.println("[[["+buy+"]]]");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("getBuy", buy);
		
		modelAndView.setViewName("forward:/getUserBuy.jsp");
		
		return modelAndView;
	}
	

	
}
