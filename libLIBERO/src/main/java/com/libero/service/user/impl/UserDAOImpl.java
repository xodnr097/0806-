package com.libero.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.domain.User;
import com.libero.service.user.UserDAO;

@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDAOImpl() {
		System.out.println(this.getClass());
	}
	//method
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public void addUser(User user) throws Exception {
		sqlSession.insert("UserMapper.addNewUser",user);
		
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("UserMapper.getUserList",search);
	}

	@Override
	public boolean duplicationCheck(String userId)  throws Exception{
		
		String result = sqlSession.selectOne("UserMapper.duplicationCheck", userId);
		System.out.println("서연희____result = " + result);
		if(result!=null) {
			System.out.println("dksdls vws");
			return false;
		}else {
			System.out.println("널입니다...\n\n\n\n\n");
			return true;
		}
			
	}

	@Override
	public boolean duplicationNick(String nickname) throws Exception {
		// TODO Auto-generated method stub
		String result= sqlSession.selectOne("UserMapper.duplicationNick",nickname);
		if(result!=null) {
			System.out.println("널이 아닐때 이이이이잉");
			return false;
		}else {
			return true;
		}
		
	}
	
	@Override
	public List<String> addHashtag(String userId, List<String> hashtagName) throws Exception {
			
		Map map = new HashMap();
		map.put("userId",userId);
		
		for(int i=0;i<hashtagName.size();i++) {
			String hashtag = hashtagName.get(i);
			map.put("hashtagName", hashtag);
			sqlSession.insert("UserMapper.addHashTag",map);
		}
		return null;
	}
	
	@Override
	public int getUserTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getUserTotalCount", search);
	}

}
