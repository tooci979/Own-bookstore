<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="./css/login.css">
</head>

<body>
    <section>

        <!-- 登录 -->

        <div class="container">
            <div class="user singinBx">
                <div class="imgBx"><img src="img/1.jpg" alt=""></div>
                <div class="formBx">
                    <form action="/pages/main.jsp" method="post" id="form">
                        <h2>登录</h2>
                        <input type="text" name="" placeholder="用户名">
                        <input type="password" name="" placeholder="密码">
                        <!-- <select>
                            <c:forEach items="${list}" var="dept">
                                <option selected>请选择...</option>
                                <option value="${dept.did}">${dept.role}</option>
                            </c:forEach>
                        </select> -->
                        <input type="submit" name="" value="登录" >
                        <p class="signup">没有账号？<a href="#" onclick="topggleForm();">注册</a></p>
                    </form>
                </div>
            </div>

            <!-- 注册 -->

            <div class="user singupBx">
                <div class="formBx">
                    <form action="">
                        <h2>注册</h2>
                        <input type="text" name="" placeholder="用户名">
                        <input type="password" name="" placeholder="密码">
                        <input type="password" name="" placeholder="再次输入密码">
                        <select>
                            <c:forEach items="${list}" var="dept">
                                <option selected>请选择...</option>
                                <option value="${dept.did}">${dept.role}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" name="" value="注册">
                        <p class="signup">已有账号？<a href="#" onclick="topggleForm();">登录</a></p>
                    </form>
                </div>
                <div class="imgBx"><img src="img/2.jpg" alt=""></div>
            </div>

        </div>
    </section>
    <script type="text/javascript">
        function topggleForm() {
            var container = document.querySelector('.container');
            container.classList.toggle('active');

        }
    </script>
</body>

</html>