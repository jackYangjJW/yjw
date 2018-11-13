package com.yjw.po;
import java.io.Serializable;
/**
 * 用户持久化类
 */
public class User implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userid;      //用户id 
	private String usercode;     //用户账号
	private String username;     //用户名称
	private String password; //用户密码
	private String phone; //手机
	private String  email; //用户邮箱
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
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
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", usercode=" + usercode + ", username=" + username + ", password=" + password
				+ ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
}
