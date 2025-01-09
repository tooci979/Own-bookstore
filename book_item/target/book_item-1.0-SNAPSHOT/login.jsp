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
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    if(window != top) {
        top.location.href = location.href;//session失效跳出frameset
    }

</script>
<script type="text/javascript">
    $(function (){
        $("#regirestName").blur(function (){
            let value=$("#regirestName").val();

            $.ajax({
                url:"/user/checkName",
                data:{"name":value},
                tape:"post",
                dataType:"json",
                success:function (data){
                    if(data){
                        $(".myName").html("<img src='/img/no.png'>用户名已经存在")
                        $('.regirestBtn').attr('disabled',true)
                    }else {
                        $(".myName").html("<img src='/img/ok.png'>")
                        $('.regirestBtn').attr('disabled',false)
                    }
                }
            })
        })
    })
</script>
<body>
    <section>

        <!-- 登录 -->

        <div class="container">
            <div class="user singinBx">
                <div class="imgBx"><img src="/img/login.jpg" alt=""></div>
                <div class="formBx">
                    <form action="/user/login" method="post" id="form">
                        <h2>登录</h2>
                        <input type="text" name="name" placeholder="用户名">
                        <input type="password" name="password" placeholder="密码">
                        <!-- <select>
<%--                            <c:forEach items="${list}" var="dept">--%>
<%--                                <option selected>请选择...</option>--%>
<%--                                <option value="${dept.did}">${dept.role}</option>--%>
<%--                            </c:forEach>--%>
                        </select> -->
                        <input type="submit" name="" value="登录" >
                        <p class="signup">没有账号？<a href="#" onclick="topggleForm();">注册</a></p>
                    </form>
                </div>
            </div>

            <!-- 注册 -->

            <div class="user singupBx">
                <div class="formBx">
                    <form action="/user/registerUser">
                        <h2 >注册</h2>
                            <input type="text" name="name" placeholder="用户名" id="regirestName">
                            <span class="myName"></span>

                        <input type="password" name="password" placeholder="密码">
                        <select name="roles">
                            <c:forEach items="${roleList}" var="role">
                                <option value="${role.roles}" >${role.roleName}</option>
                            </c:forEach>
                        </select>
                        <input type="submit" name="" value="登录"  class="regirestBtn" >
<%--                        <button style="width: 100%;"  class="regirestBtn"  >注册</button>--%>
                        <p class="signup">已有账号？<a href="#" onclick="topggleForm();">登录</a></p>
                    </form>
                </div>
                <div class="imgBx"><img src="img/regirest.jpg" alt=""></div>
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