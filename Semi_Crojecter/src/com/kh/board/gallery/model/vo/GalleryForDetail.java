package com.kh.board.gallery.model.vo;

import java.sql.Date;

public class GalleryForDetail {

	private int bid;
	private int gid;
	private String btitle;
	private String bcontent;
	private String mprofile;
	private String mname;
	private String gcategory;
	private String cclname;
	private String gtag;
	private int bcount;
	private Date bdate;
	
	public GalleryForDetail() {}
	
	public GalleryForDetail(int bid, int gid, String btitle, String bcontent, String mname, String gcategory, String gtag, int bcount,
			Date bdate) {
		super();
		this.bid = bid;
		this.gid = gid;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mname = mname;
		this.gcategory = gcategory;
		this.gtag = gtag;
		this.bcount = bcount;
		this.bdate = bdate;
	}

	public GalleryForDetail(int bid, int gid, String btitle, String bcontent, String mprofile, String mname,
			String gcategory, String cclname, String gtag, int bcount, Date bdate) {
		super();
		this.bid = bid;
		this.gid = gid;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.mprofile = mprofile;
		this.mname = mname;
		this.gcategory = gcategory;
		this.cclname = cclname;
		this.gtag = gtag;
		this.bcount = bcount;
		this.bdate = bdate;
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

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
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

	public String getGtag() {
		return gtag;
	}

	public void setGtag(String gtag) {
		this.gtag = gtag;
	}
	
	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	@Override
	public String toString() {
		return "GalleryForDetail [bid=" + bid + ", gid=" + gid + ", btitle=" + btitle + ", bcontent=" + bcontent
				+ ", mprofile=" + mprofile + ", mname=" + mname + ", gcategory=" + gcategory + ", cclname=" + cclname
				+ ", gtag=" + gtag + ", bcount=" + bcount + ", bdate=" + bdate + "]";
	}

}
