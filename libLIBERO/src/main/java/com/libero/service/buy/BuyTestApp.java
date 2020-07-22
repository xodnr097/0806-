package com.libero.service.buy;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.libero.service.domain.Pay;
import com.libero.service.domain.User;
import com.libero.service.product.ProductService;
import com.libero.service.user.UserService;
import com.libero.service.user.impl.UserServiceImpl;
import com.libero.service.buy.BuyService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",  
									 "classpath:config/context-mybatis.xml",  
									 "classpath:config/context-transaction.xml"
									 })
public class BuyTestApp {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;
	@Qualifier("userServiceImpl")
	private UserServiceImpl userService;

	//@Test
	public void testAddBuy() throws Exception {
		System.out.println("\n\n\n-----------Add Buy-----------\n\n\n");
		Pay pay = new Pay();
		User user = new User();
		
		//ProductService productService;
		//user = userService.getUser("wjddbstp95@gmail.com");
		//userService.getUser("wjddbstp95@gmail.com");
		
		
		System.out.println("\n\n\n-----------------------------");
		//System.out.println(user.getUserId());
		System.out.println("-----------------------------\n\n\n");
		
		
		//product= productService.getProduct();
		
	
//		pay.setBuyerId("choije9410@gmail.com");
//		//Pay.setProdNo(product);
//		pay.setPaymentOption("c");
//		pay.setActualPrice(30000);
//		pay.setReceiverName("최지은");
//		pay.setReceiverAddr("경기도");
//		pay.setReceiverPhone("010-7787-7979");
//		pay.setDeliveryRequest("투명드래곤은 강해따");
//		pay.setDeliveryStatus(1);
		
		
		//buyService.addBuy(pay);
		
		pay = buyService.getUserBuy("choije9410@gmail.com","10005");
		
		
		System.out.println(pay);
		
		
		Assert.assertEquals("choije9410@gmail.com", pay.getBuyerId());
		//Assert.assertEquals("최지은", userService.getUser("choije9410@gmail.com").getName());
		Assert.assertEquals("최지은", pay.getReceiverName());
		Assert.assertEquals("경기도", pay.getReceiverAddr());
		Assert.assertEquals("010-7787-7979", pay.getReceiverPhone());
		Assert.assertEquals("투명드래곤은 강해따", pay.getDeliveryRequest());
		
	}
	
	@Test
	public void testGetBuy() throws Exception {
		System.out.println("-----------GetBuy-----------");
		Pay pay = new Pay();
		//==> �ʿ��ϴٸ�...
//		Pay.setBuyId("testBuyId");
//		Pay.setBuyName("testBuyName");
//		Pay.setPassword("testPasswd");
//		Pay.setSsn("1111112222222");
//		Pay.setPhone("111-2222-3333");
//		Pay.setAddr("��⵵");
//		Pay.setEmail("test@test.com");
		
		pay = buyService.getUserBuy("wjddbstp95@gmail.com","10002");

		//==> console Ȯ��
		//System.out.println(Pay);
		
		//==> API Ȯ��
//		Assert.assertEquals("wjddbstp95@gmail.com", buy.getBuyerId().getUserId());
//		Assert.assertEquals("testBuyName", buy.getBuyName());
//		Assert.assertEquals("testPasswd", buy.getPassword());
		Assert.assertEquals("123-1234-1234", pay.getReceiverPhone());
//		Assert.assertEquals("��⵵", Pay.getAddr());
//		Assert.assertEquals("test@test.com", Pay.getEmail());
//
//		Assert.assertNotNull(BuyService.getBuy("Buy02"));
//		Assert.assertNotNull(BuyService.getBuy("Buy05"));
//		System.out.println("=-=-=-=-=-=-=-=-=-=");
//		System.out.println("::"+Pay);
//		System.out.println("=-=-=-=-=-=-=-=-=-=");
//		System.out.println("-----------GetBuy-----------\n\n");
	}
	
