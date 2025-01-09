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
	<form action="/book/updateBook" method="post" enctype="multipart/form-data">
		<div class="modal-body">
			<input type="hidden" name="bookID" value="${book.bookID}">
			<div class="form-group">
				<label for="inputEmail4">作者：</label>
				<input type="text" class="form-control" value="${book.author}" name="author" class="in">
			</div>
			<div class="form-group">
				<label for="inputEmail4">商品名：</label>
				<input type="text" class="form-control" value="${book.bookName}" name="bookName" class="in">
			</div>
			<div class="form-group">
				<label for="inputEmail4">出版社</label>
				<input type="text" class="form-control" value="${book.publisher}" name="publisher" class="in">
			</div>
			<div class="form-group">
				<label for="inputEmail4">单价</label>
				<input type="number" class="form-control" value="${book.price}" name="price" class="in">
			</div>
			<div class="form-group">
				<select class="form-control" name="classificationId">
					<c:forEach items="${classifys}" var="classify">
						<option value="${classify.classificationId}"<c:if test="${classify.classificationId==book.classificationId}">selected="selected"</c:if>>${classify.classificationName}</option>
					</c:forEach>
				</select>
			</div>
			<input type="file" name="photo"/><br>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
			<button type="submit" class="btn btn-primary">添加书籍</button>
		</div>
	</form>
</body>

</html>