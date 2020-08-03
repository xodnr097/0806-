package com.libero.service.statistics;

import java.util.List;

import com.libero.service.domain.Statistics;

public interface StatisticsDAO {
	
	public List<Statistics> getMainCount() throws Exception;
	
	public List<Statistics> getDateStatistics(int prodNo) throws Exception;
	
	public List<Statistics> getGenderStatistics(int prodNo) throws Exception;
	
	public List<Statistics> getAgeStatistics(int prodNo) throws Exception;

}
