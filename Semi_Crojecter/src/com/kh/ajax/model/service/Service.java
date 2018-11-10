package com.kh.ajax.model.service;

import java.sql.Connection;

import com.kh.ajax.model.dao.Dao;
import com.kh.member.model.vo.Member;
import com.kh.payment.model.vo.Payment;

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

	public String searchNickName(String email) {

		String result = null;
		
		con = getConnection();
		
		result = dao.searchNickName(con, email);
		
		if(result != null) commit(con);
		else rollback(con);
		
		return result;
		
	}

	public int insertHodu(Member m, Payment p) {
		
		int result = 0;
		
		con = getConnection();
		
		result = dao.insertHodu(con, m, p);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
		
	}

}
