package com.yjw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yjw.po.Book;

public interface BookDao {
	/**
	 * ���ID
	 * @return
	 */
	public List<Book> list();
	/**
	 * ����ͼ��
	 * @param book
	 * @return
	 */
	public int createBook(Book book);
	/**
	 * �޸��鼮
	 * @param book
	 * @return
	 */
	public int updateBook(Book book);
	/**
	 * ɾ��
	 * @param id
	 * @return
	 */
	public int deleteBook(Integer id);
	
	/**
	 * ͨ��id����鼮��Ϣ
	 * @param id
	 * @return
	 */
	public Book getBookById(Integer id);
	/**
	 * ��������ѯ
	 * @param book
	 * @return
	 */
	public List<Book> search(@Param("bookname")String bookname, @Param("bookclass")String bookclass);
}
