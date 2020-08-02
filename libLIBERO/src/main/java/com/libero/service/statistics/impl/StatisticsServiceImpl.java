package com.libero.service.statistics.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.service.domain.Statistics;
import com.libero.service.publish.PublishDAO;
import com.libero.service.statistics.StatisticsDAO;
import com.libero.service.statistics.StatisticsService;

@Service("statisticsServiceImpl")
public class StatisticsServiceImpl implements StatisticsService{
	
	///Field
	@Autowired
	@Qualifier("statisticsDAOImpl")
	private StatisticsDAO statisticsDAO;
	public void setStatisticsDAO(StatisticsDAO statisticsDAO) {
		this.statisticsDAO = statisticsDAO;
	}
	
	///Constructor
	public StatisticsServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Statistics> getMainStatistics() throws Exception {
		// TODO Auto-generated method stub
		return statisticsDAO.getMainCount();
	}
	
	public Map<String, Object> getStatistics(int prodNo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Statistics> day = statisticsDAO.getDateStatistics(prodNo);
		map.put("day", day);
		List<Statistics> gender = statisticsDAO.getGenderStatistics(prodNo);
		map.put("gender", gender);
		List<Statistics> age = statisticsDAO.getAgeStatistics(prodNo);
		map.put("age", age);
		
		return map;
	}

}
