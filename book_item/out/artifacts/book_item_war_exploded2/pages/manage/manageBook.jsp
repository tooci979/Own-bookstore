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
	<title>My JSP 'list.jsp' starting page</title>
	<link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="/css/table-center.css">
</head>

<body>
	<nav id="up">
		<ol class="breadcrumb" style="line-height: 35px;">
			<li class="breadcrumb-item"><a href="/pages/home.jsp">平台首页</a></li>
			<li class="breadcrumb-item active" aria-current="page">书籍管理</li>
			<li class="breadcrumb-item active" aria-current="page">书籍列表</li>
		</ol>

	</nav>

	<div style="width: 98%;margin: auto 10px;" class="card shadow-sm p-3 mb-5 bg-white rounded">
		<div style="display: flex;justify-content: space-between; margin: 15px;">

			<div>
				<button class="btn btn-primary" data-toggle="modal" data-target="#add">添加书籍</button>
			</div>
			<div style="display: flex;">
				<div>
					<select id="inputState" class="form-control" style="width: 240px;">
						<c:forEach items="${list}" var="dept">
							<option selected>请选择分类...</option>
							<option value="${dept.did}">${dept.role}</option>
						</c:forEach>
					</select>
				</div>
				<div style="display: flex;margin-left: 20px;">
					<input type="text" class="form-control" placeholder="请输入要查询的书名.." style="width: 240px;">
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
					<th scope="col">商品图片</th>
					<th scope="col">作者</th>
					<th scope="col">商品名</th>
					<th scope="col">出版社</th>
					<th scope="col">单价</th>
					<th scope="col">书籍类型</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList }" var="user" varStatus="status">
					<tr style="text-align: center;">
						<td>1</td>
						<td>1</td>
						<td><img src="/img/1.jpg" alt="" class="img-fluid"></td>
						<td>${user.cname}</td>
						<td>123</td>
						<td>1</td>
						<td>1</td>
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
		<!-- 添加书籍 -->
		<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">添加书籍</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="#" method="get">
						<div class="modal-body">

							<div class="form-group">
								<label for="inputEmail4">作者：</label>
								<input type="text" class="form-control" name="author" class="in">
							</div>
							<div class="form-group">
								<label for="inputEmail4">商品名：</label>
								<input type="text" class="form-control" name="commodityName" class="in">
							</div>
							<div class="form-group">
								<label for="inputEmail4">出版社</label>
								<input type="text" class="form-control" name="publisher" class="in">
							</div>
							<div class="form-group">
								<label for="inputEmail4">单价</label>
								<input type="number" class="form-control" name="quantity" class="in">
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control">
									<c:forEach items="${list}" var="dept">
										<option selected>请选择书籍类型...</option>
										<option value="${dept.did}">${dept.role}</option>
									</c:forEach>
								</select>
							</div>
							<div class="custom-file mb-3">
								<input type="file" class="custom-file-input" id="validatedCustomFile" required>
								<label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
								<div class="invalid-feedback">Example invalid custom file feedback</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary" >添加书籍</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 修改书籍信息 -->
		<div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">添加书籍</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="#" method="get">
						<div class="modal-body">

							<div class="form-group">
								<label for="inputEmail4">作者：</label>
								<input type="text" class="form-control" name="author" class="in">
							</div>
							<div class="form-group">
								<label for="inputEmail4">商品名：</label>
								<input type="text" class="form-control" name="commodityName" class="in">
							</div>
							<div class="form-group">
								<label for="inputEmail4">出版社</label>
								<input type="text" class="form-control" name="publisher" class="in">
							</div>
							<div class="form-group">
								<label for="inputEmail4">单价</label>
								<input type="number" class="form-control" name="quantity" class="in">
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control">
									<c:forEach items="${list}" var="dept">
										<option selected>请选择书籍类型...</option>
										<option value="${dept.did}">${dept.role}</option>
									</c:forEach>
								</select>
							</div>
							<div class="custom-file mb-3">
								<input type="file" class="custom-file-input" id="validatedCustomFile" required>
								<label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
								<div class="invalid-feedback">Example invalid custom file feedback</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary" >添加书籍</button>
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