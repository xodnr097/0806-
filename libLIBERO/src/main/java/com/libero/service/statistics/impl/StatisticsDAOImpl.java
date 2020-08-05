package com.libero.service.statistics.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.service.domain.Statistics;
import com.libero.service.statistics.StatisticsDAO;

@Repository("statisticsDAOImpl")
public class StatisticsDAOImpl implements StatisticsDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public StatisticsDAOImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Statistics> getMainCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("StatisticsMapper.getMainCount");
	}
	
	public List<Statistics> getDateStatistics(int prodNo) throws Exception {
		return sqlSession.selectList("StatisticsMapper.getDateStatistics", prodNo);
	}
	
	public List<Statistics> getGenderStatistics(int prodNo) throws Exception {
		return sqlSession.selectList("StatisticsMapper.getGenderStatistics", prodNo);
	}
	
	public List<Statistics> getAgeStatistics(int prodNo) throws Exception {
		return sqlSession.selectList("StatisticsMapper.getAgeStatistics", prodNo);
	}
	
	public List<Statistics> getCashStatistics(String userId) throws Exception{
		return sqlSession.selectList("StatisticsMapper.getCashStatistics", userId);
	}
	
}
