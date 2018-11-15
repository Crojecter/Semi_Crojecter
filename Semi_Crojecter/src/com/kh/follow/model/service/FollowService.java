package com.kh.follow.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

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

	public int switchFollow(String wid, String mid) {
		
		Connection con = getConnection();
		
		int result = 0;
		
		if(fDao.checkFollow(con, wid, mid) > 0) {
			result = fDao.deleteFollow(con, wid, mid) * 1;
		} else {
			result = fDao.insertFollow(con, wid, mid) * 2;
		}
		
		if(result > 0) commit(con);
		else rollback(con);
			
		
		close(con);
		
		return result;

	}

}
