package com.libero.web.publish;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.publish.PublishService;

@Controller
@RequestMapping("/publish/*")
public class PublishController {
	
	//Field
	@Autowired
	@Qualifier("publishServiceImpl")
	private PublishService publishService;
	
	//Constructor
	public PublishController(){
		System.out.println(this.getClass());
	}
	
	//method
	@RequestMapping(value="selectProdType", method = RequestMethod.GET)
	public ModelAndView selectProdType() throws Exception {
		
		System.out.println("/publish/selectProdType : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/selectProductType.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addPrintOption", method = RequestMethod.GET)
	public ModelAndView addPrintOption(HttpSession session, @RequestParam("prodType") String prodType) throws Exception {
		
		System.out.println("/publish/addPrintOption : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addPrintOption.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addManu/{prodNo}", method = RequestMethod.GET)
	public ModelAndView addManu(HttpSession session, int prodNo) throws Exception {
		
		System.out.println("/publish/addManu : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addManu.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addProduct/{prodType}", method = RequestMethod.GET)
	public ModelAndView addProduct(HttpSession session, @RequestParam("prodType") String prodType) throws Exception {
		
		System.out.println("/publish/addProduct : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addProduct.jsp");
		
		return modelAndView;
	}
}
