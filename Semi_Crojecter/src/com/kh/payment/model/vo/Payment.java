package com.kh.payment.model.vo;

import java.sql.Date;

public class Payment {

	private int pid;
	private int pmoney;
	private Date pdate;
	private int mid;
	
	public Payment() {
		super();
	}

	public Payment(int pid, int pmoney, Date pdate, int mid) {
		super();
		this.pid = pid;
		this.pmoney = pmoney;
		this.pdate = pdate;
		this.mid = mid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getPmoney() {
		return pmoney;
	}

	public void setPmoney(int pmoney) {
		this.pmoney = pmoney;
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

	@Override
	public String toString() {
		return "Payment [pid=" + pid + ", pmoney=" + pmoney + ", pdate=" + pdate + ", mid=" + mid + "]";
	}
	
	
}
