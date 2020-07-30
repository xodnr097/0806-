package com.libero.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.domain.User;
import com.libero.service.user.UserDAO;
import com.libero.service.user.UserService;

//==> ȸ������ ���� ����
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

	@Override
	public User addUser(User user) throws Exception {
		
		System.out.println("\n\n==================================");
		System.out.println("!!!USERSERVICEIMPL!!!");
		System.out.println("==================================\n\n");
		// TODO Auto-generated method stub
		userDAO.addUser(user);
		
		return null;
	}

	@Override
	public List<User> getAdminCashList() throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getAdminCashList();
	}

}
