<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>用户订单列表</title>
    <link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="/css/table-center.css">
</head>

<body>
<nav id="up">
    <ol class="breadcrumb" style="line-height: 35px;">
        <li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
        <li class="breadcrumb-item active" aria-current="page">订单管理</li>
        <li class="breadcrumb-item active" aria-current="page">订单列表</li>
    </ol>

</nav>

<div style="width: 98%;margin: auto 10px;" class="card shadow-sm p-3 mb-5 bg-white rounded ">
    <table class="table table-striped">
        <thead style="text-align: center;">
        <tr class="head ">
            <th scope="col">序号</th>
            <th scope="col">订单号</th>
            <th scope="col">交易人</th>
            <th scope="col">商品图片</th>
            <th scope="col">作者</th>
            <th scope="col">商品名</th>
            <th scope="col">购买数量</th>
            <th scope="col">总价</th>
            <th scope="col">交易状态</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${UserOredrList}" var="UserOredr" varStatus="status">
            <c:forEach items="${UserOredr.getTOrder()}" var="UserOredr2" varStatus="status">
                <tr style="text-align: center;">
                    <td>${status.count}</td>
                    <td>${UserOredr2.orderId}</td>
                    <td>${UserOredr.name}</td>
                    <td><img src="${UserOredr2.image}" alt="" class="img-fluid"></td>
                    <td>${UserOredr2.author}</td>
                    <td>${UserOredr2.bookName}</td>
                    <td>${UserOredr2.quantity}</td>
                    <td>${UserOredr2.quantity * UserOredr2.price}</td>
                    <td>
                        <c:if test="${UserOredr2.getPayStatus()==1}">
                            <a href="#" class="badge badge-secondary" disable>已支付</a>
                        </c:if>
                        <c:if test="${UserOredr2.getPayStatus()==0}">
                            <a href="/order/toPay?orderID=${UserOredr2.orderId}&userID=${user2.user_id}"
                               class="badge badge-warning" disable onclick="return alert('支付成功')">去支付</a>
                        </c:if>

                        <c:if test="${UserOredr2.getShipStatus()==1}">
                            <a href="#" class="badge badge-secondary">已发货</a>
                        </c:if>
                        <c:if test="${UserOredr2.getShipStatus()==0}">
                            <%--									/order/toShip?orderID=${UserOredr2.orderId}&userID=${user2.user_id}--%>
                            <a href="#" class="badge badge-danger">未发货</a>
                        </c:if>
                    </td>

                    <td>
                        <c:if test="${UserOredr2.getAcceptStatus()==1}">
                            <a href="#" class="btn btn-secondary">已收货</a>&nbsp;
                        </c:if>
                        <c:if test="${UserOredr2.getAcceptStatus()==0 && UserOredr2.getShipStatus()==0}">
                            <button class="del btn btn-info" disabled>确认收货</button>
                            &nbsp;
                        </c:if>
                        <c:if test="${UserOredr2.getAcceptStatus()==0 && UserOredr2.getShipStatus()==1}">
                            <a href="/order/toAccept?orderID=${UserOredr2.orderId}&userID=${user2.user_id}"
                               class="btn btn-info">确认收货</a>&nbsp;
                        </c:if>


                        <c:if test="${UserOredr2.getAcceptStatus()==1}">
                            <a href="/order/deleteTOrder?orderID=${UserOredr2.orderId}&userID=${user2.user_id}"
                               class="del btn btn-danger">删除</a>&nbsp;
                        </c:if>
                        <c:if test="${UserOredr2.getShipStatus()==0}">
                            <a href="#" class="del btn btn-secondary" disabled>删除</a>&nbsp;
                        </c:if>


                    </td>
                </tr>
            </c:forEach>

        </c:forEach>
        </tbody>
    </table>

    <nav aria-label="...">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <a class="page-link" href="/user/getAllOredrByUserName?currentPage=1&name=${user2.name}">首页</a>
            </li>
            <li class="page-item ">
                <a class="page-link" href="/user/getAllOredrByUserName?currentPage=${pagesListUserOrder.getPrePage()}&name=${user2.name}">上一页</a>
            </li>

            <c:forEach items="${pagesListUserOrder.getPageListNum()}" var="num" varStatus="statusNum">
                <%--                <input value="${statusNum.count}" id="hid1">--%>
                <%--                <input value="${pagesList.getCurrentPage()}" id="hid2">--%>
                <li class="page-item" id="hidLink">
                    <a class="page-link" href="/user/getAllOredrByUserName?currentPage=${statusNum.count}&name=${user2.name}">${statusNum.count}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/user/getAllOredrByUserName?currentPage=${pagesListUserOrder.getNextPage()}&name=${user2.name}">下一页</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/user/getAllOredrByUserName?currentPage=${pagesListUserOrder.getTotalPage()}&name=${user2.name}">尾页</a>
            </li>
        </ul>
    </nav>
</div>



</body>

</html>