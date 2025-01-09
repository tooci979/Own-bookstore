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
		<ol class="breadcrumb" style="line-height:10px;">
			<li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
		</ol>

	</nav>

	<div style="width: 98%;margin: auto 10px;" class="card shadow-sm p-3 mb-5 bg-white rounded ">
		<div style="display: flex;justify-content: end; margin: 15px;">
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
				<a style="margin-left: 10px;" href="/deleteCustomer?id=${user.cid}" class="del btn btn-primary">搜索</a>
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
				<c:forEach items="${BookList }" var="book" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${book.id}</td>
						<td><img src="${book.image}" alt="" class="img-fluid" ></td>
						<td>${book.author}</td>
						<td>${book.bookName}</td>
						<td>${book.publisher}</td>
						<td>${book.price}</td>
						<td>${book.author}</td>
						<td>${book.classficiton.classficitonName}</td>
						<td>

							<!-- ajax获取购物车数据 渲染到内嵌表单上 -->
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModal">
								加入购物车
							</button>
								<!-- 通过id发送请求 将对应的商品加入到 订单页 -->
								<button type="button" class="del btn btn-danger" data-toggle="modal" data-target="#confirm">
									购买
								</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 内嵌弹框 -->
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">加入购物车</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/pages/user/shopCart.jsp">
						<div class="modal-body">
							<input type="hidden" class="form-control" name="image" class="in" >
							<div class="form-group">
								<label for="inputEmail4">作者：</label>
								<input type="text" class="form-control" name="author" class="in" readonly>
							</div>
							<div class="form-group">
								<label for="inputEmail4">商品名：</label>
								<input type="text" class="form-control" name="commodityName" class="in" readonly>
							</div>
							<div class="form-group">
								<label for="inputEmail4">出版社：</label>
								<input type="text" class="form-control" name="publisher" class="in" readonly>
							</div>
							<div class="form-group">
								<label for="inputEmail4">数量：</label>
								<input type="number" class="form-control" name="quantity" class="in" >
							</div>
							<div class="form-group">
								<label for="inputEmail4">总金额</label>
								<input type="number" class="form-control" name="totalMoney" class="in" readonly>
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
		<!-- 购买弹框 -->
		<div class="modal fade" id="confirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">确定购买吗？</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#pay">确认</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="pay" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">立即付款：</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<!-- 将商品添加到订单表 未支付 -->
						<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
						<!-- 将商品添加到订单表 已支付 -->
						<button type="submit" class="btn btn-primary" data-dismiss="modal">付款</button>
					</div>
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