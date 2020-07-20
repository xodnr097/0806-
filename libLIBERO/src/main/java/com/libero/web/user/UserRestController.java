package com.libero.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.libero.service.domain.User;
import com.libero.service.user.UserService;

//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	//Constructor
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	//method
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(@RequestBody Map<String, Object> params, HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+params.get("userId"));
		User user = userService.getUser((String) params.get("userId"));
		
		if( ((String)params.get("password")).equals(user.getPassword())){
			session.setAttribute("user", user);
		}
		
		return user;
	}
}