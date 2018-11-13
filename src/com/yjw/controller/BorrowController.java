package com.yjw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjw.po.Book;
import com.yjw.po.Borrow;
import com.yjw.po.Reader;
import com.yjw.service.BookService;
import com.yjw.service.BorrowService;
import com.yjw.service.ReaderService;
import com.yjw.service.YouService;
import com.yjw.util.Page;

@Controller
public class BorrowController {

	@Autowired
	 BorrowService borrowService;
	@Autowired
	ReaderService readerService;
	@Autowired
	BookService bookService;
	@Autowired
	YouService youService;
	@RequestMapping("/reBorrow.action")
	public String reBorrow() {
		return "redirect:/toBorrow.action";
	}
	@RequestMapping("/toBorrow.action")

	public String toBorrow(Page page,HttpSession session) {
		PageHelper.offsetPage(page.getStart(),10);
		List<Borrow> list=borrowService.list();
		int total = (int) new PageInfo<>(list).getTotal();
		page.caculateLast(total);
		List<Book> list1=bookService.list();
		List<Reader> list3=readerService.list();
		session.setAttribute("Book", list1);
		session.setAttribute("Borrow", list);
		session.setAttribute("Reader", list3 );
		return "Borrow";
	}
	
	@RequestMapping("/searchBorrow.action")
	
	public String searchBorrow(Borrow borrow,HttpSession session) {
		List<Borrow> list=borrowService.searchBorrow(borrow);
		session.setAttribute("Borrow", list);
		return "Borrow";
	}
	@RequestMapping("/BorrowNew.action")
	public String BorrowNew(HttpSession session) {
		List<Reader> listreader=readerService.list();
		List<Book> listbook=bookService.list();
		session.setAttribute("Reader",listreader );
		session.setAttribute("Book",listbook );
		return "BorrowNew";
		
	}	
	/**
	 * 创建
	 * @param borrow
	 * @return
	 */
	@RequestMapping("/createBorrow")
	@ResponseBody
	public String createBorrow(Borrow borrow){
	int i=borrowService.createBorrow(borrow);
		if(i>0) {
			return "OK";
		}else {
			return "NO";
		}
	}
	@RequestMapping("/delectBorrow.action")
	@ResponseBody
	public String delectBorrow(Integer id){
			borrowService.delectBorrow(id);
			return "OK";
	}
	/**
	 * 读者借阅
	 * @param id
	 * @return
	 */
	@RequestMapping("/ReaderBorrow.action")

	public String ReaderBorrow(Integer id){
			borrowService.delectBorrow(id);
			return "OK";
	}
	/**
	 * 通过id获取
	 * @param id
	 * @return
	 */
	@RequestMapping("/getBorrowByID")
	@ResponseBody
	public Borrow getBorrowByID(Integer id) {
		System.out.println(id);
		Borrow borrow=borrowService.getReaderByID(id);
		return borrow;
	}
	@RequestMapping("/updateBorrow")
	@ResponseBody
	public String updateBorrow(Borrow borrow) {
		System.out.println(borrow);
		int i=borrowService.updateBorrow(borrow);
		if(i>0) {
			return "OK";
		}
		return "NO";
	}
}
