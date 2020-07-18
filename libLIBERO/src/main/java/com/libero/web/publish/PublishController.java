package com.libero.web.publish;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.domain.Product;
import com.libero.service.domain.User;
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
	
	@Value("#{commonProperties['path']}")
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
	public ModelAndView addPrintOption(HttpSession session, @RequestParam("prodType") String prodType) throws Exception {
		
		System.out.println("/publish/addPrintOption : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addPrintOption.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addPrintOption", method = RequestMethod.POST)
	public ModelAndView addPrintOption(HttpSession session, Product product) throws Exception {
		
		System.out.println("/publish/addPrintOption : POST");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addManu.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addManu", method = RequestMethod.GET)
	public ModelAndView addManu(HttpSession session, @RequestParam("prodNo")int prodNo, Product product) throws Exception {
		
		System.out.println("/publish/addManu : GET");
		
		product = publishService.getPublish(prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod",product);
		modelAndView.setViewName("forward:/view/publish/addManu.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public ModelAndView addProduct(HttpSession session) throws Exception {
		
		System.out.println("/publish/addProduct : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/addProduct.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public ModelAndView addProduct(HttpSession session, Product product, @RequestParam("imgFile")List<MultipartFile> files) throws Exception {
		
		System.out.println("/publish/addProduct : POST");
		
		User user = (User)session.getAttribute("user");
		
		product.setCreator(user.getUserId());
		
		//File Upload Start
		if (files!=null) {
			
			int i = 0;
			
			for (MultipartFile multipartFile : files) {
				
				System.out.println("첫번째 파일 : "+ ++i);
				System.out.println(multipartFile.getOriginalFilename());
				
				String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
						
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				File f =new File(path+savedFileName);
				
				multipartFile.transferTo(f);
				
				if (i==1) {
					product.setProdThumbnail(f.getName());
				}
				if(i==2) {
					product.setCoverFile(f.getName());
				}
				
				System.out.println("파일 업로드 성공 : "+f.getName());
			}
		}
		//File Upload End
		System.out.println(product);
		publishService.addProduct(product);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/view/publish/selectProductType.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public ModelAndView updateProduct(HttpSession session, @RequestParam("prodNo") int prodNo) throws Exception {
		
		System.out.println("/publish/addProduct : GET");
		
		Product product = publishService.getPublish(prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("prod", product);
		modelAndView.setViewName("forward:/view/publish/updateProduct.jsp");
		
		return modelAndView;
	}
}
