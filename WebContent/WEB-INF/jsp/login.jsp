<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<!-- <link rel="stylesheet" href=".login.css" type="text/css"> -->
<script type="text/javascript" src="jquery/jquery-3.1.1.min.js"></script>
<style type="text/css">
	body
	 {
	 	background-image: url(image/b-2.jpg);
	 	background-color:#FFFAFA;
	 	background-repeat: no-repeat;
	 	background-position: center;
	 }
/* 	 center	  */
/* 	 { */
/* 	 	margin-top: 400px; */
/* 	 	margin-bottom: 170px; */
/* 	 } */
	 #frame
	 {
	 	margin-left:300px;
	 	margin-top: 400px; 
	 	margin-bottom: 170px;
	 	width:500px;
		height:380px;
		background-color:#F0FFF0; 
		box-shadow: 10px 10px 5px #888888;
	 }
	 .link
	 {
	 	color: blue
	 }
	 .w200
	 {
		 width: 220px;
		 height:35px;
		 background-color: green;
		 font-size: 1.2em;
	 }
	 #checkCode
	 {
	 	width: 60px;
	 }
</style>

<script type="text/javascript">
	function trim(str){ //删除左右两端的空格
	    return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	function checkById(){
		var name =document.getElementById("userName").value;
		if (trim(name)=="") {
			document.getElementById("tip").innerHTML="用户名不能为空！";
		}
	}
	function checkByID2(){
		var pass =document.getElementById("password").value;
		if (trim(pass)=="") {
			document.getElementById("tip").innerHTML="密码不能为空！";
		}
	}
	
	function change(){
// 		$("safeCode").load("randCode.do");
		document.getElementById("safeCode").src="randCode.do";
		}
</script>
</head>

<body background="">
	<center id="center"  >
	<div id="frame" >
		<div><h2 style="padding-top: 50px" align="center">用户登录</h2></div>
		<form  action="loginCheck.do" method="post" >
			<div class="input">
				用户名：
				<input id="userName" type="text" name="userName" onblur="checkById()" style="width: 150px"></input>
			</div><br />
			<div>
				密   码：
				<input id="password" type="password" name="password" onblur="checkByID2()" style="width: 150px"> </input>
			</div><br />
			<div>
				验证码：
				<input id="safeCode" type="text" name="safeCode" style="width: 70px"></input>
				<img src="randCode.do" alt="刷新" onclick="change()" style="width: 65px;height: 20px"/>
			</div>
			<span id="tip" style="color: red;">  </span></br>
			<button type="submit" class="w200" >登陆</button></br></br></br>
			<div>
				<a class="link" href="regist.do" style="margin-left: 2px">注册</a>
				<a class="link" href="#" style="margin-right: 2px">忘记密码?</a>
			</div>
			
			
		</form>
	</div>
</center>
</body>
</html>