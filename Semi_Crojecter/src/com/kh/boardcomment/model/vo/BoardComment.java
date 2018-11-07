package com.kh.boardcomment.model.vo;

import java.sql.Date;

public class BoardComment {
	
	private int cid;
	private String ccontent;
	private Date cdate;
	private String cstatus;
	private int bid;
	private int cwriter;
	private int crcount;
	
	public BoardComment() {}
	
	public BoardComment(int cid, String ccontent, Date cdate, String cstatus, int bid, int cwriter, int crcount) {
		super();
		this.cid = cid;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.cstatus = cstatus;
		this.bid = bid;
		this.cwriter = cwriter;
		this.crcount = crcount;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getCstatus() {
		return cstatus;
	}

	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getCwriter() {
		return cwriter;
	}

	public void setCwriter(int cwriter) {
		this.cwriter = cwriter;
	}

	public int getCrcount() {
		return crcount;
	}

	public void setCrcount(int crcount) {
		this.crcount = crcount;
	}

	@Override
	public String toString() {
		return "BoardComment [cid=" + cid + ", ccontent=" + ccontent + ", cdate=" + cdate + ", cstatus=" + cstatus
				+ ", bid=" + bid + ", cwriter=" + cwriter + ", crcount=" + crcount + "]";
	}
	
}
