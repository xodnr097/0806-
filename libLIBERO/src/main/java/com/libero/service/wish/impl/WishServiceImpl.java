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
			
			System.out.println("여기는 in wishServiceImpl");
			if(wishDAO.checkWishList(hashMap) == null ) {
						System.out.println("좋아요에 상품이 없는것 확인, 등록진행");
						wishDAO.addWish(hashMap);
						return true;
			}else {
						System.out.println("좋아요에 상품이 있는것 확인, 삭제진행");
						wishDAO.removeWish(hashMap);
						return false;
			}
		}

}
