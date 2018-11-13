package com.yjw.po;

import java.io.Serializable;

public class Reader implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  Integer readerid;  //编号
	private String name; //名字
	private String sex;//性别
	private String phone;//电话
	private String password;//电话
	private String dp;//院系
	private String zcdate;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDp() {
		return dp;
	}
	public void setDp(String dp) {
		this.dp = dp;
	}
	public String getZcdate() {
		return zcdate;
	}
	public void setZcdate(String zcdate) {
		this.zcdate = zcdate;
	}
	public Integer getReaderid() {
		return readerid;
	}
	public void setReaderid(Integer readerid) {
		this.readerid = readerid;
	}
	@Override
	public String toString() {
		return "Reader [readerid=" + readerid + ", name=" + name + ", sex=" + sex + ", phone=" + phone + ", dp=" + dp
				+ ", zcdate=" + zcdate + "]";
	}
	
}
