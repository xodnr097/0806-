package com.libero.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.domain.User;
import com.libero.service.user.UserDAO;
import com.libero.service.user.UserService;

//==> 회원관리 서비스 구현
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	//Field
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	public void setUserDao(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	//Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	//method
	public User getUser(String userId) throws Exception {
		return userDAO.getUser(userId);
	}

}
