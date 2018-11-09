package com.kh.board.gallery.model.vo;

import java.io.Serializable;

import com.kh.board.common.model.Board;

public class Gallery extends Board implements Serializable {

	private int gid;
	private int gcategoryid;
	private String gtag;
	private int glike;
	private int cclid;
	private String gcategoryname;
	private String cclname;
	
	public Gallery() {
		super();
	}

	public Gallery(int gid, int gcategoryid, String gtag, int glike, int cclid, String gcategoryname, String cclname) {
		super();
		this.gid = gid;
		this.gcategoryid = gcategoryid;
		this.gtag = gtag;
		this.glike = glike;
		this.cclid = cclid;
		this.gcategoryname = gcategoryname;
		this.cclname = cclname;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getGcategoryid() {
		return gcategoryid;
	}

	public void setGcategoryid(int gcategoryid) {
		this.gcategoryid = gcategoryid;
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

	public String getGcategoryname() {
		return gcategoryname;
	}

	public void setGcategoryname(String gcategoryname) {
		this.gcategoryname = gcategoryname;
	}

	public String getCclname() {
		return cclname;
	}

	public void setCclname(String cclname) {
		this.cclname = cclname;
	}

	@Override
	public String toString() {
		return "Gallery [gid=" + gid + ", gcategoryid=" + gcategoryid + ", gtag=" + gtag + ", glike=" + glike
				+ ", cclid=" + cclid + ", gcategoryname=" + gcategoryname + ", cclname=" + cclname + ", getBid()="
				+ getBid() + ", getBtype()=" + getBtype() + ", getBtitle()=" + getBtitle() + ", getBcontent()="
				+ getBcontent() + ", getBcount()=" + getBcount() + ", getBdate()=" + getBdate() + ", getBstatus()="
				+ getBstatus() + ", getBwriter()=" + getBwriter() + ", getBrcount()=" + getBrcount() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
