package com.yjw.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjw.po.Reader;


public interface ReaderDao {
	List<Reader> list();
	
	// �����ͻ�
	public int createReader(Reader reader);
	// ͨ��id��ѯ�ͻ�
	public Reader getReaderById(Integer id);
	// ���¿ͻ���Ϣ
	public int updateReader(Reader reader);
	// ɾ���ͻ�
	int deleteReader (Integer id);
	/**
	 * �����ֲ�ѯ����
	 */
	List<Reader> searchName(String name);
	/**
	 * ��ҳ
	 * @return
	 */
	//��¼
	Reader findReader(@Param("readerid")Integer readerid, @Param("password")String password);
	 
}
