package com.libero.service.user;

import com.libero.service.domain.User;

public interface UserService {
	

	public User getUser(String userId) throws Exception;
	
	public User addUser(User user) throws Exception;
	
}
