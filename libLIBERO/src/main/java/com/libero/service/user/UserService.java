package com.libero.service.user;

import com.libero.service.domain.User;

public interface UserService {
	
	// 내정보확인 / 로그인
	public User getUser(String userId) throws Exception;
}
