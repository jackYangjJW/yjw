package com.yjw.service;
import java.util.List;

import com.yjw.po.User;
/**
 * 用户Service层接口
 */
public interface UserService {
	List<User> list();
	// 通过账号和密码查询用户
	public User findUser(String usercode,String password);

	int setUser(User user);
	/**
	 * 获取id
	 * @param userid
	 * @return
	 */
	public User getID(Integer id);
	
}
