package com.kh.report.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.report.model.dao.ReportDao;
import com.kh.report.model.vo.Report;

public class ReportService {

	ReportDao rDao = new ReportDao();

	public int insertBoard(Report r) {
		Connection con = getConnection();

		int result = rDao.insertReport(con, r);

		if (result > 0) commit(con);
		else rollback(con);

		close(con);

		return result;
	}

	public int deleteBoard(int rid) {
		Connection con = getConnection();

		int result = rDao.deleteReport(con, rid);

		if (result > 0) commit(con);
		else rollback(con);

		close(con);

		return result;
	}

}
