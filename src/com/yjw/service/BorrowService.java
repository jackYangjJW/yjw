package com.yjw.service;

import java.util.List;

import com.yjw.po.Borrow;

public interface BorrowService {
	List<Borrow> list();
	
	public List<Borrow> searchBorrow(Borrow borrow);
	public List<Borrow> borrowReader(String readername);
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
int delectBorrow(Integer id);
/**
 * 通过name获取
 * @param name
 * @return
 */
Borrow getReaderByName(String name);
/**
 * 通过id获得
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
}
