package com.model.vo;
/**
 * 前台对象:注册
 * @author Administrator
 *
 */
public class V_RegInf {
	private String username;
	private String password;
	private int usertype;
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
