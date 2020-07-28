package com.libero.service.report.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.common.Search;
import com.libero.service.community.CommunityDAO;
import com.libero.service.community.CommunityService;
import com.libero.service.domain.Comment;
import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.service.report.ReportDAO;
import com.libero.service.report.ReportService;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService{
	
	///Field	
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;
	
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}
	
	///Constructor
	public ReportServiceImpl() {
		System.out.println(this.getClass());
	}
	
	public Report getReportByNo(int reportNo) throws Exception{
		return reportDAO.getReportByNo(reportNo);
	}
	
	//public List<Report> getReportById(String userId) throws Exception {
	//	return reportDAO.getReportById(userId);
	//}

	public void addProdReport(Product product) throws Exception {
		reportDAO.addProdReport(product);
	}
	
	public void addPostReport(Post post) throws Exception {
		reportDAO.addPostReport(post);
	}

	public void updateReport(Report report) throws Exception {
		reportDAO.updateReport(report);
	}
	
	public Map<String, Object> getReportList(Search search) throws Exception {
		List<Report> list = reportDAO.getReportList(search);
		int totalCount = reportDAO.getReportTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;		
	}
	
	

}