<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>

	<title>更新用户信息</title>
	<link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<!-- <link href="/css/add.css" type="text/css" rel="stylesheet"> -->

</head>

<body>
	<nav aria-label="breadcrumb" id="up">
		<ol class="breadcrumb" style="line-height: 15px;">
			<li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
			<li class="breadcrumb-item active" aria-current="page">个人信息管理</li>
			<li class="breadcrumb-item active" aria-current="page">个人中心</li>
		</ol>
	</nav>
	<form style="width: 90%;margin: auto 40px;" method="post" action="/addCustomer">
		<div >
			<label for="inputEmail4">用户名称：</label>
			<input type="text" class="form-control" name="name" class="in" >
		</div>
		<div >
			<label for="inputEmail4">当前账户余额：</label>
			<input type="text" class="form-control" name="name" class="in" readonly>
		</div>
		<div >
			<label for="inputPassword4">用户密码：</label>
			<input type="password" class="form-control"  id="inputPassword4" name="password" class="in">
		</div>
		<div >
			<label for="inputAddress">年龄：</label>
			<input type="text" class="form-control"  name="telephone" class="in">
		</div>
		<div>
			<label for="inputAddress">出生日期：</label>
			<input type="text" class="form-control"  name="telephone" class="in">
		</div>
		<div >
			<label for="inputAddress">电话号码</label>
			<input type="text" class="form-control" name="telephone" class="in">
		</div>
		<div class="form-group">
			<label for="inputState">职位：</label>
			<select id="inputState" class="form-control">
				<c:forEach items="${list}" var="dept">
					<option selected>请选择...</option>
					<option value="${dept.did}">${dept.role}</option>
				</c:forEach>
			</select>


		</div>
		<button type="submit" class="btn btn-primary">提交</button>
		<button type="submit" class="btn btn-primary">清空</button>
	</form>
</body>

</html>