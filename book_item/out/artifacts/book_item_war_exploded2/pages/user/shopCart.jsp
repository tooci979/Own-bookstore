<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>管理员查看订单信息</title>
	<link href="/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

	<link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
		integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	
	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="/css/table-center.css">
	<style>
		#flexCheckDefault {
			width: 20px;
			height: 20px;
		}

		head #flexCheckDefault {
			position: absolute;
			left: 20px;
		}
	</style>
</head>

<body>
	<nav id="up">
		<ol class="breadcrumb" style="line-height: 35px;">
			<li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
			<li class="breadcrumb-item active" aria-current="page">订单管理</li>
			<li class="breadcrumb-item active" aria-current="page">购物车</li>
		</ol>
	</nav>

	<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">
		
		<div style="display: flex;justify-content: space-between; margin: 15px;">
			<div>
				<a href="/pages/home.jsp"
					class="btn btn-primary">添加商品</a>
			</div>
			<div style="display: flex;margin-left: 20px;">
				<input type="text" class="form-control" placeholder="请输入要查询的商品.." style="width: 240px;">
				<a style="margin-left: 10px;" href="/deleteCustomer?id=${user.cid}"
					class="del btn btn-primary">搜索</a>
			</div>
		</div>


		<table class="table table-striped">
			<thead style="text-align: center;">
				<tr class="head ">
					<th scope="col" >
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						<span>订单编号</span>
					</th>
					<th scope="col">商品图片</th>
					<th scope="col">作者</th>
					<th scope="col">商品名</th>
					<th scope="col">购买数量</th>
					<th scope="col">出版社</th>
					<th scope="col">总全额</th>
					<th scope="col">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customerList }" var="user" varStatus="status">
					<tr>
						<td>
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							1
						</td>
						<td><img src="/img/1.jpg" alt="" class="img-fluid" ></td>
						<td>${user.age}</td>
						<td>${user.telephone}</td>
						<td>${user.did}</td>
						<td>${user.dept.role}</td>
						<td>${user.dept.role}</td>
						<td>
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#update">
								修改
							</button>
								<a href="/deleteCustomer?id=${user.cid}" class="del btn btn-danger">删除</a>&nbsp;
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- 修改弹框 -->
		<div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">加入购物车</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="/pages/user/shopCart.html">
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