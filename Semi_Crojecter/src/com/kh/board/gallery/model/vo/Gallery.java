package com.kh.board.gallery.model.vo;

import java.io.Serializable;

import com.kh.board.common.model.Board;

public class Gallery extends Board implements Serializable {

	private int gid;
	private int gcategory;
	private String gtag;
	private int glike;
	private int cclid;
	
	public Gallery() {
		super();
	}
	
	public Gallery(int gid, int gcategory, String gtag, int glike, int cclid) {
		super();
		this.gid = gid;
		this.gcategory = gcategory;
		this.gtag = gtag;
		this.glike = glike;
		this.cclid = cclid;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getGcategory() {
		return gcategory;
	}

	public void setGcategory(int gcategory) {
		this.gcategory = gcategory;
	}

	public String getGtag() {
		return gtag;
	}

	public void setGtag(String gtag) {
		this.gtag = gtag;
	}

	public int getGlike() {
		return glike;
	}

	public void setGlike(int glike) {
		this.glike = glike;
	}

	public int getCclid() {
		return cclid;
	}

	public void setCclid(int cclid) {
		this.cclid = cclid;
	}

	@Override
	public String toString() {
		return "Gallery [gid=" + gid + ", gcategory=" + gcategory + ", gtag=" + gtag + ", glike=" + glike + ", cclid="
				+ cclid + ", getBid()=" + getBid() + ", getBtype()=" + getBtype() + ", getBtitle()=" + getBtitle()
				+ ", getBcontent()=" + getBcontent() + ", getBcount()=" + getBcount() + ", getBdate()=" + getBdate()
				+ ", getBstatus()=" + getBstatus() + ", getBwriter()=" + getBwriter() + ", getBrcount()=" + getBrcount()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}	
	
}
