package com.lubocluod.touchwebcms.entity;

import java.sql.Timestamp;

public class Channel {
	private int id;
	private int userid;
	private String name;
	private String pushuri;
	private String pulluri;
	private Timestamp createtime;
	private int status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPushuri() {
		return pushuri;
	}
	public void setPushuri(String pushuri) {
		this.pushuri = pushuri;
	}
	public String getPulluri() {
		return pulluri;
	}
	public void setPulluri(String pulluri) {
		this.pulluri = pulluri;
	}
    public Timestamp getCreatetime() {
        return createtime;
    }
    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
}
