package com.system.rw.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.system.rw.domain.Message;
import com.system.rw.domain.User;

@Repository
public class MessageDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
//	@Autowired
//	private Message msg;
	
	public List<Message> getMessageByUserId(User user){
		String sql = "select * from in_info where user_id=?";
		List<Message> msgs = new ArrayList<Message>();
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql,user.getUserId());
		for (int i = 1; i < list.size(); i++) {
			Message msg = new Message();
			msg.setId(Integer.valueOf(list.get(i).get("id").toString()));
			msg.setUserId(Integer.valueOf(list.get(i).get("user_id").toString()).intValue());
			msg.setMessage(list.get(i).get("message").toString());
			msg.setDate(list.get(i).get("date").toString());
			msg.setStatus(Integer.valueOf(list.get(i).get("status").toString()));
			msgs.add(msg);
		}
		return msgs;
	}
	
	public List<Message> getAllMessage(){
		String sql = "select * from in_info ";
		List<Message> msgs = new ArrayList<Message>();
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql);
		for (int i = 0; i < list.size(); i++) {
			Message msg = new Message();
//			msg.setId(Integer.valueOf(list.get(i).get("id").toString()));
			msg.setUserId(Integer.valueOf(list.get(i).get("user_id").toString()).intValue());
			msg.setMessage(list.get(i).get("message").toString());
			msg.setDate(list.get(i).get("date").toString());
//			msg.setStatus(Integer.valueOf(list.get(i).get("status").toString()));
			msgs.add(msg);
		}
		return msgs;
	}
	
	public Message addMessage(Message message){
//		String loginTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

		String insql = "insert into in_info(user_id,message,date)values(?,?,?)";
		int num = this.jdbcTemplate.update(insql,new Object[]{message.getUserId(), message.getMessage(),
				message.getDate()},new int[]{java.sql.Types.BIGINT,java.sql.Types.VARCHAR,java.sql.Types.VARCHAR});
//		message.setUserId(num);
		return message;
	}
	
	public int deleteMessage(User user){
		String insql = "delete from in_user where user_id=?";
		int num = this.jdbcTemplate.update(insql, user.getUserId());
		return num;
		
	}
	
}
