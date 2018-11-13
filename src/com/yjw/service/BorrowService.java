package com.yjw.service;

import java.util.List;

import com.yjw.po.Borrow;

public interface BorrowService {
	List<Borrow> list();
	
	public List<Borrow> searchBorrow(Borrow borrow);
	public List<Borrow> borrowReader(String readername);
/**
 * ����
 * @param borrow
 * @return
 */
	int createBorrow(Borrow borrow);
/**
 * ɾ��
 * @param id
 * @return 
 */
int delectBorrow(Integer id);
/**
 * ͨ��name��ȡ
 * @param name
 * @return
 */
Borrow getReaderByName(String name);
/**
 * ͨ��id���
 * @param id
 * @return
 */
Borrow getReaderByID(Integer id);

/**
 * ����
 * @param borrow
 * @return
 */
int updateBorrow(Borrow borrow);
}
