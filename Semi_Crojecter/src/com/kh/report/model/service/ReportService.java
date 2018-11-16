package com.kh.report.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.report.model.dao.ReportDao;
import com.kh.report.model.vo.Report;

public class ReportService {

	private ReportDao rDao = new ReportDao();
	public ArrayList<Report> selectlist() {
		ArrayList<Report> list = null;
		Connection con = getConnection();
		
		list = rDao.selectList(con);
		
		close(con);
		
		return list;
	}

}
