package com.kh.spon.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.spon.model.dao.SponDao;
import com.kh.spon.model.vo.Spon;

import static com.kh.common.JDBCTemplate.*;


public class SponService {
	
	private SponDao sDao = new SponDao();
	
	public ArrayList<Spon> selectlist() {
		
		ArrayList<Spon> list = null;
		Connection con = getConnection();
		
		list = sDao.selectList(con);
		
		close(con);
		
		return list;

	}


}
