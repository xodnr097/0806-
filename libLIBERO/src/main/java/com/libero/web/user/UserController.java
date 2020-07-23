package com.libero.web.user;

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

import com.libero.service.domain.User;
import com.libero.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

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
								@ModelAttribute("phone") String phone,
								@ModelAttribute("profile") String profile) throws Exception{
		User user= new User();
		System.out.println(" ---------------------------------------");
		System.out.println("/user/addUser : POST");
		System.out.println(" ---------------------------------------");
		
		user.setUserId(userId);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setAddress(address);
		user.setPhone(phone);
		user.setProfile(profile);
		ModelAndView mdv = new ModelAndView();
		userService.addUser(user);
		
		mdv.setViewName("redirect:/index.jsp");
		return mdv;
	}
}
