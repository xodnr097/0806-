package com.libero.service.user;

import java.util.List;

import com.libero.common.Search;
import com.libero.service.domain.User;

public interface UserDAO {
	
	// SELECT ONE
	public User getUser(String userId) throws Exception ;
	
	public void addUser(User user) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;

	public boolean duplicationCheck(String userId) throws Exception;
	
	public boolean duplicationNick(String nickname) throws Exception;
	
	public int getUserTotalCount(Search search) throws Exception;
	
	public List<String> addHashtag(String userId, List<String> hashtagName) throws Exception;
}
