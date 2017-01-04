package com.system.rw.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.system.rw.domain.User;

@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public boolean queryUserExist(User user){
		boolean exist = false;
		
			Object object[] = new Object[2];
			object[0] = user.getUserName();
			object[1] = user.getPassword();
			String sql = "select * from in_user where user_name=? and password=?";
			Map<String, Object> map = new HashMap<String,Object>();
			map = this.jdbcTemplate.queryForMap(sql, object);
			if (!map.equals(null)) {
				exist = true;
			}
		return exist;
	}
	
	public User queryUserByUserName(String userName){
		
		String sqlstr = "select * from in_user where user_name=?";
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sqlstr, userName);
		User us = new User();
		us.setUserId(Integer.valueOf(list.get(0).get("id").toString()).intValue());
		us.setUserName(list.get(0).get("user_name").toString());
		us.setPassword(list.get(0).get("password").toString());
			
		return us;
	}
	
	public List<User> queryAllUser(){
		String sql = "select * from in_user";
		List<User> users = new ArrayList<User>();
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql);
		for (int i = 0; i < list.size(); i++) {
			User us = new User();
			us.setUserId(Integer.valueOf(list.get(i).get("id").toString()).intValue());
			us.setUserName(list.get(i).get("user_name").toString());
			us.setPassword(list.get(i).get("password").toString());
//			us.setCredits(list.get(i).get("credits").toString());
			users.add(us);
		}
		return users;
	}
	
	public void updateUser(User user){
		String upsql="update in_user set password=? where user_name=? ";
		this.jdbcTemplate.update(upsql, new Object[]{user.getPassword(),user.getUserName()});
	}
	
	public User addUser(User user){
		String insql = "insert into in_user(user_name,password)values(?,?)";
		int num = this.jdbcTemplate.update(insql,new Object[]{user.getUserName(),user.getPassword()},
				new int[]{java.sql.Types.VARCHAR,java.sql.Types.VARCHAR});
//		user.setUserId(num);
		return user;
	}
	
	public int deleteUser(User user){
		String insql = "delete from in_user where id=?";
		int num = this.jdbcTemplate.update(insql, user.getUserId());
		return num;
		
	}
	
}
