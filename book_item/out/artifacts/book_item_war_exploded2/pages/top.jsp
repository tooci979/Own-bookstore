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
	<base href="<%=basePath%>">

	<title>My JSP 'top.jsp' starting page</title>
	<link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

	<!-- <link href="/css/top.css" type="text/css" rel="stylesheet"> -->
	<script type="text/javascript">
		setInterval("clock.innerHTML=new Date().toLocaleString() + '&nbsp;&nbsp;' + ''.charAt(new Date().getDay());", 1000);
		
	</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="line-height: 100%;">
		<div class="collapse navbar-collapse" id="navbarText">
		
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"  fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5H2zM3 3H2v1h1V3z"/>
			<path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9z"/>
			<path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5V7zM2 7h1v1H2V7zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5H2zm1 .5H2v1h1v-1z"/>
		  </svg>
		</div>
		<div class="navbar-text" >
			<span>
				欢迎<a href="">${user2.name}</a>&nbsp;&nbsp;
			</span>&nbsp;&nbsp;
			<span id="clock"></span>
		</div>
		
	</nav>
	<!-- <div id="con">
		<div id="left" style="color:white;font-size:20px;padding-top:5px;">欢迎使用本系统</div>
		<div id="right">
			<span>
				欢迎<a href="">${user2.name}</a>&nbsp;&nbsp;
				<a href="/logout" target="_top">退出</a>
			</span>&nbsp;&nbsp;
			<span id="clock"></span>
		</div>
	</div> -->
</body>

</html>