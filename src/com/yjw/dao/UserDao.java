package com.yjw.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.yjw.po.User;
/**
 * 用户DAO层接口
 */
public interface UserDao {
	List<User> list();
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("usercode") String usercode, @Param("password") String password);
	/**
	 * 修改管理信息
	 * @param user
	 * @return
	 */
	public int setUser(User user);
	/**
	 * 获取Id
	 * @param userid
	 * @return
	 */
	public User getID(Integer id);
}
