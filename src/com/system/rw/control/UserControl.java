package com.system.rw.control;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.system.rw.domain.User;
import com.system.rw.service.UserService;
import com.system.rw.tools.CheckCode;

@Controller
@RequestMapping
public class UserControl {

	@Autowired
	private UserService userService;
	@Autowired
	private CheckCode checkCode;	
	
	@RequestMapping(value="/index.do")
	public String loginPage(){
		return "login";
	}
	
	@RequestMapping(value="/randCode.do")
	public void randCode(HttpServletRequest request,HttpServletResponse response) 
			throws IOException{
		this.checkCode.randCode(request, response);
	}
		
		
	@RequestMapping(value="/loginCheck.do")
	public ModelAndView loginController(HttpServletRequest request,User user, 
			HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		 response.setCharacterEncoding("UTF-8");
		 HttpSession session = request.getSession();
//		ModelAndView ma = null;
		System.out.println("------------");
//		this.checkCode.randCode(request, response);
		String safecode = request.getParameter("safeCode");
		if (!session.getAttribute("safeCode").equals(safecode) ){
			
		}
		boolean bl =  this.userService.hasMatchUser(user.getUserName(), user.getPassword());
		if(bl){
			user = this.userService.queryUserByUserName(user.getUserName());
//			user.setLastIp(request.getLocalAddr());
//			user.setLastVisit(new Date());
			
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("userId", user.getUserId());
//			request.getSession().setAttribute("loginUser", user);
			List<User> users =this.userService.queryAllUser();
			request.setAttribute("users", users); 
			return  new ModelAndView("main");
		}else{
			return new ModelAndView("login","error","用户名或密码错误请重新登陆!");
			
		}
	}
	
	@RequestMapping(value="/regist.do") //
	public String regist(HttpServletRequest request){
			return "regist";
	}
	
	@RequestMapping(value="/addUser.do") //
	public String addUser(HttpServletRequest request,User user){
			User us = this.userService.addUser(user);
			List<User> users =this.userService.queryAllUser();
			request.setAttribute("users", users); 
			return "main";
	}
	
	@RequestMapping(value="/codeChange.do") //
	public String update1(HttpServletRequest request,User user){
		System.out.println();
		
			return "codeChange";
	}
	
	@RequestMapping(value="/update.do") //
	public String update2(HttpServletRequest request,User user){
		String pw1 = request.getParameter("password1");
		String pw2 = request.getParameter("password2");
		
		if (pw1 != pw2) {
			return "codeChange";
		}else {
			this.userService.updateUser(user);
			return "main";
		}
//		System.out.println();
		
			
	}
	
	@RequestMapping(value="/queryAll.do") //
	public String queryAll(HttpServletRequest request){
		List<User> users =this.userService.queryAllUser();
		request.setAttribute("users", users); 
			return "main";
	}
	
	@RequestMapping(value="/deleteUser.do") //
	public String deleteUser(HttpServletRequest request,User user){
		int n = this.userService.deleteUser(user);
		List<User> users =this.userService.queryAllUser();
		request.setAttribute("users", users); 
			return "main";
	}
}
