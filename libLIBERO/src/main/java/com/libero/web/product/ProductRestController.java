package com.libero.web.product;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.libero.service.cart.CartService;
import com.libero.service.product.ProductService;
import com.libero.service.wish.WishService;


@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;

			//Constructor
			public ProductRestController() {
				System.out.println(this.getClass());
			}
			
			
			//method 좋아요 등록
			@RequestMapping(value="json/addWish", method = RequestMethod.POST)
			public String addWish(int prodNo, String userId) throws Exception {
				
					System.out.println("/product/addWish : POST");
					System.out.println("전달된 prodNo : "+prodNo);
					System.out.println("전달된 아이디 : "+userId );
					JSONObject obj = new JSONObject();
					//BusinessLogic
					
					HashMap <String, Object> hashMap = new HashMap<String, Object>();
					hashMap.put("prodNo", prodNo);
					hashMap.put("userId", userId);
					
					
					//좋아요 존재 여부 검사
					boolean isWish = wishService.addWish(hashMap);
					
					if(isWish == true) {
						obj.put("wishImage", "../../resources/images/product/wish/wish.png");
					}else {
						obj.put("wishImage", "../../resources/images/product/wish/diswish.png");
					}
										
					
					return obj.toJSONString();
			}//end addWish
			
			//장바구니 등록
			@RequestMapping(value="json/addCart", method = RequestMethod.POST)
			public String addCart(int prodNo, String userId, int buyAmount, String from) throws Exception {
				
					System.out.println("/product/addWish : POST");
					System.out.println("전달된 prodNo : "+prodNo);
					System.out.println("전달된 아이디 : "+userId );
					System.out.println("전달된 구매수량"+buyAmount);
					System.out.println("어디서 왔는가"+from);
					JSONObject obj = new JSONObject();
					//BusinessLogic
					
					
					
					HashMap <String, Object> hashMap = new HashMap<String, Object>();
					hashMap.put("prodNo", prodNo);
					hashMap.put("userId", userId);
					hashMap.put("buyAmount", buyAmount);
					
					if(from.equals("cart")) {
						hashMap.put("from", from);
					}	
					cartService.addCart(hashMap);
			
					String message = "장바구니에 등록되었습니다.";
					
					obj.put("result", message);
					
					return obj.toJSONString();
			}//end addCart
			
			
			//장바구니 삭제
			@RequestMapping(value="json/removeCart", method = RequestMethod.POST)
			public String addCart(int prodNo, String userId) throws Exception {
				
					System.out.println("/product/addWish : POST");
					System.out.println("전달된 prodNo : "+prodNo);
					System.out.println("전달된 아이디 : "+userId );
					JSONObject obj = new JSONObject();
					//BusinessLogic
					
					HashMap <String, Object> hashMap = new HashMap<String, Object>();
					hashMap.put("prodNo", prodNo);
					hashMap.put("userId", userId);
					
					cartService.removeCart(hashMap);
			
					String message = "장바구니에서 삭제되었습니다.";
					
					obj.put("result", message);
					
					return obj.toJSONString();
			}//end addCart
			
			
			
}//end class