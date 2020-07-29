package com.libero.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.domain.Publish;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishService;
import com.libero.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	private PublishService publishService;

	public UserController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		System.out.println(session.getAttribute("user"));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/index.jsp";
	}

	@RequestMapping(value="addUser",method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/user/addUser : GET");
		System.out.println(" ---------------------------------------");
		
		ModelAndView mdv = new ModelAndView();
		mdv.setViewName("forward:/view/user/addUser.jsp");
		return mdv;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("userId") String userId,
								@ModelAttribute("password") String password,
								@ModelAttribute("nickname") String nickname,
								@ModelAttribute("address") String address,
								@ModelAttribute("phone1") String phone1,
								@ModelAttribute("phone2") String phone2,
								@ModelAttribute("phone3") String phone3,
								@ModelAttribute("profile") String profile) throws Exception{
		User user= new User();
		System.out.println(" ---------------------------------------");
		System.out.println("/user/addUser : POST");
		System.out.println(" ---------------------------------------");
		String phone ="";
		user.setUserId(userId);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setAddress(address);
		phone= phone1+"-"+phone2+"-"+phone3;
		user.setPhone(phone);
		user.setProfile(profile);
		ModelAndView mdv = new ModelAndView();
		userService.addUser(user);
		
		mdv.setViewName("redirect:/index.jsp");
		return mdv;
	}
	
	@RequestMapping(value = "getUserPublishList", method = RequestMethod.GET)
	public ModelAndView getUserPublishList(HttpSession session, @RequestParam("prodType") String prodType, Publish publish) throws Exception {
		
		System.out.println("/user/getUserPublishList : GET");
		
		publish.setProdType(prodType);
		publish.setCreator(((User)session.getAttribute("user")).getUserId());
		
		Map<String , Object> map=publishService.getUserPublishList(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("totalCount", map.get("totalCount"));
		modelAndView.setViewName("forward:/view/user/getUserPublishList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "getTempPublishList", method = RequestMethod.GET)
	public ModelAndView getStatistics(HttpSession session, Publish publish) throws Exception {
		
		System.out.println("/user/getTempPublishList : GET");
		
		publish.setCreator(((User)session.getAttribute("user")).getUserId());
		publish.setTempCode((short) 1);
		
		Map<String , Object> map=publishService.getUserPublishList(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("totalCount", map.get("totalCount"));
		modelAndView.setViewName("forward:/view/user/getTempPublishList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "removeTempPublish", method = RequestMethod.GET)
	public ModelAndView removeTempPublish(@RequestParam("prodNo")int prodNo, Publish publish) throws Exception {
		
		System.out.println("/user/getTempPublishList : GET");
		
		publish = publishService.getProduct(prodNo);
		
		publishService.removeTempPublish(publish);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/getTempPublishList");
		
		return modelAndView;
	}
}
