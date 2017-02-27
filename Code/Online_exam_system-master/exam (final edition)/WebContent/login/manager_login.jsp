<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>在线考试系统</title>
	<link href="../login/css/login.css" rel="stylesheet" />
	<script src="../login/js/jquery.min.js"></script>
	<script src="../login/js/login.js"></script>
</head>
<body>
<%
String warning = null;
warning = request.getParameter("warning");
if(warning.equals("user")){
%>
	<script>alert("用户名不存在，请重新登录!");</script>
<%
}
else if(warning.equals("pass")){
%>
	<script>alert("密码错误，请重新登录!");</script>
<%
}
%>
<body>
	<div class="login-wrap">
		<form action="/exam/manager/index.jsp"  method="post">
			<h2>在线考试系统</h2>
			<div class="tab">
				<ul class="tabs">
					<li id="office"><a href="#">教务登录</a></li>
					<li id="admin"><a href="#">管理登录</a></li>
				</ul>
			</div>
			<input id="usertype" name="usertype" type="hidden" value="office">
			<div class="input-wrap input-msg">
				<input type="text" id="userid" name="userid" placeholder="用户名" autofocus required>
			</div>
			<div class="input-wrap input-msg">
				<input type="password" id="password" name="password" placeholder="密码" required>
			</div>
			<div class="input-wrap input-msg" id="checkCode-wrap">
				<input type="text" id="checkCode-input" name="checkCode-check" placeholder="验证码" required/>
				<span class="input-check" id="checkCode-check">×</span>
				<div id="checkCode"></div>
			</div>
			<div class="input-wrap">
				<input type="submit" value="登录" id="submit_button">
			</div>
		</form>
	</div>
</body>
</html>