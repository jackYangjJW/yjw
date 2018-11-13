package com.yjw.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjw.po.Reader;


public interface ReaderDao {
	List<Reader> list();
	
	// 创建客户
	public int createReader(Reader reader);
	// 通过id查询客户
	public Reader getReaderById(Integer id);
	// 更新客户信息
	public int updateReader(Reader reader);
	// 删除客户
	int deleteReader (Integer id);
	/**
	 * 以名字查询读者
	 */
	List<Reader> searchName(String name);
	/**
	 * 分页
	 * @return
	 */
	//登录
	Reader findReader(@Param("readerid")Integer readerid, @Param("password")String password);
	 
}
