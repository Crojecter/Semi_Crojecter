package com.kh.follow.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.follow.model.dao.FollowDao;

public class FollowService {

	FollowDao fDao = new FollowDao();
	
	public int checkFollow(String wid, String mid) {
		
		Connection con = getConnection();
		
		int result = fDao.checkFollow(con, wid, mid);
		
		close(con);
		
		return result;
	}

}
