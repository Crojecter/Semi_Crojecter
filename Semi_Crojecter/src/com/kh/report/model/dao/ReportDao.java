package com.kh.report.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.report.model.vo.Report;

public class ReportDao {
	
private Properties prop = null;
	
	public ReportDao(){
		prop = new Properties();
		
		String filePath = ReportDao.class
				.getResource("/config/admin-query.properties").getPath();
		
		try {
			
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {

			e.printStackTrace();
		}

}
	
	public ArrayList<Report> selectList(Connection con) {
		
		ArrayList<Report> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReport");
		System.out.println("sql : " + sql);
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Report>();
			
			while(rset.next()){
				Report r = new Report();
				
				r.setRdate(rset.getDate("rdate"));
				
				if(rset.getInt("rreason")==5) {
					r.setRetc(rset.getString("retc"));
				} else {
					r.setRetc(rset.getString("rcontent"));
				}
				
				r.setMname(rset.getString("mname"));
				r.setCwriter(rset.getString("cwriter"));
				r.setBid(rset.getInt("bid"));
				r.setCid(rset.getInt("cid"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(stmt);
		}
		
		return list;
	}

}
