package com.libero.service.report.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.service.report.ReportDAO;

@Repository("reportDAOImpl")
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void SqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ReportDAOImpl() {
		System.out.println(this.getClass());
	}


	/*
	public Report getReportByNo(int reportNo) throws Exception{
		return sqlSession.selectOne("ReportMapper.getReport", reportNo);
	}
	
	public List<Report> getReportById(String userId) throws Exception{
		return sqlSession.selectList("ReportMapper.getReportById", userId);
	}
	
	public void addProdReport(Product product) throws Exception{
		sqlSession.insert("ReportMapper.addProdReport", product);
	}
	
	public void updatePostReport(Report report) throws Exception{
		sqlSession.update("ReportMapper.updatePostReport", report);
	}
	
	*/
	public List<Report> getPostReportList(Search search) throws Exception{
		return sqlSession.selectList("ReportMapper.getPostReportList", search);
	}
	
	
	public void addPostReport(Report report) throws Exception{
		sqlSession.insert("ReportMapper.addPostReport", report);
	}
	
	
	
	
	// DAO에만 있음
	public int getPostReportTotalCount(Search search) throws Exception{
		return sqlSession.selectOne("ReportMapper.getPostReportTotalCount", search);
	}
	
	
	

}
