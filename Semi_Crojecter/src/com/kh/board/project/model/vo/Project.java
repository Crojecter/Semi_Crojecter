package com.kh.board.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.board.common.model.vo.Board;

public class Project extends Board implements Serializable {

	private int jid;
	private Date jend;
	private String jtag;
	
	
	public Project() {
		super();
	}

	public Project(int jid, Date jend,  String jtag) {
		super();
		this.jid = jid;
		this.jend = jend;
		this.jtag = jtag;		
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

	@Override
	public String toString() {
		return "Project [getJid()=" + getJid() + ", getJend()=" + getJend() + ", getJtag()=" + getJtag() + ", getBid()="
				+ getBid() + ", getBtype()=" + getBtype() + ", getBtitle()=" + getBtitle() + ", getBcontent()="
				+ getBcontent() + ", getBcount()=" + getBcount() + ", getBdate()=" + getBdate() + ", getBstatus()="
				+ getBstatus() + ", getBwriter()=" + getBwriter() + ", getBrcount()=" + getBrcount()
				+ ", getMprofile()=" + getMprofile() + ", getMname()=" + getMname() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
}
