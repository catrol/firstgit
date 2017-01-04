<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change code</title>
<style type="text/css">
	form{
		margin-top: 50px;
/* 		margin-left: 400px; */
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body >
<form action="update.do?userName=<%session.getAttribute("userName");%>">
	<div class="c_p">
		修改密码:<input type="password" name="password1" style="width: 200px">
		
	</div><br>
	<div class="c_p">
		确认密码：<input type="password" name="password2" style="width: 200px">
	</div><br>
	<button type="submit">确定</button>
</form>
</body>
</html>