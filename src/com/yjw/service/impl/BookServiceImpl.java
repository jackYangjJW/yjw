package com.yjw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yjw.dao.BookDao;
import com.yjw.po.Book;
import com.yjw.service.BookService;
@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService{
	
	@Autowired
	private BookDao bookDao;
	
	/**
	 * ͨ��id�����Ϣ
	 */
	
	@Override
	public List<Book> list() {
		// TODO Auto-generated method stub
		return bookDao.list();
	}
	/**
	 * ����ͼ��
	 */
	@Override
	public int createBook(Book book) {
		// TODO Auto-generated method stub
		
		return bookDao.createBook(book);
	}
	/**
	 * �޸�
	 */
	@Override
	public int updateBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.updateBook(book);
	}
	/**
	 * ɾ��
	 */
	@Override
	public int deleteBook(Integer id) {
		// TODO Auto-generated method stub
		return  bookDao.deleteBook(id);
	}
	@Override
	public Book getBookById(Integer id) {
		// TODO Auto-generated method stub
		Book book=bookDao.getBookById(id);
		return book;
	}
	/**
	 * ����
	 */
	@Override
	public List<Book> search(String bookname,String bookclass) {
		// TODO Auto-generated method stub
		return bookDao.search(bookname,bookclass);
	}

}
