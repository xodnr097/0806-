package com.libero.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController{
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	//Constructor
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	//method
	@RequestMapping(value="getBookList", method = RequestMethod.GET)
	public ModelAndView getBookList() throws Exception {
		
			System.out.println("/product/getBookList : GET");
			
			//BusinessLogic
			System.out.println("1");
			Map<String, Object> map=productService.getBookList();
			System.out.println("2");
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("book", map.get("list"));
			modelAndView.setViewName("forward:/view/product/getBookList.jsp");
			
			return modelAndView;
	}
	 /*
	 @RequestMapping(value="getBookListByCategory", method = RequestMethod.GET)
	 public ModelAndView getBookListByCategory(@RequestParam(") throws Exception {
		 
		 	System.out.println("/product/getBookListByCategory : GET");
		 	
		 	//BusinessLogic
		 	
	 }
	*/
}
