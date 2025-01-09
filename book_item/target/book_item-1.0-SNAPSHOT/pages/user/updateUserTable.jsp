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
	<script src="/js/jquery-3.7.1.js"></script>
	<!-- <link href="/css/add.css" type="text/css" rel="stylesheet"> -->
	<script type="text/javascript">
		<%--		验证电话号码的唯一性--%>
		$(function (){
			$("[name=phone]").blur(function (){
				let value=$("[name=phone]").val();

				$.ajax({
					url:"/user/checkPhone",
					data:{"phone":value},
					tape:"post",
					dataType:"json",
					success:function (data){
						if(data){
							$(".myPhone").html("<img src='/img/no.png'>电话号码已经存在")
							$('.UpdateBtn').attr('disabled',true)
						}else {
							$(".myPhone").html("<img src='/img/ok.png'>")
							$('.UpdateBtn').attr('disabled',false)
						}
					}
				})
			})
		})
		$(function (){
			$("[name=name]").blur(function (){
				let value=$("[name=name]").val();

				$.ajax({
					url:"/user/checkName",
					data:{"name":value},
					tape:"post",
					dataType:"json",
					success:function (data){
						if(data){
							$(".myName").html("<img src='/img/no.png'>用户名已经存在")
							$('.UpdateBtn').attr('disabled',true)
						}else {
							$(".myName").html("<img src='/img/ok.png'>")
							$('.UpdateBtn').attr('disabled',false)
						}
					}
				})
			})
		})
	</script>
</head>

<body>
	<nav aria-label="breadcrumb" id="up">
		<ol class="breadcrumb" style="line-height: 15px;">
			<li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
			<li class="breadcrumb-item active" aria-current="page">个人信息管理</li>
			<li class="breadcrumb-item active" aria-current="page">个人中心</li>
		</ol>
	</nav>
	<form style="width: 90%;margin: auto 40px;" method="post" action="/user/personDetailUpdate">
		<input type="hidden" name="user_id" value="${user4.user_id}" >
		<div>
			<label >用户名称：</label>
			<input type="text" class="form-control" value="${user4.name}" name="name" class="in" >
			<span class="myName"></span>
		</div>
		<div>
			<label >当前账户余额：</label>
			<input type="text" class="form-control" value="${user4.money}" name="money" class="in" readonly>
		</div>
		<div >
			<label for="inputPassword4">用户密码：</label>
			<input type="password" class="form-control"  id="inputPassword4" value="${user4.password}" name="password" class="in">
		</div>
		<div >
			<label >年龄：</label>
			<input type="text" class="form-control" value="${user4.age}"  name="age" class="in">
		</div>
		<div>
			<label >出生日期：</label>
			<input type="date" class="form-control" value='<fmt:formatDate value="${user4.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>'  name="birthday" class="in">
		</div>
		<div >
			<label >电话号码</label>
			<input type="text" class="form-control" value="${user4.phone}" name="phone" class="in">
			<span class="myPhone"></span>
		</div>
		<div class="form-group">
			<label>职位：</label>
			<select name="roles" class="form-control">
				<c:forEach items="${roleList}" var="role">
					<option value="${role.roles}" <c:if test="${role.roles==user4.roles}">selected="selected"</c:if>>${role.roleName}</option>
				</c:forEach>
			</select>


		</div>
		<button type="submit" class="btn btn-primary UpdateBtn">提交</button>
	</form>
</body>

</html>