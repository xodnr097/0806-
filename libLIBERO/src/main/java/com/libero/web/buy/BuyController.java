package com.libero.web.buy;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Pay;
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
//		Pay buy = buyService.getUserBuy("wjddbstp95@gmail.com");
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
	public String getUserBuy(@RequestParam("userId") String userId,
							 @RequestParam("payNo") int payNo,
							 Model model) throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getUserBuy : GET");
		System.out.println(" ---------------------------------------");

		Pay pay = buyService.getUserBuy(userId, payNo);
										//session 에서 userId를 받아오도록 수정
		
		System.out.println("[[["+pay+"]]]");
		
		model.addAttribute("getBuy",pay);
		
		
		return "forward:/view/buy/getUserBuy.jsp";
	}
	
	
	
	
	
	@RequestMapping(value="addBuy",method=RequestMethod.GET)
	public String addBuy() throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/addBuy : GET");
		System.out.println(" ---------------------------------------");		
		//session으로 userId 받아오기.
		
		
		return "redirect:/view/buy/addBuy.jsp";
	}
	
	@RequestMapping(value="addBuy", method=RequestMethod.POST)
	public String addBuy(@ModelAttribute("buy") Pay pay) throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/addBuy : POST");
		System.out.println(" ---------------------------------------");		
		
		buyService.addBuy(pay);
		
		return "#";
	}
	
	
	
}//end of the BuyController
