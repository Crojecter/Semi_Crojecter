package com.kh.ajax.model.service;

import java.sql.Connection;

import com.kh.ajax.model.dao.Dao;

import static com.kh.common.JDBCTemplate.*;

public class Service {

	private Connection con = null;
	private Dao dao = new Dao();
	
	public int checkNickName(String nickName) {
		
		int result = 0;
		
		con = getConnection();
		
		result = dao.checkNickName(con, nickName);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int checkEmail(String email) {

		int result = 0;
		
		con = getConnection();
		
		result = dao.checkEmail(con, email);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

}
