package com.system.rw.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.system.rw.domain.Message;
import com.system.rw.domain.User;
import com.system.rw.service.MessageService;

@Controller
@RequestMapping
public class MessageControl {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value="/oneMsg.do")
	public String getMessageByUserId(HttpServletRequest request,User user){
//		User user = request.getParameter("oneMsg").;
		List<Message> oneMsg =this.messageService.getMessageByUserId(user);
		request.setAttribute("oneMsg", oneMsg); 
		return "oneMsg";
	}
	
	@RequestMapping(value="/allMsg.do")
	public String getALLMessage(HttpServletRequest request){
		List<Message> allMsg =this.messageService.getAllMessage();
		request.setAttribute("allMsg", allMsg); 
		return "allMsg";
	}
	
	@RequestMapping(value="/addMsg.do")
	public String addLMessage(HttpServletRequest request,Message msg){
		return "addMsg";
	}	
	@RequestMapping(value="/saveMsg.do")
	public String saveLMessage(HttpServletRequest request,Message msg){
		
		this.messageService.addMessage(msg);
//		request.setAttribute("allMsg", allMsg); 
		return "allMsg";
	}
}
