package com.yjw.service;
import java.util.List;

import com.yjw.po.User;
/**
 * �û�Service��ӿ�
 */
public interface UserService {
	List<User> list();
	// ͨ���˺ź������ѯ�û�
	public User findUser(String usercode,String password);

	int setUser(User user);
	/**
	 * ��ȡid
	 * @param userid
	 * @return
	 */
	public User getID(Integer id);
	
}
