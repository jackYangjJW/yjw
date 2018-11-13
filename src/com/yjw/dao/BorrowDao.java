package com.yjw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjw.po.Borrow;

public interface BorrowDao {
	List<Borrow> list();
	/**
	 * 多条件查询
	 * @param book
	 * @return
	 */
	public List<Borrow> searchBorrow(Borrow borrow);
	/**
	 * 创建
	 * @param borrow
	 * @return
	 */
	int createBorrow(Borrow borrow);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	int deleteBorrow(Integer id);
	/**
	 * 通过name获取借阅
	 * @param string
	 * @return
	 */
	Borrow getReaderByName(String name);
	/**
	 * 通过ID获得
	 * @param id
	 * @return
	 */
	Borrow getReaderByID(Integer id);
	/**
	 * 更新
	 * @param borrow
	 * @return
	 */
	int updateBorrow(Borrow borrow);
	/**
	 * 获得读者借阅
	 * @param id
	 * @return
	 */
	List<Borrow> borrowReader(@Param("readername")String readername);
}
