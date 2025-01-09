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
	<title>用户详情</title>
	<link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="/css/table-center.css">
</head>

<body >
	<nav id="up" >
		<ol class="breadcrumb" style="line-height: 35px;">
			<li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
			<li class="breadcrumb-item active" aria-current="page">用户管理</li>
			<li class="breadcrumb-item active" aria-current="page">用户列表</li>
		</ol>

	</nav>

	<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">
		<div style="display: flex;justify-content: space-between; margin: 15px;">

			<div>
				<button class="btn btn-primary"  data-toggle="modal" data-target="#add">添加用户</button>
			</div>
			<div >
				<div style="display: flex;margin-left: 20px;">
					<input type="text" class="form-control" placeholder="请输入要查询的用户名.." style="width: 240px;">
					<a style="margin-left: 10px;" href="/deleteCustomer?id=${user.cid}"
						class="del btn btn-primary">搜索</a>
				</div>
			</div>


		</div>

	
		<table class="table table-striped">
			<thead style="text-align: center;">
				<tr class="head ">
					<th scope="col">序号</th>
					<th scope="col">主键</th>
					<th scope="col">用户名</th>
					<th scope="col">密码</th>
					<th scope="col">年龄</th>
					<th scope="col">生日</th>
					<th scope="col">电话号码</th>
					<th scope="col">用户角色</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList }" var="user" varStatus="status">
					<tr style="text-align: center;">
						<td>1</td>
						<td>1</td>
						<td>${user.cname}</td>
						<td>${user.password}</td>
						<td>${user.age}</td>
						<td>${user.telephone}</td>
						<td>${user.did}</td>
						<td>${user.dept.role}</td>
						<td>
							<button type="button" class="btn btn-info"  data-toggle="modal" data-target="#update">修改</button>
						
							<c:if test="${customer.did==1}">
								<a href="/deleteCustomer?id=${user.cid}" class="del btn btn-danger">删除</a>&nbsp;
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- 增加用户 -->
		<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">添加用户</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/pages/user/shopCart.jsp">
						<div class="modal-body">
							<input type="hidden" class="form-control" name="image" class="in" >
							<div class="form-group">
								<label for="inputEmail4">用户名：</label>
								<input type="text" class="form-control" name="author" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">密码：</label>
								<input type="text" class="form-control" name="commodityName" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">年龄：</label>
								<input type="text" class="form-control" name="publisher" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">生日</label>
								<input type="date" class="form-control" name="quantity" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">电话号码</label>
								<input type="number" class="form-control" name="totalMoney" class="in" >
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control" >
									<c:forEach items="${list}" var="dept">
										<option selected>请选择职位...</option>
										<option value="${dept.did}">${dept.role}</option>
									</c:forEach>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">确认加入</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 修改用户 -->
		<div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">修改用户</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/pages/user/shopCart.jsp">
						<div class="modal-body">
							<input type="hidden" class="form-control" name="image" class="in" >
							<div class="form-group">
								<label for="inputEmail4">用户名：</label>
								<input type="text" class="form-control" name="author" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">密码：</label>
								<input type="text" class="form-control" name="commodityName" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">年龄：</label>
								<input type="text" class="form-control" name="publisher" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">生日</label>
								<input type="date" class="form-control" name="quantity" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">电话号码</label>
								<input type="number" class="form-control" name="totalMoney" class="in" >
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control" >
									<c:forEach items="${list}" var="dept">
										<option selected>请选择职位...</option>
										<option value="${dept.did}">${dept.role}</option>
									</c:forEach>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">确认加入</button>
						</div>
					</form>
				</div>
			</div>
		</div>






















		<nav aria-label="Page navigation" style="margin-top: 50px;">
			<input type="text" name="pagenumber" value="1" hidden />
			<ul class="pagination justify-content-end">

			</ul>
		</nav>
	</div>


	<script src="/js/Pagination.js"></script>
	<script src="/js/jquery-3.7.1.js"></script>
	<!-- 压缩版的bootstrap.min.js包含了所有的Bootstrap数据API插件 -->
	<script src="/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>
</body>

</html>