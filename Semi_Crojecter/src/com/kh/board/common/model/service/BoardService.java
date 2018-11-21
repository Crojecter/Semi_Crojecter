package com.kh.board.common.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.common.model.dao.BoardDao;
import com.kh.board.common.model.vo.Board;

public class BoardService {

	private BoardDao bDao = new BoardDao();
	
	public ArrayList<Board> searchAll(String keyword) {
		
		Connection con = getConnection();

		ArrayList<Board> bList = bDao.searchAll(con, keyword);
		
		close(con);
		
		return bList;
	}

	public String searchLikeIt(int bid, int btype) {

		Connection con = getConnection();
		
		String result = bDao.searchLikeIt(con, bid, btype);
		
		return result;
	}

}
