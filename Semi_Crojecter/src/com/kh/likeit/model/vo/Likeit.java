package com.kh.likeit.model.vo;

import java.io.Serializable;

public class Likeit implements Serializable {
	
	private int mid;
	private int bid;
	
	public Likeit() {
		super();
	}

	public Likeit(int mid, int bid) {
		super();
		this.mid = mid;
		this.bid = bid;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	@Override
	public String toString() {
		return "Likeit [mid=" + mid + ", bid=" + bid + "]";
	}
	
}