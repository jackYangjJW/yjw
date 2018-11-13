package com.yjw.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yjw.dao.UserDao;
import com.yjw.po.User;
import com.yjw.service.UserService;
/**
 * �û�Service�ӿ�ʵ����
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// ע��UserDao
	@Autowired
	private UserDao userDao;
	// ͨ���˺ź������ѯ�û�
	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}
	
	@Override
	public int setUser(User user) {
		
		return userDao.setUser(user);
	}
/**
 * 
 */
	@Override
	public User getID(Integer id) {
			// TODO Auto-generated method stub
			User user=userDao.getID(id);
			return user;
		}

@Override
public List<User> list() {
	// TODO Auto-generated method stub
	return userDao.list();
}
	}


