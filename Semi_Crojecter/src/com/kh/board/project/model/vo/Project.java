package com.kh.board.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.kh.board.common.model.Board;

public class Project extends Board implements Serializable {

	private int jid;
	private Date jend;
	
	
	public Project() {
		super();
	}

	public Project(int jid, Date jend) {
		super();
		this.jid = jid;
		this.jend = jend;
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

	@Override
	public String toString() {
		return "Project [jid=" + jid + ", jend=" + jend + ", getBid()=" + getBid() + ", getBtype()=" + getBtype()
				+ ", getBtitle()=" + getBtitle() + ", getBcontent()=" + getBcontent() + ", getBcount()=" + getBcount()
				+ ", getBdate()=" + getBdate() + ", getBstatus()=" + getBstatus() + ", getBwriter()=" + getBwriter()
				+ ", getBrcount()=" + getBrcount() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}
	
}
