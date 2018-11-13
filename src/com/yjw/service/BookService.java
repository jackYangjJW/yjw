package com.yjw.service;

import java.util.List;

import com.yjw.po.Book;

public interface BookService {
	/**
	 * ͨ��id�����Ϣ
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
	 * �޸�
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
	
	public List<Book> search(String bookname, String bookclass);
}
