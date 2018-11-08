package com.kh.board.gallery.model.vo;

public class GalleryForDetail {

	private int bid;
	private int gid;
	private String mprofile;
	private String mname;
	private String gcategory;
	private String cclname;
	
	public GalleryForDetail() {}
	
	public GalleryForDetail(int bid, int gid, String mprofile, String mname, String gcategory, String cclname) {
		super();
		this.bid = bid;
		this.gid = gid;
		this.mprofile = mprofile;
		this.mname = mname;
		this.gcategory = gcategory;
		this.cclname = cclname;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getGid() {
		return gid;
	}

	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getMprofile() {
		return mprofile;
	}

	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getGcategory() {
		return gcategory;
	}

	public void setGcategory(String gcategory) {
		this.gcategory = gcategory;
	}

	public String getCclname() {
		return cclname;
	}

	public void setCclname(String cclname) {
		this.cclname = cclname;
	}

	@Override
	public String toString() {
		return "GalleryForDetail [bid=" + bid + ", gid=" + gid + ", mprofile=" + mprofile + ", mname=" + mname
				+ ", gcategory=" + gcategory + ", cclname=" + cclname + "]";
	}

}
