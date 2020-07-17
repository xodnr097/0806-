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


import com.libero.service.domain.Buy;
import com.libero.service.buy.BuyService;


/*
 *	FileName :  BuyServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",  
									 "classpath:config/context-mybatis.xml",  
									 "classpath:config/context-transaction.xml"
									 })
public class BuyTestApp {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;

	//@Test
	public void testAddBuy() throws Exception {
//		
//		Buy Buy = new Buy();
//		Buy.setBuyId("testBuyId");
//		Buy.setBuyName("testBuyName");
//		Buy.setPassword("testPasswd");
//		Buy.setSsn("1111112222222");
//		Buy.setPhone("111-2222-3333");
//		Buy.setAddr("경기도");
//		Buy.setEmail("test@test.com");
//		Date date = new Date();
//		
//		Buy.setRegDate(date);
//		
//		BuyService.addBuy(Buy);
//		
//		Buy = BuyService.getBuy("testBuyId");
//
//		//==> console 확인
//		//System.out.println(Buy);
//		
//		//==> API 확인
//		Assert.assertEquals("testBuyId", Buy.getBuyId());
//		Assert.assertEquals("testBuyName", Buy.getBuyName());
//		Assert.assertEquals("testPasswd", Buy.getPassword());
//		Assert.assertEquals("111-2222-3333", Buy.getPhone());
//		Assert.assertEquals("경기도", Buy.getAddr());
//		Assert.assertEquals("test@test.com", Buy.getEmail());
	}
	
	@Test
	public void testGetBuy() throws Exception {
		System.out.println("-----------GetBuy-----------");
		Buy buy = new Buy();
		//==> 필요하다면...
//		Buy.setBuyId("testBuyId");
//		Buy.setBuyName("testBuyName");
//		Buy.setPassword("testPasswd");
//		Buy.setSsn("1111112222222");
//		Buy.setPhone("111-2222-3333");
//		Buy.setAddr("경기도");
//		Buy.setEmail("test@test.com");
		
		buy = buyService.getUserBuy("wjddbstp95@gmail.com");

		//==> console 확인
		//System.out.println(Buy);
		
		//==> API 확인
//		Assert.assertEquals("wjddbstp95@gmail.com", buy.getBuyerId().getUserId());
//		Assert.assertEquals("testBuyName", buy.getBuyName());
//		Assert.assertEquals("testPasswd", buy.getPassword());
		Assert.assertEquals("123-1234-1234", buy.getReceiverPhone());
//		Assert.assertEquals("경기도", Buy.getAddr());
//		Assert.assertEquals("test@test.com", Buy.getEmail());
//
//		Assert.assertNotNull(BuyService.getBuy("Buy02"));
//		Assert.assertNotNull(BuyService.getBuy("Buy05"));
//		System.out.println("=-=-=-=-=-=-=-=-=-=");
//		System.out.println("::"+Buy);
//		System.out.println("=-=-=-=-=-=-=-=-=-=");
//		System.out.println("-----------GetBuy-----------\n\n");
	}
	
	//@Test
	 public void testUpdateBuy() throws Exception{
//		 System.out.println("-----------UpdateBuy-----------");
//		Buy Buy = BuyService.getBuy("testBuyId");
//		Assert.assertNotNull(Buy);
//		
//		Assert.assertEquals("testBuyName", Buy.getBuyName());
//		Assert.assertEquals("111-2222-3333", Buy.getPhone());
//		Assert.assertEquals("경기도", Buy.getAddr());
//		Assert.assertEquals("test@test.com", Buy.getEmail());
//
//		Buy.setBuyName("change");
//		Buy.setPhone("777-7777-7777");
//		Buy.setAddr("change");
//		Buy.setEmail("change@change.com");
//		
//		BuyService.updateBuy(Buy);
//		
//		Buy = BuyService.getBuy("testBuyId");
//		Assert.assertNotNull(Buy);
//		
//		//==> console 확인
//		//System.out.println(Buy);
//			
//		//==> API 확인
//		Assert.assertEquals("change", Buy.getBuyName());
//		Assert.assertEquals("777-7777-7777", Buy.getPhone());
//		Assert.assertEquals("change", Buy.getAddr());
//		Assert.assertEquals("change@change.com", Buy.getEmail());
//		System.out.println("-----------UpdateBuy-----------\n\n");
	 }
	 
	//@Test
	public void testCheckDuplication() throws Exception{

		//==> 필요하다면...
//		Buy Buy = new Buy();
//		Buy.setBuyId("testBuyId");
//		Buy.setBuyName("testBuyName");
//		Buy.setPassword("testPasswd");
//		Buy.setSsn("1111112222222");
//		Buy.setPhone("111-2222-3333");
//		Buy.setAddr("경기도");
//		Buy.setEmail("test@test.com");
//		
//		BuyService.addBuy(Buy);
		
		//==> console 확인
		//System.out.println(BuyService.checkDuplication("testBuyId"));
		//System.out.println(BuyService.checkDuplication("testBuyId"+System.currentTimeMillis()) );
	 	
		//==> API 확인
//		Assert.assertFalse( BuyService.checkDuplication("testBuyId") );
//	 	Assert.assertTrue( BuyService.checkDuplication("testBuyId"+System.currentTimeMillis()) );
		 	
	}
	
	 //==>  주석을 풀고 실행하면....
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
//		//==> console 확인
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
//	 	//==> console 확인
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
//		//==> console 확인
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
//		//==> console 확인
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
//		//==> console 확인
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
//		//==> console 확인
//	 	System.out.println(list);
//	 	
//	 	totalCount = (Integer)map.get("totalCount");
//	 	System.out.println(totalCount);
//	 	System.out.println("-----------BuyNameList-----------\n\n");
	 }	 
}



