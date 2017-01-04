package com.system.rw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.system.rw.dao.UserDao;
import com.system.rw.domain.User;



 @Service 
public class UserService {

	@Autowired
	private UserDao userDao;
	
	public boolean hasMatchUser(String userName,String password){
//		int matchCount = userDao.getMatchCount(username, password);
//		return matchCount>0;
		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		boolean exist = false;
		try {
			exist = this.userDao.queryUserExist(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exist;
	}
	
	public User queryUserByUserName(String userName){
		return this.userDao.queryUserByUserName(userName);
	}
	
	public List<User> queryAllUser(){
		return this.userDao.queryAllUser();
	}
	public void updateUser(User user) {
		this.userDao.updateUser(user);
	}
	
	public User addUser(User user) {
		return this.userDao.addUser(user);
	}
	
	public int deleteUser(User user) {
		return this.userDao.deleteUser(user);
	}
}
