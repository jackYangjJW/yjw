package com.yjw.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



import com.yjw.po.You;

//import com.yjw.service.AllService;
import com.yjw.service.ReaderService;
import com.yjw.service.UserService;
import com.yjw.service.YouService;


@Controller
public class toController {
@Autowired
UserService userService;
@Autowired
ReaderService readerService;
@Autowired
YouService youService;
	/**
	 * 跳转
	 */
	@RequestMapping("/home.action")
	public String to() {
	   return "home";
	}
	/**
	 * 跳转用户信息
	 */
	@RequestMapping("/toUserInfo.action")
	public String toUserinfo() {
		return "UserInfo";
	}
	
	@RequestMapping("/tohome.action")
	public String tohome() {
		return "welcome";
	}
	@RequestMapping("/tologin.action")
	public String tologin() {
		return "loginR";
	}
	@RequestMapping("/tologin2.action")
	public String tologin(HttpSession session) {
		 session.invalidate();
		return "redirect:tologin.action";
	}
	@RequestMapping("/ReaderNew.action")
	public String ReaderNew(HttpSession session) {
		List<You> list=youService.list();
		session.setAttribute("You", list);
		return "ReaderNew";
	}
	@RequestMapping("/BookNew.action")
	public String BookNew(HttpSession session) {
		List<You> list=youService.list();
		session.setAttribute("You", list);
		return "BookNew";
	}
	@RequestMapping("/yangjingwen.action")
	public String yangjingwen() {
		return "yangjingwen";
	}
}
