package com.libero.web.publish;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.domain.Publish;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishService;
import com.libero.service.user.UserService;

@Controller
@RequestMapping("/publish/*")
public class PublishController {
	
	//Field
	@Autowired
	@Qualifier("publishServiceImpl")
	private PublishService publishService;
	@Autowired
	private UserService userService;
	
	//Constructor
	public PublishController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['path2']}")
	String path;
	
	//method
	@RequestMapping(value="selectProdType", method = RequestMethod.GET)
	public ModelAndView selectProdType() throws Exception {
		
		System.out.println("/publish/selectProdType : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/selectProductType.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addPrintOption", method = RequestMethod.GET)
	public ModelAndView addPrintOption() throws Exception {
		
		System.out.println("/publish/addPrintOption : GET");
		
		Map<String , Object> map = publishService.getPrintOptionList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.setViewName("forward:/view/publish/addPrintOption.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addPrintOption", method = RequestMethod.POST)
	public ModelAndView addPrintOption(HttpSession session, Publish publish, @RequestParam("prodType") String prodType) throws Exception {
		
		System.out.println("/publish/addPrintOption : POST");
		
		User user = (User)session.getAttribute("user");
		publish.setCreator(user.getUserId());
		
		publish.setProdType(prodType);
		
		int prodNo = publishService.addPrintOption(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/publish/addManu?prodNo="+prodNo);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addManu", method = RequestMethod.GET)
	public ModelAndView addManu(HttpSession session, @RequestParam("prodNo")int prodNo, Publish publish) throws Exception {
		
		System.out.println("/publish/addManu : GET");
		
		publish.setProdNo(prodNo);
		
		publish = publishService.getProduct(prodNo);
		
		User user = (User) session.getAttribute("user");
		
		ModelAndView modelAndView = new ModelAndView();
		if (user!=null && user.getUserId().contentEquals(publish.getCreator())) {
			modelAndView.addObject("prod",publish);
			modelAndView.setViewName("forward:/view/publish/addManu.jsp");
		}else {
			modelAndView.setViewName("redirect:/index.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "addManu", method = RequestMethod.POST)
	public ModelAndView addManu(Publish publish, MultipartHttpServletRequest request) throws Exception {
		
		System.out.println("/publish/addManu : POST");
		
		Map<String, MultipartFile> files = request.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile) files.get("file");
		
		if (cmf.getSize()!=0) {
			String originalFileName = cmf.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String fileRoot = path+"publish/fileUpload/"; // 파일 경로
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			publish.setManuFile(savedFileName);
		    	
	    	File f = new File(fileRoot+savedFileName);
	    	cmf.transferTo(f);
		}
		
		if (publish.getManuFile()!=null) {
			publishService.updateManu(publish);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod",publish);
		modelAndView.setViewName("redirect:/publish/addProductInfo?prodNo="+publish.getProdNo());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addProductInfo", method = RequestMethod.GET)
	public ModelAndView addProductInfo(HttpSession session, @RequestParam("prodNo")int prodNo, Publish publish) throws Exception {
		
		System.out.println("/publish/addProductInfo : GET");
		
		publish.setProdNo(prodNo);
		
		publish = publishService.getProduct(prodNo);
		
		User user = (User) session.getAttribute("user");
		
		ModelAndView modelAndView = new ModelAndView();
		if (user!=null && user.getUserId().contentEquals(publish.getCreator())) {
			modelAndView.addObject("prod",publish);
			modelAndView.setViewName("forward:/view/publish/addProductInfo.jsp");
		}else {
			modelAndView.setViewName("redirect:/index.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "addProductInfo", method = RequestMethod.POST)
	public ModelAndView addProductInfo(Publish publish) throws Exception {
		
		System.out.println("/publish/addProductInfo : POST");
		
		/* publishService.updatePublishInfo(publish); */
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod",publish);
		modelAndView.setViewName("redirect:/publish/addRetailPrice?prodNo="+publish.getProdNo());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addRetailPrice", method = RequestMethod.GET)
	public ModelAndView addRetailPrice(HttpSession session, @RequestParam("prodNo")int prodNo, Publish publish) throws Exception {
		
		System.out.println("/publish/addRetailPrice : GET");
		
		publish.setProdNo(prodNo);
		
		publish = publishService.getProduct(prodNo);
		if (publish.getRetailPrice()==0) {
			publish.setRetailPrice(publish.getPrintPrice()*2);
		}
		User user = (User) session.getAttribute("user");
		
		ModelAndView modelAndView = new ModelAndView();
		if (user!=null && user.getUserId().contentEquals(publish.getCreator())) {
			modelAndView.addObject("prod",publish);
			modelAndView.setViewName("forward:/view/publish/addRetailPrice.jsp");
		}else {
			modelAndView.setViewName("redirect:/index.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "addRetailPrice", method = RequestMethod.POST)
	public ModelAndView addRetailPrice(Publish publish) throws Exception {
		
		System.out.println("/publish/addRetailPrice : POST");
		
		publishService.updateRetailPrice(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod",publish);
		modelAndView.setViewName("redirect:/view/product/getProductList.jsp");
		
		return modelAndView;
	}
	
	//////////////////////// 상품 등록 ///////////////////////////////////////
	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public ModelAndView addProduct(HttpSession session) throws Exception {
		
		System.out.println("/publish/addProduct : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addProduct.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(HttpSession session, Publish publish, @RequestParam("imgFile")List<MultipartFile> files) throws Exception {
		
		System.out.println("/publish/addProduct : POST");
		
		User user = (User)session.getAttribute("user");
		
		publish.setCreator(user.getUserId());
		
		//File Upload Start
		if (files!=null) {
			
			int i = 0;
			
			for (MultipartFile multipartFile : files) {
				System.out.println(++i+"번째 파일 : ");
				System.out.println(multipartFile.getOriginalFilename());
				
				String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String fileRoot = path+"publish/fileUpload/"; // 파일 경로
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				File f =new File(fileRoot+savedFileName);
				
				multipartFile.transferTo(f);
				if (i==1) {
					publish.setProdThumbnail(f.getName());
					
				}
				if(i==2) {
					publish.setCoverFile(f.getName());
				}
				System.out.println("파일 업로드 성공 : "+f.getName());
				//맞춤형표지, 교정교열은 2일시 for문 빠져나옴
				if (publish.getProdType().contentEquals("target")||publish.getProdType().contentEquals("correct")) {
					break;
				}
			}
		}
		//File Upload End
		System.out.println(publish);
		publishService.addProduct(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/product/getProductList.jsp");
		
		return modelAndView;
	}
	
	////////////////////////////////////// 상품 수정 ///////////////////////////////////
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public ModelAndView updateProduct(HttpSession session, @RequestParam("prodNo") int prodNo) throws Exception {
		
		System.out.println("/publish/updateProduct : GET");
		
		Publish publish = publishService.getProduct(prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod", publish);
		modelAndView.setViewName("forward:/view/publish/updateProduct.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public ModelAndView updateProduct(Publish publish) throws Exception {
		
		System.out.println("/publish/updateProduct : POST");
		
		publishService.updateProduct(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod", publish);
		modelAndView.setViewName("forward:/view/product/getProduct.jsp");
		
		return modelAndView;
	}
	
	///////////////////////////////// 옵션 가격 등록 조회 ////////////////////////////////////////
	@RequestMapping(value = "addOptionPrice", method = RequestMethod.GET)
	public ModelAndView addOptionPrice(HttpSession session) throws Exception {
		
		User user = (User) session.getAttribute("user");
		
		ModelAndView modelAndView = new ModelAndView();
		if (user == null) {
			modelAndView.setViewName("redirect:/index.jsp");
		} else {
			modelAndView.addObject("user", user);
			modelAndView.setViewName("forward:/view/publish/addOptionPrice.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "getOptionPrice", method = RequestMethod.GET)
	public ModelAndView getOptionPrice(HttpSession session) throws Exception {
		
		User user = (User) session.getAttribute("user");
		
		if (user != null) {
			user = publishService.getOptionPrice(user.getUserId());
		}
		
		ModelAndView modelAndView = new ModelAndView();
		if (user == null) {
			modelAndView.setViewName("redirect:/index.jsp");
		} else {
			modelAndView.addObject("user", user);
			modelAndView.setViewName("forward:/view/publish/getOptionPrice.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "updateOptionPrice", method = RequestMethod.POST)
	public ModelAndView updateOptionPrice(User user, HttpSession session) throws Exception {
		
		publishService.updateOptionPrice(user);
		
		user=userService.getUser(user.getUserId());
		
		session.setAttribute("user", user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/publish/getOptionPrice");
		
		return modelAndView;
	}
}
