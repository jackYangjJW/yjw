package com.yjw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjw.po.Book;
import com.yjw.po.Borrow;
import com.yjw.po.Reader;
import com.yjw.po.You;
import com.yjw.service.BookService;
import com.yjw.service.BorrowService;
import com.yjw.service.ReaderService;
import com.yjw.service.YouService;
import com.yjw.util.Page;


@Controller

public class ReaderController {
 //����ע��
	@Autowired
	ReaderService readerService;
	@Autowired
	YouService youService; 
	@Autowired
	BookService bookService;
	@Autowired
	BorrowService borrowService;
	
	@RequestMapping(value = "/toReader.action")
	public String tt(Page page,HttpSession session) {
		PageHelper.offsetPage(page.getStart(),10);
		List<Reader> list=readerService.list();
		int total = (int) new PageInfo<>(list).getTotal();
		page.caculateLast(total);
		session.setAttribute("Reader", list );
		List<You> list1=youService.list();
		session.setAttribute("You", list1);
		return "ReaderInfo";
	}
	/**
	 * �����ͻ�
	 */
	@RequestMapping("/createReader.action")
	@ResponseBody
	public String createReader(Reader reader) {
	    // ��ȡSession�еĵ�ǰ�û���Ϣ
		int i=readerService.createReader(reader);
	    if(i>0){
		    return "OK";
	    	
	    }else{
	    	return "FAIL";
	    }
	}

	/**
	 * ͨ��id��ȡ�ͻ���Ϣ
	 */
	@RequestMapping("/getReaderById.action")
	@ResponseBody
	public Reader getReaderById(Integer id) {
		System.out.println(id);
		Reader reader = readerService.getReaderById(id);
	    return reader;
	}
	/**
	 * ͨ��name��ȡ�ͻ���Ϣ
	 */
	@RequestMapping("/getReaderByName.action")
	@ResponseBody
	public Borrow getReaderByName(String name) {
		System.out.println(name);
		Borrow borrow = (Borrow) borrowService.getReaderByName(name);
	    return borrow;
	}
	/**
	 * ���¿ͻ�
	 */
	@RequestMapping("/updateReader.action")
	@ResponseBody
	public String readerUpdate(Reader reader) {
//		System.out.println(reader);
	    int rows = readerService.updateReader(reader);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	
	/**
	 * ɾ���ͻ�
	 */
	@RequestMapping("/deleteReader.action")
	@ResponseBody
	public String ReaderDelete(Integer id) {
	    int rows = readerService.deleteReader(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
	/**
	 * �������ֲ��Ҷ���
	 * @param name
	 * @return
	 */
	 
	@RequestMapping("/searchName.action")

	public String searchName(String name,Model model) {
		List<Reader> list=readerService.searchName(name);
		model.addAttribute("Reader",list);
	   return "ReaderInfo";			
	 
	}
	/**
	 * ���ߵ�¼
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/loginReader.action",method = RequestMethod.POST)
	public String loginReader(Integer readerid,String password,HttpSession session) {
			Reader reader = readerService.findReader(readerid, password);
			List<Borrow> list= borrowService.borrowReader(reader.getName());
			if(reader != null){		
				session.setAttribute("Reader", reader);
				session.setAttribute("Borrow", list);

				return "Readerhome";
			}
			session.setAttribute("Rmsg", "�˺Ż�����������������룡");
	         // ���ص���¼ҳ��
			return "loginR";			
	}
	@RequestMapping("/ReaderPwd.action")
	public String ReaderPwd(String readerid,String password,HttpSession session) {
			return "ReaderPwd";			
	}
	/**
	 * ���߽���
	 * @param page
	 * @param session
	 * @return
	 */
	@RequestMapping("/ReaderBook")
	public String ReaderBook(Page page,HttpSession session) {
		PageHelper.offsetPage(page.getStart(),10);
		List<Book> list=bookService.list();
		int total = (int) new PageInfo<>(list).getTotal();
		page.caculateLast(total);
		List<You> list1=youService.list();
		session.setAttribute("Book", list);
		session.setAttribute("You", list1);
		return "ReaderBook";
		
	}
}
