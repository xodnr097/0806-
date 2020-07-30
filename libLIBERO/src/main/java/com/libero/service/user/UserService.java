package com.libero.service.user;

import java.util.List;

import com.libero.service.domain.User;

public interface UserService {
	

	public User getUser(String userId) throws Exception;
	
	public User addUser(User user) throws Exception;
	
	public List<User> getAdminCashList() throws Exception;
	
}
