package com.kh.follow.model.vo;

import java.io.Serializable;

public class Follow implements Serializable {
	
	private int fid;
	private int followerid;
	private int followid;
	
	public Follow() {
		super();
	}
	
	public Follow(int fid, int followerid, int followid) {
		super();
		this.fid = fid;
		this.followerid = followerid;
		this.followid = followid;
	}
	
	public int getFid() {
		return fid;
	}
	
	public void setFid(int fid) {
		this.fid = fid;
	}
	
	public int getFollowerid() {
		return followerid;
	}
	
	public void setFollowerid(int followerid) {
		this.followerid = followerid;
	}
	
	public int getFollowid() {
		return followid;
	}
	
	public void setFollowid(int followid) {
		this.followid = followid;
	}
	
	@Override
	public String toString() {
		return "Follow [fid=" + fid + ", followerid=" + followerid + ", followid=" + followid + "]";
	}
	
}
