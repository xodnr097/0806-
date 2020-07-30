package com.libero.service.user;

import java.util.List;

import com.libero.service.domain.User;

public interface UserDAO {
	
	// SELECT ONE
	public User getUser(String userId) throws Exception ;
	
	public void addUser(User user) throws Exception;
	
	public List<User> getAdminCashList() throws Exception;

}
