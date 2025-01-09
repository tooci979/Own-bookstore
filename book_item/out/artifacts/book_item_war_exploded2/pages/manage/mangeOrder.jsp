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
	<title>管理员查看订单信息</title>
	<link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="/css/table-center.css">
</head>

<body >
	<nav id="up" >
		<ol class="breadcrumb" style="line-height: 35px;">
			<li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
			<li class="breadcrumb-item active" aria-current="page">订单管理</li>
			<li class="breadcrumb-item active" aria-current="page">订单列表</li>
		</ol>

	</nav>

	<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">
		<div style="display: flex;justify-content: end; margin: 15px;">

				<div style="display: flex;margin-left: 20px;">
					<input type="text" class="form-control" placeholder="请输入要查询的用户名.." style="width: 240px;">
					<a style="margin-left: 10px;" href="/deleteCustomer?id=${user.cid}"
						class="del btn btn-primary">搜索</a>
				</div>


		</div>

	
		<table class="table table-striped">
			<thead style="text-align: center;line-height: 100%;">
				<tr class="head ">
					<th scope="col">序号</th>
					<th scope="col">订单编号</th>
					<th scope="col">作者</th>
					<th scope="col">商品名</th>
					<th scope="col">购买数量</th>
					<th scope="col">下单时间</th>
					<th scope="col">总全额</th>
					<th scope="col">收/发货状态</th>
                    <th scope="col">支付状态</th>
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
						<td>
							<a href="#" class="badge badge-danger">未发货</a>
							<a href="#" class="badge badge-danger">未收货</a>
						</td>
						<td>
							<a href="/deleteCustomer?id=${user.cid}" class="badge badge-info">已支付</a>&nbsp;
							
						</td>
						<td>
							<c:if test="${customer.did==1}">
								<a href="/deleteCustomer?id=${user.cid}" class="del btn btn-info">发货</a>&nbsp;
							</c:if>
							<c:if test="${customer.did==1}">
								<a href="/deleteCustomer?id=${user.cid}" class="del btn btn-danger">删除</a>&nbsp;
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<nav aria-label="Page navigation" style="margin-top: 50px;">
			<input type="text" name="pagenumber" value="1" hidden />
			<ul class="pagination justify-content-end">

			</ul>
		</nav>
	</div>


	<script src="/js/Pagination.js"></script>
</body>

</html>