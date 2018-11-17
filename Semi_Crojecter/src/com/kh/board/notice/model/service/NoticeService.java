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


}
