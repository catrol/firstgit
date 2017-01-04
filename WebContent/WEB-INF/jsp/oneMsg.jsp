<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
<style type="text/css">
 	td
	{
		padding: 10px 20px;	
	}
	.tr
	{
		background-color: #F0FFF0;
	}
</style>
</head>
<body>

	<div>
		<form action="">
			<table border="1px" align="center" width="70%">
<!-- 				<tr class="tr"> -->
<!-- 					<td width="10%">ID</td> -->
<!-- 					<td width="30%">用户名</td> -->
<!-- 					<td width="30%">密码</td> -->
<!-- 					<td width="30%">操作</td> -->
<!-- 				</tr > -->
				<c:forEach items="${oneMsg}" var="msg">
					<tr class="tr">
						<td width="10%">${msg.userId }</td>
						<td width="60%">${msg.message }</td>
						<td width="20%">${msg.date }</td>
						<td width="10%"><a href="delete.do?userId=${msg.userId }">删除</a></td>
					</tr>
				</c:forEach>
			</table>
<!-- 			<ol> -->
<%-- 				<c:forEach items="${oneMsg}" var="msg"> --%>
<%-- 				<li>${msg.userId}</li> --%>
<%-- 				</c:forEach> --%>
<!-- 			</ol> -->
		</form>
	</div>
</body>
</html>