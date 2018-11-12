package com.kh.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	
	private int rid;
	private int rreason;
	private String retc;
	private Date rdate;
	private int mid;
	private int cid;
	private int bid;

	public Report() {
		super();
	}

	public Report(int rid, int rreason, String retc, Date rdate, int mid, int cid, int bid) {
		super();
		this.rid = rid;
		this.rreason = rreason;
		this.retc = retc;
		this.rdate = rdate;
		this.mid = mid;
		this.cid = cid;
		this.bid = bid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getRreason() {
		return rreason;
	}

	public void setRreason(int rreason) {
		this.rreason = rreason;
	}

	public String getRetc() {
		return retc;
	}

	public void setRetc(String retc) {
		this.retc = retc;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	@Override
	public String toString() {
		return "Report [rid=" + rid + ", rreason=" + rreason + ", retc=" + retc + ", rdate=" + rdate + ", mid=" + mid
				+ ", cid=" + cid + ", bid=" + bid + "]";
	}
	
	
}
