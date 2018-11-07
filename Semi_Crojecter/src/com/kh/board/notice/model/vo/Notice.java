package com.kh.board.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.board.common.model.Board;

public class Notice extends Board implements Serializable {

	public Notice() {
		super();
	}

	public Notice(int bid, int btype, String btitle, String bcontent, int bcount, Date bdate, String bstatus,
			int bwriter, int brcount) {
		super(bid, btype, btitle, bcontent, bcount, bdate, bstatus, bwriter, brcount);
	}
		
}
