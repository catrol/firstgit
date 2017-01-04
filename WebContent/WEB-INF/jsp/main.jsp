<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
String Path = request.getContextPath();
String bathPath = request.getScheme()+"://"+ request.getServerName() + ":" + request.getServerPort()
+ Path +"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录管理系统</title>
<base href="<%=bathPath%>">	
<link rel="stylesheet" href="css/table1.css">
<script src="jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
 

<script type="text/javascript">
	$(document).ready(function(){
		//alert(1);
// 		 $("#oneMsg").click(function(){
// 		   	$("#display").load("oneMsg.do",function(responseText,textStatus){
	// 	    	$("#display").append("<hr>responseText:"+responseText);
// 		    		$("#display").append("<hr>textStatus:"+textStatus);
// 		   });  
// 		 });
		$(".menu").click(function(){
// 			alert(1);
			return false;
			$(".subMenu").each(function(){
				$(this).toggle("slow");
			});
				
		});

		 $("#loadQuery_allMsg").click(function(){
			$("#content").load("allMsg.do",function(responseText,textStatus){
			    $("#display").append("<hr>textStatus:"+textStatus);
			});  
		 });
		 //加载留言page
		 $("#addMsg").click(function(){
				$("#content").load("addMsg.do",function(responseText,textStatus){
				    $("#display").append("<hr>textStatus:"+textStatus);
				});  
			 });
		 //修改密码
		 $("#codeChange").click(function(){
				$("#content").load("codeChange.do",function(responseText,textStatus){
				    $("#display").append("<hr>textStatus:"+textStatus);
				});  
			 });
	}); 
</script>
</head>
<body>
	<div id="header">
<%-- 		<p>你好，${loginUser.userName }</p> --%>
		<h1>Inner Space</h1>		
	</div>
	
	<div id="sideBar">
		<div class="menu">
			<a class=underline  href="#" >用户管理</a><br>
			<div class="subMenu" style="display: none;">
				<a class="" id="#" href="deleteUser.do?userId=${user.userId}">删除</a><br>
				<a class="" id="loadQuery_user" href="queryAll.do">查看</a>
			</div>
			
		</div>
		<div class="menu">
			<a class="underline" href="#"  >个人资料</a><br>
			<div class="subMenu" style="display: none;">
				<a class="" id="#" href="intro.do">查看</a><br>
				<a class="" id="codeChange" href="#">修改密码</a>
			</div>
		</div>
		<div class="menu">
			<a class="underline" href="#" >留言</a>
			<div class="subMenu" style="display: none;">
				<a class="underline" id="loadQuery_allMsg" href="allMsg.do"  >全部留言</a><br>
				<a class="underline" id="addMsg" href="#"  >新建</a><br>
				<a class="underline" href="#"  >草稿箱</a>
			</div>
		</div>
	</div>
	
	<div id="content" style="background-color: ">
<%-- 		<jsp:include page="users.jsp" ></jsp:include> --%>
		<form action="">
			<table  align="center" width="70%">
				<tr class="tr_css">
					<th width="10%">ID</th>
					<th width="30%">用户名</th>
					<th width="30%">密码</th>
					<th width="30%">操作</th>
				</tr >
				<c:forEach items="${users}" var="user">
					<tr class="tr">
						<td>${user.userId }</td>
						<td>${user.userName }</td>
						<td>${user.password }</td>
						<td>
							<a class="oneMsg" href="oneMsg.do?userId=${user.userId} "><small>查看留言</small></a>
<!-- 							<a class="oneMsg" href="#"><small>查看留言</small></a> -->
							<a href="deleteUser.do?userId=${user.userId }"><small>删除用户</small></a>
<!-- 							<a href="javascript:" id="delete" onclick="del(this)">删除</a> -->
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	<div id="display">
		
	</div>
	<div id="oneMsg" style="display: none">
	<form action="">
		<table border="1px" align="center" width="70%">
				<tr class="tr">
					<td width="10%">ID</td>
					<td width="30%">留言</td>
					<td width="30%">时间</td>
					<td width="30%">操作</td>
				</tr >
				<c:forEach items="${oneMsg}" var="msg">
					<tr class="tr">
						<td width="10%">${msg.userId }</td>
						<td width="70%">${msg.message }</td>
						<td width="20%">${msg.date }</td>
						<td><a href="delete.do?userId=${msg.userId }">删除</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	
</body>
</html>