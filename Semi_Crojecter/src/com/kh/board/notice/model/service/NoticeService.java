package com.kh.board.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.notice.model.dao.NoticeDao;
import com.kh.board.notice.model.vo.Notice;
import com.kh.board.project.model.vo.Project;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();

	public int insertNotice(Notice n) {
		Connection con = getConnection();
		
		int result = 0;
		
		System.out.println("n : " + n);
		
		int bid = nDao.selectCurrentBid(con);
		
		int result1 = nDao.insertBoardContent(con, n, bid);
		
		
		if( result1 > 0) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result*bid;
	}

	public Notice selectOne(int bid) {
		
		Connection con = getConnection();
		
		Notice n = nDao.selectOne(con, bid);
		
		close(con);
		
		return n;
	}

	public int updateNotice(Notice n) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = nDao.updateBoard(con, n);
		
		if( result1 > 0 ) {
			commit(con);
			result = 1;
			
		} else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Notice> selectNoticeList() {
		// 
		Connection con = getConnection();
		ArrayList<Notice> noticeList = null;
		
		noticeList = nDao.selectNoticeList(con);
		
		close(con);
		
		return noticeList;
	}

	public Notice noticeSelectOne(int bid) {
		// TODO Auto-generated method stub
		Connection con = getConnection();

		System.out.println("ns bid : "+ bid);
		int result = 0;
		
		Notice n = nDao.noticeSelectOne(con, bid);
		if(n != null){
			result = nDao.noticeUptdateCount(con, bid);

			if(result > 0) commit(con);
			else rollback(con);
		}
		close(con);
		return n;
	}

}
