<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎页面</title>
  	<link href="css/welcome.css" type="text/css" rel="stylesheet">
  </head>
  
  <body>
    <div id="up">
    	<ul>
    		<li><span>平台首页</span></li>
    	</ul>
    </div>
    <div id="down">
    	<div id="d1">
    		<span class="s1">热烈欢迎：${user2.name}
             <c:if test="${user2.roles==1}">
                 <span style="color: red">管理员</span>
             </c:if>
            <c:if test="${user2.roles!=1}">
                <span style="color: red">用户</span>
            </c:if>
            </span>


    		<span class="s2">访问本系统！！！</span>
    	</div>
    	<div id="d2"></div>
    </div>
  </body>
</html>
