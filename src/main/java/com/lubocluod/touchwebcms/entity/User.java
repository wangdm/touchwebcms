package com.lubocluod.touchwebcms.entity;

public class User {
	private String username;
	private String passwd;
	private int roletype;
	private String fullname;
	private String email;
	private String phone;
	
	public String getUsername() {
		return username;
	}
	public String getPasswd() {
		return passwd;
	}
	public int getRoletype() {
		return roletype;
	}
	public String getFullname() {
		return fullname;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRoletype(int roletype) {
		this.roletype = roletype;
	}
}
