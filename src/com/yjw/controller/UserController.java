package com.yjw.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjw.po.User;
import com.yjw.service.UserService;
/**
 * �û���������
 */
@Controller
public class UserController {
	// ����ע��
	@Autowired
	private UserService userService;
	/**
	 * �û���¼
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model,  HttpSession session) {
		// ͨ���˺ź������ѯ�û�
		User user = userService.findUser(usercode, password);
		if(user != null){		
			// ���û�������ӵ�Session
			session.setAttribute("User", user);
			// ��ת����ҳ��
			return "home";
		}
		model.addAttribute("msg", "�˺Ż�����������������룡");
         // ���ص���¼ҳ��
		return "login";
	}
	
	/**
	 * �˳���¼
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    // ���Session
	    session.invalidate();
	    // �ض��򵽵�¼ҳ�����ת����
	    return "redirect:/login.action";
	}
	/**
	 * ���û���½ҳ����ת
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
	    return "login";
	}
	
	/**
	 * �޸���Ϣ
	 * @param user
	 * @param session
	 * @return
	 */
	@RequestMapping("/returnXg.action")
	@ResponseBody
	public String returnXg(User user,HttpSession session) {
		
		System.out.println(user);
		int i=userService.setUser(user);
		if(i>0) {
			return "OK";
		}else {
			return "NO";
		}
	}
	/**
	 * ���id
	 * @param id
	 * @return
	 */
	@RequestMapping("/userId.action")
	@ResponseBody
	public User userId(Integer id) {
		System.out.println("User"+id);
		User user = userService.getID(id);
	    return user;
	}
	

}
