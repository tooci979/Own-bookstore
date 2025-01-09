<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>My JSP 'list.jsp' starting page</title>

    <link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="/css/table-center.css">
    <script type="text/javascript">
        function updateClassify1(id){
            $.ajax({
                url: "/classify/getClassifyById",
                data: {"id": id},
                tape: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    console.log(data.classificationName)
                    $("[name=classificationName]").val(data.classificationName)
                    $("[name=classificationId]").val(data.classificationId)
                }
            })
        }

        function findClassifyByName(){
            let name = $(".findClassifyName").val()
            $.ajax({
                url: "/classify/findClassifyByName",
                data: {
                    "name": name
                },
                tape: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    $('tBody').children().remove()
                    $.each(data, function (i, data){
                        $('tBody').append(
                            `
                                <tr style="text-align: center;">
                <td>`+1+`</td>
                <td>`+data.classificationId+`</td>
                <td>`+data.classificationName+`</td>
                <td>
                    <button type="button" onclick="updateClassify1(`+data.classificationId+`)" value="`+data.classificationId+`" class="updateClassify btn btn-info" data-toggle="modal" data-target="#update">修改</button>


                    <a href="/classify/deleteClassifyById?classificationId=`+data.classificationId+`" class="del btn btn-danger">删除</a>&nbsp;

                </td>
            </tr>
                    `
                        )
                    })
                }
            })
        }

    </script>
</head>

<body>
<nav id="up">
    <ol class="breadcrumb" style="line-height: 35px;">
        <li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
        <li class="breadcrumb-item active" aria-current="page">分类管理</li>
        <li class="breadcrumb-item active" aria-current="page">书籍分类列表</li>


    </ol>

</nav>

<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">
    <div style="display: flex;justify-content: space-between; margin: 15px;">

        <div>
            <button class="btn btn-primary" data-toggle="modal" data-target="#add">添加书籍分类</button>
        </div>
        <div>
            <div style="display: flex;margin-left: 20px;">
                <input type="text" class="findClassifyName form-control" placeholder="请输入要查询的书籍类型.." style="width: 240px;">
                <button onclick="findClassifyByName()" style="margin-left: 10px;"
                   class="del btn btn-primary">搜索</button>
            </div>
        </div>


    </div>

    <table class="table table-striped">
        <thead style="text-align: center;">
        <tr class="head ">
            <th scope="col">序号</th>
            <th scope="col">分类主键</th>
            <th scope="col">书籍类型</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${classification }" var="classification" varStatus="status">
            <tr style="text-align: center;">
                <td>${status.count}</td>
                <td>${classification.classificationId}</td>
                <td>${classification.classificationName}</td>
                <td>
                    <button type="button" onclick="updateClassify1(${classification.classificationId})" value="${classification.classificationId}" class="updateClassify btn btn-info" data-toggle="modal" data-target="#update">修改</button>


                    <a href="/classify/deleteClassifyById?classificationId=${classification.classificationId}" class="del btn btn-danger">删除</a>&nbsp;

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- 增加分类 -->
    <div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">增加分类</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/classify/addClassify">
                    <div class="modal-body">
                        <input type="hidden" class="form-control" name="image" class="in">
                        <div class="form-group">
                            <label for="inputEmail4">分类名：</label>
                            <input type="text" class="form-control" name="classificationName" class="in">
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

    <!-- 修改分类 -->
    <div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">修改</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/classify/updateClassify">
                    <div class="modal-body">
                        <input type="hidden" class="form-control" value="" name="classificationId" class="in">
                        <div class="form-group">
                            <label for="inputEmail4">分类名：</label>
                            <input type="text" class="form-control" name="classificationName" class="in">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">确认修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<script src="/js/jquery-3.7.1.js"></script>
<!-- 压缩版的bootstrap.min.js包含了所有的Bootstrap数据API插件 -->
<script src="/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>
</body>

</html>