package com.yjw.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.yjw.po.User;
/**
 * �û�DAO��ӿ�
 */
public interface UserDao {
	List<User> list();
	/**
	 * ͨ���˺ź������ѯ�û�
	 */
	public User findUser(@Param("usercode") String usercode, @Param("password") String password);
	/**
	 * �޸Ĺ�����Ϣ
	 * @param user
	 * @return
	 */
	public int setUser(User user);
	/**
	 * ��ȡId
	 * @param userid
	 * @return
	 */
	public User getID(Integer id);
}
