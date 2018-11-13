package com.yjw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjw.po.Book;

public interface BookDao {
	/**
	 * 获得ID
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
	 * 修改书籍
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
	public List<Book> search(@Param("bookname")String bookname, @Param("bookclass")String bookclass);
}
