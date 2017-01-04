<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="java.util.Date"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增留言</title>
</head>
<body >
	<% response.setIntHeader("refresh", 5); //自动刷新%>
	<form action="saveMsg.do">
		<h4 >用户：<%= session.getAttribute("userName")%> </h4>
		<h4>编号：<%= session.getAttribute("userId")%> </h4>
		            
		<p>现在的时间是：<%= new Date() %> </p>
		留言：<br>
			<input type="text" style="width: 500px;height: 400px" >
			<br>
		<button type="button" value="">放入草稿箱</button>	<button type="submit">提交</button>
	</form>
</body>
</html>