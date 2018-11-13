package com.yjw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjw.po.Borrow;

public interface BorrowDao {
	List<Borrow> list();
	/**
	 * ��������ѯ
	 * @param book
	 * @return
	 */
	public List<Borrow> searchBorrow(Borrow borrow);
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
	int deleteBorrow(Integer id);
	/**
	 * ͨ��name��ȡ����
	 * @param string
	 * @return
	 */
	Borrow getReaderByName(String name);
	/**
	 * ͨ��ID���
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
	/**
	 * ��ö��߽���
	 * @param id
	 * @return
	 */
	List<Borrow> borrowReader(@Param("readername")String readername);
}
