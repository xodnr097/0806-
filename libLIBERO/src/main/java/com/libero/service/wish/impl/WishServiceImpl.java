package com.libero.service.wish.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.wish.WishDAO;
import com.libero.service.wish.WishService;

@Service("wishServiceImpl")
public class WishServiceImpl implements WishService {

		///Field
		@Autowired
		@Qualifier("wishDAOImpl")
		private WishDAO wishDAO;
		public void setWishDAO(WishDAO wishDAO)	{
			this.wishDAO = wishDAO;
		}
		
		///Counstructor
		public WishServiceImpl()	{
						System.out.println(this.getClass());
		}
		
		///Method
		@Override
		public boolean addWish(HashMap<String, Object> hashMap) throws Exception {
			
			String userId = (String) hashMap.get("userId");
			System.out.println(hashMap.get("userId"));
			if(wishDAO.getWishList(userId) == null ) {
						wishDAO.addWish(hashMap);
						return true;
			}else {
						wishDAO.removeWish(hashMap);
						return false;
			}
		}

}
