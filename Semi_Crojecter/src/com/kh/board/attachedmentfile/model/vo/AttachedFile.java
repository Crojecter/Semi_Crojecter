package com.kh.board.attachedmentfile.model.vo;

public class AttachedFile {
	
	private int fid;
	private String fname;
	private String fpath;
	private int flevel;
	private int bid;
	
	public AttachedFile() {
		super();
	}

	public AttachedFile(int fid, String fname, String fpath, int flevel, int bid) {
		super();
		this.fid = fid;
		this.fname = fname;
		this.fpath = fpath;
		this.flevel = flevel;
		this.bid = bid;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFpath() {
		return fpath;
	}

	public void setFpath(String fpath) {
		this.fpath = fpath;
	}

	public int getFlevel() {
		return flevel;
	}

	public void setFlevel(int flevel) {
		this.flevel = flevel;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	@Override
	public String toString() {
		return "AttachedFile [fid=" + fid + ", fname=" + fname + ", fpath=" + fpath + ", flevel=" + flevel + ", bid="
				+ bid + "]";
	}


}
