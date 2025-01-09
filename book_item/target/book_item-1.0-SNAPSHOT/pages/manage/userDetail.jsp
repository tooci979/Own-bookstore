<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>用户详情</title>
    <link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script type="text/javascript" src="/js/jquery-3.7.1.js"></script>

    <link rel="stylesheet" href="/css/table-center.css">
</head>

<script type="text/javascript">
    function UpdateAjax(id) {
        $.ajax({
            url: "/user/getUserById",
            data: {"id": id},
            tape: "post",
            dataType: "json",
            success: function (data) {
                console.log(data)
                // let role='管理员'
                // if(data.roles==2) role='普通用户'
                $('#UpdateName').val(data.name)
                $('#Updatepassword').val(data.password)
                $('#UpdateAge').val(data.age)
                $('#UpdateBirthday').val(data.birthday)
                $('#Phone').val(data.phone)
            }
        })


    }

    function getUserListByName(){
        let name = $(".inputUserName").val()
        $.ajax({
            url: "/user/getUserListByName",
            data: {
                "name": name
            },
            tape: "post",
            dataType: "json",
            success: function (data) {
                $('tBody').children().remove()
                $.each(data, function (i, user) {
                    console.log(user.user_id)
                    $('tBody').append(
                        `            <tr style="text-align: center;">
                <td>`+i+1+`</td>
                <td>`+user.user_id+`</td>
                <td>`+user.name+`</td>
                <td>`+user.password+`</td>
                <td>`+user.age+`</td>
                <td>`+user.birthday+`</td>
                <td>`+user.phone+`</td>
                <td>`+user.role.roleName+`</td>
                <td>
                    <a href="/user/getUserById?id=`+user.user_id+`" class="updateBtn btn btn-info " >修改</a>
                    <a href="/user/deleteById?id=`+user.user_id+`" class="del btn btn-danger">删除</a>&nbsp;
                </td>
            </tr>`
                    )
                });
            }
        })
    }
</script>
<body>
<nav id="up">
    <ol class="breadcrumb" style="line-height: 35px;">
        <li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
        <li class="breadcrumb-item active" aria-current="page">用户管理</li>
        <li class="breadcrumb-item active" aria-current="page">用户列表</li>
    </ol>

</nav>

<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">
    <div style="display: flex;justify-content: space-between; margin: 15px;">

        <div>
            <button class="btn btn-primary" data-toggle="modal" data-target="#add">添加用户</button>
        </div>
        <div>
            <div style="display: flex;margin-left: 20px;">
                <input type="text" class="inputUserName form-control" placeholder="请输入要查询的用户名.." style="width: 240px;">
                <button style="margin-left: 10px;"
                  onclick="getUserListByName()"  class="del btn btn-primary">搜索</button>
            </div>
        </div>


    </div>


    <table class="table table-striped">
        <thead style="text-align: center;">
        <tr class="head ">
            <th scope="col">序号</th>
            <th scope="col">主键</th>
            <th scope="col">用户名</th>
            <th scope="col">密码</th>
            <th scope="col">年龄</th>
            <th scope="col">生日</th>
            <th scope="col">电话号码</th>
            <th scope="col">用户角色</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="user" varStatus="status">
            <tr style="text-align: center;">
                <td>${status.count}</td>
                <td>${user.user_id}</td>
                <td>${user.name}</td>
                <td>${user.password}</td>
                <td>${user.age}</td>
                <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${user.phone}</td>
                    <%--						<td>${user.role.roles}</td>--%>
                <td>${user.role.roleName}</td>
                <td>
                        <%--                    <button onclick="UpdateAjax(${user.user_id})" type="submit" class="updateBtn btn btn-info " data-toggle="modal" data-target="#update" >修改</button>--%>
<%--                    <input onclick="UpdateAjax(${user.user_id})" value="修改" type="submit"--%>
<%--                           class="updateBtn btn btn-info " data-toggle="modal" data-target="#update">--%>
                    <a href="/user/getUserById?id=${user.user_id}" class="updateBtn btn btn-info " >修改</a>
                    <a href="/user/deleteById?id=${user.user_id}" class="del btn btn-danger">删除</a>&nbsp;
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- 增加用户 -->
    <div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">添加用户</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/user/addUser">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>用户名：</label>
                            <input type="text" class="form-control" name="name" class="in">
                            <span class="myName"></span>
                        </div>
                        <div class="form-group">
                            <label>密码：</label>
                            <input type="text" class="form-control" name="password" class="in">
                        </div>
                        <div class="form-group">
                            <label>年龄：</label>
                            <input type="text" class="form-control" name="age" class="in">
                        </div>
                        <div class="form-group">
                            <label>生日</label>
                            <input type="date" class="form-control" name="birthday" class="in">
                        </div>
                        <div class="form-group">
                            <label>电话号码</label>
                            <input type="number" class="form-control" name="phone" class="in">
                            <span class="myPhone"></span>
                        </div>
                        <div>
                            <label>选择职位</label>
                            <select class="form-control" name="roles">
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.roles}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary sub">确认加入</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


</div>
<script type="text/javascript">
    <%--		验证电话号码的唯一性--%>
    $(function (){
        $("[name=phone]").blur(function (){
            let value=$("[name=phone]").val();

            $.ajax({
                url:"/user/checkPhone",
                data:{"phone":value},
                tape:"post",
                dataType:"json",
                success:function (data){
                    if(data){
                        $(".myPhone").html("<img src='/img/no.png'>电话号码已经存在")
                        $('.sub').attr('disabled',true)
                    }else {
                        $(".myPhone").html("<img src='/img/ok.png'>")
                        $('.sub').attr('disabled',false)
                    }
                }
            })
        })
    })

    $(function (){
        $("[name=name]").blur(function (){
            let value=$("[name=name]").val();

            $.ajax({
                url:"/user/checkName",
                data:{"name":value},
                tape:"post",
                dataType:"json",
                success:function (data){
                    if(data){
                        $(".myName").html("<img src='/img/no.png'>用户名已经存在")
                        $('.sub').attr('disabled',true)
                    }else {
                        $(".myName").html("<img src='/img/ok.png'>")
                        $('.sub').attr('disabled',false)
                    }
                }
            })
        })
    })
</script>

<script src="/js/jquery-3.7.1.js"></script>
<!-- 压缩版的bootstrap.min.js包含了所有的Bootstrap数据API插件 -->
<script src="/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>
</body>

</html>