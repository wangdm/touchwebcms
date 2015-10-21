package com.lubocluod.touchwebcms.entity;

public class Channel {
	private int id;
	private int userid;
	private String name;
	private String pushuri;
	private String pulluri;
	
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
}
