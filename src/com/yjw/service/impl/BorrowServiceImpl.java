package com.yjw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yjw.dao.BorrowDao;
import com.yjw.po.Borrow;
import com.yjw.service.BorrowService;

@Service("borrowService")
@Transactional
public class BorrowServiceImpl implements BorrowService{


	@Autowired
	BorrowDao borrowDao;
	@Override
	public List<Borrow> list() {
		// TODO Auto-generated method stub
		
		return borrowDao.list();
	}
	@Override
	public List<Borrow> searchBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		return borrowDao.searchBorrow(borrow);
	}
	/**
	 * 创建
	 */
	@Override
	public int createBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		return borrowDao.createBorrow(borrow);
		
	}
	/**
	 * 删除
	 */
	@Override
	public int delectBorrow(Integer id) {
		// TODO Auto-generated method stub
		return borrowDao.deleteBorrow(id);
	}
	/**
	 * 通过name获取
	 */
	@Override
	public Borrow getReaderByName(String name) {
		// TODO Auto-generated method stub
		Borrow borrow=borrowDao.getReaderByName(name);
		return borrow;
	}
	@Override
	public Borrow getReaderByID(Integer id) {
		// TODO Auto-generated method stub
		Borrow borrow=borrowDao.getReaderByID(id);
		return borrow;	}
	/**
	 * 更新
	 */
	@Override
	public int updateBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		return borrowDao.updateBorrow(borrow);
	}
	@Override
	public List<Borrow> borrowReader(String readername) {
		// TODO Auto-generated method stub
		 return borrowDao.borrowReader(readername);
	}

}
