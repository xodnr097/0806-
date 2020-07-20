package com.libero.service.wish;

public interface WishService {
	
	public boolean checkWish(int prodNo, String userId) throws Exception;
	
	public void addWish(int prodNo, String userId)throws Exception;

}
