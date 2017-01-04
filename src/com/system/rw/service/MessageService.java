package com.system.rw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;

import com.system.rw.dao.MessageDao;
import com.system.rw.domain.Message;
import com.system.rw.domain.User;

@Service 
public class MessageService {

	@Autowired
	private MessageDao messageDao ;
	
	public List<Message> getMessageByUserId(User user){
		return this.messageDao.getMessageByUserId(user);
	}
	
	public List<Message> getAllMessage(){
		return this.messageDao.getAllMessage();
	}
	
	public Message addMessage(Message message){
		return this.messageDao.addMessage(message);
	}
}
