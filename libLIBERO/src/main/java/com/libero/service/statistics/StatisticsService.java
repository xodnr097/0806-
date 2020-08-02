package com.libero.service.statistics;

import java.util.List;
import java.util.Map;

import com.libero.service.domain.Statistics;

public interface StatisticsService {
	
	public List<Statistics> getMainStatistics() throws Exception;
	
	public Map<String, Object> getStatistics(int prodNo) throws Exception;

}
