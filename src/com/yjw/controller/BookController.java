package com.yjw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjw.po.Book;
import com.yjw.po.You;
import com.yjw.service.BookService;
import com.yjw.service.YouService;
import com.yjw.util.Page;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	@Autowired
	YouService youService; 
	
	@RequestMapping("/toBook.action")
	public String book(Page page,HttpSession session) {
		PageHelper.offsetPage(page.getStart(),10);
		List<Book> list=bookService.list();
		int total = (int) new PageInfo<>(list).getTotal();
		page.caculateLast(total);
		List<You> list1=youService.list();
		session.setAttribute("You", list1);
		session.setAttribute("Book", list);
		return "Book";
		
	}
	/**
	 * 创建图书
	 * @return
	 */
	@RequestMapping("/createBook.action")
	@ResponseBody
	public String createBook(Book book) {
		int i=bookService.createBook(book);
		if(i>0) {
			return "OK";
		}else {
			return "NO";
		}
	}
	
	/**
	 * 修改
	 * @param book
	 * @return
	 */
	@RequestMapping("/updateBook.action")
	@ResponseBody
	public String updateBook(Book book) {
		System.out.println(book);
		int i=bookService.updateBook(book);
		if(i>0) {
			return "OK";
		}else {
			return "NO";
		}
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteBook.action")
	@ResponseBody
	public String deleteBook(Integer id) {
		int i=bookService.deleteBook(id);
		if(i>0) {
			return "OK";
		}else {
			return "NO";
		}		
	}
	/**
	 * 通id获取书籍信息
	 * @param id
	 * @return
	 */
	@RequestMapping("/getBookById.action")
	@ResponseBody
	public Book getBookById(Integer id) {
		Book book = bookService.getBookById(id);
	    return book;
	}
	 @RequestMapping("/search.action")

	 public String search(String bookname,String bookclass,Model model) {
		 System.out.println(bookname);
		 List<Book> list=bookService.search(bookname, bookclass);
		 model.addAttribute("Book",list);
		return "Book";
		 
	 }
	 /*
	  * 读者那边搜索书籍
	  */
	 @RequestMapping("/Rsearch.action")
	 public String Rsearch(String bookname,String bookclass,Model model) {
		 System.out.println(bookname);
		 List<Book> list=bookService.search(bookname, bookclass);
		 model.addAttribute("Book",list);
		return "ReaderBook";
		 
	 }
}
