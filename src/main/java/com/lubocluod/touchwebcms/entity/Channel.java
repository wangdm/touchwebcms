package com.lubocluod.touchwebcms.entity;

public class Channel {
	private String name;
	private String pushuri;
	private String pulluri;
	
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
