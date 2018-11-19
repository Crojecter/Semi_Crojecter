package com.kh.report.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.report.model.vo.Report;

public class ReportDao {
	
	private Properties prop = new Properties();
	
	public ReportDao() {
		
		String filePath = ReportDao.class.getResource("/config/report-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReport(Connection con, Report r) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertReport");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, r.getRreason());
			pstmt.setInt(3, r.getMid());
			pstmt.setInt(5, r.getBid());
			
			if(r.getRreason() != 5) pstmt.setNull(2, java.sql.Types.NULL);
			else pstmt.setString(2, r.getRetc());

			if(r.getCid() > 0) pstmt.setInt(4, r.getCid());
			else pstmt.setNull(4, java.sql.Types.NULL);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteReport(Connection con, int rid) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteReport");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rid);
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
