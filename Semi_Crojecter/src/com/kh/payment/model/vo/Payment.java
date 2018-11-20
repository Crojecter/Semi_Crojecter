package com.kh.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable{

	private int pid;
	private int pmoneyid;
	private Date pdate;
	private int mid;
	private String mname;
	private String memail;
	private int pmoney;
	private int phodu;
	
	public Payment() {
		super();
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getPmoneyid() {
		return pmoneyid;
	}

	public void setPmoneyid(int pmoneyid) {
		this.pmoneyid = pmoneyid;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public int getPmoney() {
		return pmoney;
	}

	public void setPmoney(int pmoney) {
		this.pmoney = pmoney;
	}

	public int getPhodu() {
		return phodu;
	}

	public void setPhodu(int phodu) {
		this.phodu = phodu;
	}

	@Override
	public String toString() {
		return "Payment [pid=" + pid + ", pmoneyid=" + pmoneyid + ", pdate=" + pdate + ", mid=" + mid + ", mname="
				+ mname + ", memail=" + memail + ", pmoney=" + pmoney + ", phodu=" + phodu + "]";
	}

}
