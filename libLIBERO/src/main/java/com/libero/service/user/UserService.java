package com.libero.service.user;

import java.util.List;
import java.util.Map;

import com.libero.common.Search;
import com.libero.service.domain.User;

public interface UserService {
	

	public User getUser(String userId) throws Exception;
	
	public User addUser(User user) throws Exception;
	
	public Map<String, Object> getUserList(Search search) throws Exception;
	
	public boolean duplicationCheck(String userId) throws Exception;
	
	public boolean duplicationNick(String nickname) throws Exception;
	
	public List<String> addHashtag(String userId,List<String> hashtagName) throws Exception;
	
}
