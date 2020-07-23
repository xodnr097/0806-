package com.libero.service.wish;

import java.util.HashMap;

public interface WishService {
	
	public boolean addWish(HashMap<String, Object> hashMap) throws Exception;

	public boolean checkWish(HashMap<String, Object> hashMap) throws Exception;

}