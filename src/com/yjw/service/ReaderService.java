package com.yjw.service;

import java.util.List;

import com.yjw.po.Reader;



public interface ReaderService {
public int createReader(Reader reader);
	List<Reader> list();
	
	// 通过id查询客户
	public Reader getReaderById(Integer id);
	/**
	 * 更新读者
	 * @param reader
	 * @return
	 */
	public int updateReader(Reader reader);
	/**
	 * 删除读者
	 * @param id
	 * @return
	 */
	public int deleteReader(Integer id);
	/**
	 * 搜索读者
	 * @param name
	 * @return
	 */
	
	public List<Reader> searchName(String name);
	public Reader findReader(Integer readerid, String password);
	
	

}