	//@Test
	 public void testUpdateBuy() throws Exception{
//		 System.out.println("-----------UpdateBuy-----------");
//		Pay Pay = BuyService.getBuy("testBuyId");
//		Assert.assertNotNull(Pay);
//		
//		Assert.assertEquals("testBuyName", Pay.getBuyName());
//		Assert.assertEquals("111-2222-3333", Pay.getPhone());
//		Assert.assertEquals("��⵵", Pay.getAddr());
//		Assert.assertEquals("test@test.com", Pay.getEmail());
//
//		Pay.setBuyName("change");
//		Pay.setPhone("777-7777-7777");
//		Pay.setAddr("change");
//		Pay.setEmail("change@change.com");
//		
//		BuyService.updateBuy(Pay);
//		
//		Pay = BuyService.getBuy("testBuyId");
//		Assert.assertNotNull(Pay);
//		
//		//==> console Ȯ��
//		//System.out.println(Pay);
//			
//		//==> API Ȯ��
//		Assert.assertEquals("change", Pay.getBuyName());
//		Assert.assertEquals("777-7777-7777", Pay.getPhone());
//		Assert.assertEquals("change", Pay.getAddr());
//		Assert.assertEquals("change@change.com", Pay.getEmail());
//		System.out.println("-----------UpdateBuy-----------\n\n");
	 }
	 
	//@Test
	public void testCheckDuplication() throws Exception{

		//==> �ʿ��ϴٸ�...
//		Pay Pay = new Pay();
//		Pay.setBuyId("testBuyId");
//		Pay.setBuyName("testBuyName");
//		Pay.setPassword("testPasswd");
//		Pay.setSsn("1111112222222");
//		Pay.setPhone("111-2222-3333");
//		Pay.setAddr("��⵵");
//		Pay.setEmail("test@test.com");
//		
//		BuyService.addBuy(Pay);
		
		//==> console Ȯ��
		//System.out.println(BuyService.checkDuplication("testBuyId"));
		//System.out.println(BuyService.checkDuplication("testBuyId"+System.currentTimeMillis()) );
	 	
		//==> API Ȯ��
//		Assert.assertFalse( BuyService.checkDuplication("testBuyId") );
//	 	Assert.assertTrue( BuyService.checkDuplication("testBuyId"+System.currentTimeMillis()) );
		 	
	}
	
	 //==>  �ּ��� Ǯ�� �����ϸ�....
	 //@Test
	 public void testGetBuyListAll() throws Exception{
//		System.out.println("-----------AllListBuy-----------");
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	
//	 	Map<String,Object> map = BuyService.getBuyList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//		//==> console Ȯ��
//	 	//System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword("");
//	 	map = BuyService.getBuyList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//	 	//==> console Ȯ��
//	 	//System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//		System.out.println("-----------AllListBuy-----------\n\n");
	 }
	 
	 //@Test
	 public void testGetBuyListByBuyId() throws Exception{
//		System.out.println("-----------BuyIDList-----------");
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword("admin");
//	 	Map<String,Object> map = BuyService.getBuyList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(1, list.size());
//	 	
//		//==> console Ȯ��
//	 	//System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setSearchCondition("0");
//	 	search.setSearchKeyword(""+System.currentTimeMillis());
//	 	map = BuyService.getBuyList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(0, list.size());
//	 	
//		//==> console Ȯ��
//	 	//System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	System.out.println("-----------BuyIDList-----------\n\n");
	 }
	 
	 //@Test
	 public void testGetBuyListByBuyName() throws Exception{
//		System.out.println("-----------BuyNameList-----------");
//	 	Search search = new Search();
//	 	search.setCurrentPage(1);
//	 	search.setPageSize(3);
//	 	search.setSearchCondition("1");
//	 	search.setSearchKeyword("SCOTT");
//	 	Map<String,Object> map = BuyService.getBuyList(search);
//	 	
//	 	List<Object> list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(3, list.size());
//	 	
//		//==> console Ȯ��
//	 	System.out.println(list);
//	 	
//	 	Integer totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	
//	 	System.out.println("=======================================");
//	 	
//	 	search.setSearchCondition("1");
//	 	search.setSearchKeyword(""+System.currentTimeMillis());
//	 	map = BuyService.getBuyList(search);
//	 	
//	 	list = (List<Object>)map.get("list");
//	 	Assert.assertEquals(0, list.size());
//	 	
//		//==> console Ȯ��
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	System.out.println("-----------BuyNameList-----------\n\n");
	 }	 
}



