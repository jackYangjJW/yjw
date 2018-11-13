package com.yjw.service;

import java.util.List;

import com.yjw.po.Book;

public interface BookService {
	/**
	 * 通过id获得信息
	 * @return
	 */
	public List<Book> list();
	/**
	 * 创建图书
	 * @param book
	 * @return
	 */
	public int createBook(Book book);
	/**
	 * 修改
	 * @param book
	 * @return
	 */
	public int updateBook(Book book);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int deleteBook(Integer id);
	/**
	 * 通过id获得书籍信息
	 * @param id
	 * @return
	 */
	public Book getBookById(Integer id);
	/**
	 * 多条件查询
	 * @param book
	 * @return
	 */
	
	public List<Book> search(String bookname, String bookclass);
}
