package com.yjw.service;

import java.util.List;

import com.yjw.po.Reader;



public interface ReaderService {
public int createReader(Reader reader);
	List<Reader> list();
	
	// ͨ��id��ѯ�ͻ�
	public Reader getReaderById(Integer id);
	/**
	 * ���¶���
	 * @param reader
	 * @return
	 */
	public int updateReader(Reader reader);
	/**
	 * ɾ������
	 * @param id
	 * @return
	 */
	public int deleteReader(Integer id);
	/**
	 * ��������
	 * @param name
	 * @return
	 */
	
	public List<Reader> searchName(String name);
	public Reader findReader(Integer readerid, String password);
	
	

}
