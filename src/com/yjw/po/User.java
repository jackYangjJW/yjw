package com.yjw.po;
import java.io.Serializable;
/**
 * �û��־û���
 */
public class User implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer userid;      //�û�id 
	private String usercode;     //�û��˺�
	private String username;     //�û�����
	private String password; //�û�����
	private String phone; //�ֻ�
	private String  email; //�û�����
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
