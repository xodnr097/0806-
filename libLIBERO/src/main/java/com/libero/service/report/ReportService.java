package com.libero.service.report;

import java.util.List;
import java.util.Map;

import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.common.Search;
import com.libero.service.domain.Comment;

public interface ReportService {
	
	public Report getReportByNo(int reportNo) throws Exception;
	
	//public List<Report> getReportById(String userId) throws Exception;
	
	public Map<String, Object> getReportList(Search search) throws Exception;
	
	public void addProdReport(Product product) throws Exception;
	
	public void addPostReport(Post post) throws Exception;
	
	public void updateReport(Report report) throws Exception;
	

	}