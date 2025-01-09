<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   

    <title>My JSP 'main.jsp' starting page</title>

  </head>
  <!-- 页面分帧技术 -->


  <frameset cols="260,*" border="0" framespacing="200">
   
    <frame src="/pages/left.jsp" >
  
  	<frameset rows="47,*" >
  		<frame src="/pages/top.jsp" scrolling="no"  ></frame>
  		<frame src="/pages/welcome.jsp" name="con" >
  	</frameset>

  </frameset>
</html>
