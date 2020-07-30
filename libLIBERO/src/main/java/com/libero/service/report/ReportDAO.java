package com.libero.service.report;

import java.util.List;

import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.common.Search;
import com.libero.service.domain.Comment;

public interface ReportDAO {
	
	//public Report getReportByNo(int reportNo) throws Exception;
	
	//public List<Report> getReportById(String userId) throws Exception;
	
	public List<Report> getPostReportList(Search search) throws Exception;
	
	//public void addProdReport(Product product) throws Exception;
	
	public void addPostReport(Report report) throws Exception;
	
	//public void updatePostReport(Report report) throws Exception;
	
	
	// DAO에만 있음
	public int getPostReportTotalCount(Search search) throws Exception;
}
