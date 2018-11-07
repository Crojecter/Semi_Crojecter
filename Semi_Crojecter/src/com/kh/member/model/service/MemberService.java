package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	private Connection con;
	private MemberDao mDao = new MemberDao();

	public int signUpMember(Member m) {
		
		int result = 0;
		
		con = getConnection();
		
		result = mDao.signUpMember(con, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public Member selectMember(Member m) {

		con = getConnection();
		
		Member result = mDao.selectMember(con, m);
		
		close(con);
		
		if(result != null) commit(con);
		else rollback(con);
		
		return result;

	}

}
