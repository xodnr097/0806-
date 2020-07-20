package com.libero.web.product;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.product.ProductService;


@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

			//Constructor
			public ProductRestController() {
				System.out.println(this.getClass());
			}
			
			/*
			//method 좋아요 등록
			@RequestMapping(value="addWish", method = RequestMethod.POST)
			public ModelAndView addWish(int prodNo, String userId) throws Exception {
				
					System.out.println("/product/addWish : POST");
					System.out.println("전달된 prodNo : "+prodNo);
					System.out.println("전달된 아이디 : "+userId );
					JSONObject obj = new JSONObject();
					//BusinessLogic
					
					HashMap <String, Object> hashMap = new HashMap<String, Object>();
					hashMap.put("prodNo", prodNo);
					hashMap.put("userId", userId);
					
					//좋아요 존재 여부 검사
					
					
					
					return modelAndView;
			}//end addWish
			*/
}//end class
