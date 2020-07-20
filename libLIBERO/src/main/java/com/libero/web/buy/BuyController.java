package com.libero.web.buy;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Buy;
import com.libero.service.domain.Product;
import com.libero.service.product.ProductService;

@Controller
@RequestMapping("/buy/*")
public class BuyController {
	
	//Field
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;
	
	@Qualifier("productServiceImpl")
	private ProductService prodService;
	//Constructor
	public BuyController() {
		System.out.println(" ---------------------------------------");
		System.out.println("[ "+this.getClass()+" ]");
		System.out.println(" ---------------------------------------");
	}
	
	//Method
//	@RequestMapping(value="getUserBuy",method=RequestMethod.GET)
//	public ModelAndView getUserBuy(ModelAndView modelAndView) throws Exception{
//		System.out.println(" ---------------------------------------");
//		System.out.println("/buy/getUserBuy : GET");
//		System.out.println(" ---------------------------------------");
//		
//		Buy buy = buyService.getUserBuy("wjddbstp95@gmail.com");
//		System.out.println("[[["+buy+"]]]");
//		
//		
//		
//		
//		modelAndView.addObject("getBuy", buy);
//		modelAndView.setViewName("./getUserBuy.jsp");
//		
//		return modelAndView;
//	}
	@RequestMapping(value="getUserBuy", method= RequestMethod.GET)
	public String getUserBuy(Model model) throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getUserBuy : GET");
		System.out.println(" ---------------------------------------");

		Buy buy = buyService.getUserBuy("wjddbstp95@gmail.com");
		
		System.out.println("[[["+buy+"]]]");
		
		model.addAttribute("getBuy",buy);
		
		
		return "forward:/view/buy/getUserBuy.jsp";
	}
	
	

	
}
