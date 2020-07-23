package com.libero.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.domain.Product;
import com.libero.service.product.ProductService;
import com.libero.service.wish.WishService;

@Controller
@RequestMapping("/product/*")
public class ProductController{
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
	//Constructor
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	//method 서점메인화면 출력
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
	 ///* 카테고리별 서점화면 출력
	 @RequestMapping(value="getBookListByCategory/{bookCategory}", method = RequestMethod.GET)
	 public ModelAndView getBookListByCategory(@PathVariable String bookCategory) throws Exception {
		 	
		 
		 	//BusinessLogic
		 	System.out.println("/product/getBookListByCategory : GET, pathVariable : "+bookCategory);
		 	
		 	Map<String, Object> map=productService.getBookListByCategory(bookCategory);
		 	
		 	ModelAndView modelAndView = new ModelAndView();
		 	modelAndView.addObject("book", map.get("list"));
		 	modelAndView.setViewName("forward:/view/product/getBookListByCategory.jsp");
		 	
		 	return modelAndView;
		 	
	 }
	//*/
	 
	 
	//method 서비스상품화면 출력
		@RequestMapping(value="getProductList/{prodType}", method = RequestMethod.GET)
		public ModelAndView getProductList(@PathVariable String prodType) throws Exception {
			
				System.out.println("/product/getProductList : GET");
				
				//BusinessLogic
				System.out.println("1");
				Map<String, Object> map=productService.getProductList(prodType);
				System.out.println("2");
				ModelAndView modelAndView = new ModelAndView();
				modelAndView.addObject("product", map.get("list"));
				modelAndView.setViewName("forward:/view/product/getProductList.jsp");
				
				return modelAndView;
		}
		
				//method 서비스상품화면 출력
				@RequestMapping(value="getProduct/{prodNo}", method = RequestMethod.GET)
				public ModelAndView getBook(@PathVariable int prodNo) throws Exception {
					
						System.out.println("/product/getProduct : GET");
						
						HashMap <String, Object> hashMap = new HashMap<String, Object>();
						hashMap.put("prodNo", prodNo);
						hashMap.put("userId", "admin2");
						
						//BusinessLogic
						Product product=productService.getProduct(prodNo);
						ModelAndView modelAndView = new ModelAndView();
						modelAndView.addObject("product", product);
						
						if(wishService.checkWish(hashMap) == true) {
							modelAndView.addObject("wish", "../../resources/images/product/wish/diswish.png");
						}else {
							modelAndView.addObject("wish", "../../resources/images/product/wish/wish.png");
						}
						
						System.out.println("상품타입은?"+product.getProdType());
						if((product.getProdType()).equals("paper")  ||  (product.getProdType()).equals("ebook")) {
							modelAndView.setViewName("forward:/view/product/getBook.jsp");
						}else {
							modelAndView.setViewName("forward:/view/product/getProduct.jsp");
						}
							
						return modelAndView;
				}
				
				//method 서비스상품화면 출력
				@RequestMapping(value="getWishList/{userId}", method = RequestMethod.GET)
				public ModelAndView getWishList(@PathVariable String userId) throws Exception {
					
						System.out.println("/product/getProduct : GET");
						
						HashMap <String, Object> hashMap = new HashMap<String, Object>();
						hashMap.put("userId", userId);
						
						//BusinessLogic
						List<Product> wishList =wishService.getWishList(userId);
						ModelAndView modelAndView = new ModelAndView();
						modelAndView.addObject("wishList", wishList);
						modelAndView.addObject("userId", userId);
						
						modelAndView.setViewName("forward:/view/product/getWishList.jsp");
						
						return modelAndView;
				}
				
			/*	
				@RequestMapping(value="getReviewList/{prodNo}", method = RequestMethod.GET)
				public ModelAndView getReviewList(@PathVariable int prodNo) throws Exception {
					
				}
			*/	
				
				
				
					
}
