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
    <title>管理员查看订单信息</title>
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

<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">


    <table class="table table-striped">
        <thead style="text-align: center;line-height: 100%;">
        <tr class="head ">
            <th scope="col">序号</th>
            <th scope="col">订单编号</th>
            <th scope="col">作者</th>
            <th scope="col">商品名</th>
            <th scope="col">购买数量</th>
            <th scope="col">单价</th>
            <th scope="col">下单时间</th>
            <th scope="col">总全额</th>
            <th scope="col">收/发货状态</th>
            <th scope="col">支付状态</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orders}" var="tOrder" varStatus="status">
            <tr style="text-align: center;">
                <td>${status.count}</td>
                <td>${tOrder.orderId}</td>
                <td>${tOrder.author}</td>
                <td>${tOrder.bookName}</td>
                <td>${tOrder.quantity}</td>
                <td>${tOrder.price}</td>
                <td><fmt:formatDate value="${tOrder.orderTime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${tOrder.price * tOrder.quantity}</td>
                <td>


                    <c:if test="${tOrder.acceptStatus==1}">
                        <button class="badge badge-secondary" disable>已收货</button>
                    </c:if>
                    <c:if test="${tOrder.acceptStatus==0}">
                        <button class="badge badge-danger" disable>未收货</button>
                    </c:if>

                </td>
                <td>

                    <c:if test="${tOrder.payStatus==1}">
                        <button class="badge badge-secondary" disable>已支付</button>
                    </c:if>
                    <c:if test="${tOrder.payStatus==0}">
                        <button class="badge badge-danger" disable>未支付</button>
                    </c:if>

                </td>
                <td>
                    <c:choose>

                        <c:when test="${tOrder.payStatus==1 && tOrder.shipStatus ==0}">    <!--如果 -->
                            <a href="/order/shipOrder?orderID=${tOrder.orderId}" class="del btn btn-info">发货</a>&nbsp;
                        </c:when>

                        <c:otherwise>  <!--否则 -->

                            <c:if test="${tOrder.shipStatus ==1}">
                                <button class="del btn btn-secondary" disabled>已发货</button>&nbsp;
                            </c:if>
                            <c:if test="${tOrder.payStatus ==0}">
                                <button class="del btn btn-info" disabled>发货</button>&nbsp;
                            </c:if>
                        </c:otherwise>

                    </c:choose>
<%--                    <c:if test="${tOrder.payStatus==1 && tOrder.shipStatus ==0}">--%>
<%--                        <a href="/deleteCustomer?id=${user.cid}" class="del btn btn-info">发货</a>&nbsp;--%>
<%--                    </c:if>--%>


                    <c:if test="${tOrder.shipStatus ==1 && tOrder.acceptStatus==1}">
                        <a href="/order/deleteOrder?orderID=${tOrder.orderId}" class="del btn btn-danger">删除</a>&nbsp;
                    </c:if>
                    <c:if test="${tOrder.shipStatus ==0}">
                        <button class="del btn btn-danger" disabled>删除</button>&nbsp;
                    </c:if>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav aria-label="...">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <a class="page-link" href="/order/getAllOrder?currentPage=1">首页</a>
            </li>
            <li class="page-item ">
                <a class="page-link" href="/order/getAllOrder?currentPage=${pagesListTorder.getPrePage()}">上一页</a>
            </li>

            <c:forEach items="${pagesListTorder.getPageListNum()}" var="num" varStatus="statusNum">
                <%--                <input value="${statusNum.count}" id="hid1">--%>
                <%--                <input value="${pagesList.getCurrentPage()}" id="hid2">--%>
                <li class="page-item" id="hidLink">
                    <a class="page-link" href="/order/getAllOrder?currentPage=${statusNum.count}">${statusNum.count}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/order/getAllOrder?currentPage=${pagesListTorder.getNextPage()}">下一页</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/order/getAllOrder?currentPage=${pagesListTorder.getTotalPage()}">尾页</a>
            </li>
        </ul>
    </nav>
</div>

</body>

</html>