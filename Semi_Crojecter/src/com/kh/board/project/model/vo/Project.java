package com.kh.board.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.board.common.model.vo.Board;

public class Project extends Board implements Serializable {

	private int jid;
	private Date jend;
	private String jtag;
	private int dday;

	// 파일경로 조회용 코드
	private String fname;
	
	public String getFname() {
		return fname;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}
	//
	
	public Project() {
		super();
	}

	public Project(int jid, Date jend,  String jtag, int dday) {
		super();
		this.jid = jid;
		this.jend = jend;
		this.jtag = jtag;	
		this.dday = dday;			
	}

	public int getJid() {
		return jid;
	}

	public void setJid(int jid) {
		this.jid = jid;
	}

	public Date getJend() {
		return jend;
	}

	public void setJend(Date jend) {
		this.jend = jend;
	}
	
	public String getJtag() {
		return jtag;
	}

	public void setJtag(String jtag) {
		this.jtag = jtag;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}


	@Override
	public String toString() {
		return "Project [jid=" + jid + ", jend=" + jend + ", jtag=" + jtag + ", dday=" + dday + ", getBid()=" + getBid()
				+ ", getBtype()=" + getBtype() + ", getBtitle()=" + getBtitle() + ", getBcontent()=" + getBcontent()
				+ ", getBcount()=" + getBcount() + ", getBdate()=" + getBdate() + ", getBstatus()=" + getBstatus()
				+ ", getBwriter()=" + getBwriter() + ", getBrcount()=" + getBrcount() + ", getMprofile()="
				+ getMprofile() + ", getMname()=" + getMname() + ", toString()=" + super.toString() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + "]";
	}

}
