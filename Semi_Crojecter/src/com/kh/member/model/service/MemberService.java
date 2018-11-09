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
				
		if(result != null) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;

	}

	public int selectEmail(Member m) {
		
		int result = 0;
		
		con = getConnection();
		
		result = mDao.selectEmail(con, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateRandomPwd(String tempPassword, Member m) {
		
		int result = 0;
		
		con = getConnection();
		
		result = mDao.updateRandomPwd(con, tempPassword, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateMember(Member m) {
		
		int result = 0;
		
		con = getConnection();
		
		result = mDao.updateMember(con, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
		
	}

	public int deleteMember(String memail) {
		int result = 0;
		
		con = getConnection();
		
		result = mDao.deleteMember(con, memail);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		return result;
		
	}

}
