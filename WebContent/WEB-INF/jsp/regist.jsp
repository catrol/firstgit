<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.p_check
	 {	
	 	color: red;
	 	visibility: hidden;
	 }
</style>
<script type="text/javascript">
	function trim(str){ 
    	return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	function checkById(){
		var name =document.getElementById("userName").value;
		var u = document.getElementById("show1");
		if (trim(name)=="") {
			u.style.visibility="visible";
		}else{
			u.style.visibility="hidden";
		}
	}
	function checkByID2(){
		var pass =document.getElementById("password").value;
		var p = document.getElementById("show2");
		if (trim(pass)=="") {
			p.style.visibility="visible";
		}else {
			u.style.visibility="hidden";
		}
	}
	function checkById3(){
		var re_pass =document.getElementById("rePassword").value;
		var u = document.getElementById("show3");
		if (pass!=re_pass) {
			u.style.visibility="visible";
		}else {
			u.style.visibility="hidden";
		}
	}
	
</script>
</head>
<body>
	<center style="margin-top: 300px">
	<form action="addUser.do" method="post" >
		用户名：<input type="text" name="userName" id="userName" onblur="checkById()">
		<p class="p_check" id="show1">&nbsp;&nbsp;&nbsp;&nbsp;用户名不能为空！</p>
		密码：<input type="password" name="password" id="password" onblur="checkByID2()">
		<p class="p_check" id="show2">&nbsp;&nbsp;密码不能为空！</p>	
		确认密码：<input type="password" id="rePassword" onblur="checkByID3()">
		<p class="p_check" id="show3">&nbsp;&nbsp;密码不一致，请重新输入！</p>
<!-- 		<input type="hidden" name="type" value="123"> -->
		<button type="submit">确定</button>
		
	</form>
</center>
</body>
</html>