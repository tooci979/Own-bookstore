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

    <title>My JSP 'list.jsp' starting page</title>
    <link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="/css/table-center.css">
    <script type="text/javascript">
        function addShopCart(id) {
            $("[name=quantity]").val(1)
            $.ajax({
                url: "/ShopCart/getBookById",
                data: {"id": id},
                tape: "post",
                dataType: "json",
                success: function (data) {
                    $("[name=author]").val(data.author)
                    $("[name=commodityName]").val(data.bookName)
                    $("[name=publisher]").val(data.publisher)
                    $("[name=price]").val(data.price)
                    $("[name=image]").val(data.image)
                    $("[name=total_money]").val(data.price)

                    // $("[name=totalMoney]").val(parseInt(data.price) * parseInt($("name=quantity").val()))
                }
            })


            $("[name=quantity]").blur(function () {
                let quantity = $("[name=quantity]").val()
                let price = $("[name=price]").val()
                $("[name=total_money]").val(quantity * price)
            })

        }

        let a = 0

        function buyProduct(id, price) {
            $("#buyID").val(id)
            $("#buyID2").val(id)
            $('#shopPrice').html(price)
            a = price
        }

        function pay(homeUserMoney) {
            console.log(a)
            console.log(homeUserMoney)
            console.log(homeUserMoney < a)
            if (homeUserMoney < a) {
                alert('支付失败，余额不足，商品已添加至订单')
            } else {
                alert('支付成功，商品已添加至订单')
            }
        }


        //	分类
        $(function () {
            $('#BookType').on('change', function () {
                console.log($(this).val())
                $.ajax({
                    url: "/book/getClassifyAllByType",
                    data: {"id": $(this).val()},
                    tape: "post",
                    dataType: "json",
                    success: function (data) {
                        console.log(data)
                        $('tBody').children().remove()
                        $.each(data, function (i, book) {
                            console.log(book.bookID)
                            $('tBody').append(
                                ` <tr>
                                    <td>1</td>
                                    <td>` + book.bookID + `</td>
                                    <td><img src=` + book.image + ` alt="" class="img-fluid"></td>
                                    <td>` + book.author + `</td>
                                    <td>` + book.bookName + `</td>
                                    <td>` + book.publisher + `</td>
                                    <td>` + book.price + `</td>
                                    <td>` + book.classify.classificationName + `</td>
                                        <%--						<td>${book.classficiton.classficitonName}</td>--%>
                                    <c:if test="${user2.roles!=1}">
                                    <td>
                                        <!-- ajax获取购物车数据 渲染到内嵌表单上 -->
                                        <button type="button" onclick="addShopCart(` + book.bookID + `)" class="btn btn-info" data-toggle="modal"
                                                data-target="#exampleModal">
                                            加入购物车
                                        </button>
                                        <!-- 通过id发送请求 将对应的商品加入到 订单页 -->
                                        <button type="button" class="del btn btn-danger" data-toggle="modal" data-target="#confirm">
                                            购买
                                        </button>
                                    </td>
                                    </c:if>
                                </tr>

                                `
                            )
                        });
                    }
                })
            })


            $(".searchBookByName").click(function () {
                let id = $("#BookType").val()
                let name = $(".inputName").val()
                $.ajax({
                    url: "/book/searchBookByName",
                    data: {
                        "classificationId": id,
                        "bookName": name
                    },
                    tape: "post",
                    dataType: "json",
                    success: function (data) {
                        $('tBody').children().remove()
                        $.each(data, function (i, book) {
                            console.log(book.bookID)
                            $('tBody').append(
                                ` <tr>
                                    <td>1</td>
                                    <td>` + book.bookID + `</td>
                                    <td><img src=` + book.image + ` alt="" class="img-fluid"></td>
                                    <td>` + book.author + `</td>
                                    <td>` + book.bookName + `</td>
                                    <td>` + book.publisher + `</td>
                                    <td>` + book.price + `</td>
                                    <td>` + book.classify.classificationName + `</td>
                                        <%--						<td>${book.classficiton.classficitonName}</td>--%>
                                    <c:if test="${user2.roles!=1}">
                                    <td>
                                        <!-- ajax获取购物车数据 渲染到内嵌表单上 -->
                                        <button type="button" onclick="addShopCart(` + book.bookID + `)" class="btn btn-info" data-toggle="modal"
                                                data-target="#exampleModal">
                                            加入购物车
                                        </button>
                                        <!-- 通过id发送请求 将对应的商品加入到 订单页 -->
                                        <button type="button" onclick="buyProduct(`+book.bookID+`,`+book.price+`)"
                                        class="del btn btn-danger" data-toggle="modal" data-target="#confirm">
                                            购买
                                        </button>
                                    </td>
                                    </c:if>
                                </tr>

                                `
                            )
                        });
                    }
                })
            })
        })

    </script>
</head>

<body>
<nav id="up">
    <ol class="breadcrumb" style="line-height:10px;">
        <li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
    </ol>

</nav>

<div style="width: 98%;margin: auto 10px;" class="card shadow-sm p-3 mb-5 bg-white rounded ">
    <div style="display: flex;justify-content: end; margin: 15px;">
        <div>
            <select id="BookType" class="form-control" style="width: 240px;">
                <option value="0">请选择...</option>
                <c:forEach items="${classifyAllList}" var="dept" varStatus="status">
                    <option value="${dept.classificationId}">${dept.classificationName}</option>
                </c:forEach>
            </select>
        </div>
        <div style="display: flex;margin-left: 20px;">
            <input type="text" class="form-control inputName" placeholder="请输入要查询的书名.." style="width: 240px;">
            <%--				<a style="margin-left: 10px;" href="/deleteCustomer?id=${user.cid}" class="del btn btn-primary">搜索</a>--%>
            <a style="margin-left: 10px;" href="#" class="searchBookByName del btn btn-primary">搜索</a>
        </div>


    </div>

    <table class="table table-striped">
        <thead style="text-align: center;">
        <tr class="head ">
            <th scope="col">序号</th>
            <th scope="col">主键</th>

            <th scope="col">商品图片</th>
            <th scope="col">作者</th>
            <th scope="col">商品名</th>
            <th scope="col">出版社</th>
            <th scope="col">单价</th>
            <th scope="col">书籍类型</th>
            <c:if test="${user2.roles!=1}">
                <th scope="col">操作</th>
            </c:if>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${BookList }" var="book" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${book.bookID}</td>
                <td><img src="${book.image}" alt="" class="img-fluid"></td>
                <td>${book.author}</td>
                <td>${book.bookName}</td>
                <td>${book.publisher}</td>
                <td>${book.price}</td>
                <td>${book.classify.classificationName}</td>
                    <%--						<td>${book.classficiton.classficitonName}</td>--%>
                <c:if test="${user2.roles!=1}">
                    <td>

                        <!-- ajax获取购物车数据 渲染到内嵌表单上 -->
                        <button type="button" onclick="addShopCart(${book.bookID})" class="btn btn-info"
                                data-toggle="modal"
                                data-target="#exampleModal">
                            加入购物车
                        </button>
                        <!-- 通过id发送请求 将对应的商品加入到 订单页 -->
                        <button type="button" onclick="buyProduct(${book.bookID},${book.price})"
                                class="del btn btn-danger"
                                data-toggle="modal" data-target="#confirm">
                            购买
                        </button>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 内嵌弹框 -->
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">加入购物车</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/ShopCart/addOrderToShopCart">
                    <div class="modal-body">
                        <input type="hidden" class="form-control" value="" name="price" class="in">
                        <input type="hidden" class="form-control" value="" name="cartId" class="in">
                        <input type="hidden" class="form-control" value="" name="image" class="in">
                        <input type="hidden" class="form-control" value="${user2.user_id}" name="user_id" class="in">
                        <div class="form-group">
                            <label for="inputEmail4">作者：</label>
                            <input type="text" class="form-control" value="" name="author" class="in" readonly>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail4">商品名：</label>
                            <input type="text" class="form-control" value="" name="commodityName" class="in" readonly>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail4">出版社：</label>
                            <input type="text" class="form-control" value="" name="publisher" class="in" readonly>
                        </div>
                        <div class="form-group">
                            <label>数量：</label>
                            <input type="number" class="form-control" value="1" name="quantity" class="in">
                        </div>
                        <div class="form-group">
                            <label>总金额</label>
                            <input type="number" class="form-control" value="" name="total_money" class="in" readonly>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" onclick="return alert('成功加入购物车！')">确认加入</button>
                        <%--							<a href="/ShopCart/addOrderToShopCart" class="btn btn-primary">确认加入</a>--%>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 购买弹框 -->
    <div class="modal fade" id="confirm" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">确定购买吗？</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"
                            data-target="#pay">确认
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="pay" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
         data-backdrop="static">
        <div class="modal-dialog ">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">立即付款：</h5>
                </div>
                <div class="modal-body">
                    需支付<span id="shopPrice" style="color: red"></span>元
                    <input value="${user2.money}" id="moneyUser" type="hidden">
                </div>
                <div style="display: flex;justify-content: end">

                    <form action="/order/addTOrderNotPay" method="post">
                        <input type="hidden" name="bookID" id="buyID2" value="">
                        <input type="hidden" name="userID" value="${user2.user_id}">
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-secondary" onclick="return alert('取消支付，商品已添加至订单...')">
                                取消
                            </button>
                        </div>

                    </form>
                    <form action="/order/addTOrder" method="post">
                        <input type="hidden" name="bookID" id="buyID" value="">
                        <input type="hidden" name="userID" value="${user2.user_id}">
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary" onclick="pay(${HomeUser.money})">付款</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <nav aria-label="...">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <a class="page-link" href="/book/getBookAll?currentPage=1">首页</a>
            </li>
            <li class="page-item ">
                <a class="page-link" href="/book/getBookAll?currentPage=${pagesList.getPrePage()}">上一页</a>
            </li>

            <c:forEach items="${pagesList.getPageListNum()}" var="num" varStatus="statusNum">
                <%--                <input value="${statusNum.count}" id="hid1">--%>
                <%--                <input value="${pagesList.getCurrentPage()}" id="hid2">--%>
                <li class="page-item" id="hidLink">
                    <a class="page-link" href="/book/getBookAll?currentPage=${statusNum.count}">${statusNum.count}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/book/getBookAll?currentPage=${pagesList.getNextPage()}">下一页</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/book/getBookAll?currentPage=${pagesList.getTotalPage()}">尾页</a>
            </li>
        </ul>
    </nav>
</div>

<script type="text/javascript">
    // 页码选中变色
    <%--for (let i = 0; i < $('#hid1').length; i++) {--%>
    <%--    if($(`#hid1:eq()`).val() == $('#hid2').val()) {--%>
    <%--        let i =$('#hid2').val()--%>
    <%--        console.log($("#hidLink:eq(0)"))--%>
    <%--        $(`#hidLink:eq(${i-1})`).addClass('active')--%>
    <%--    }--%>
    <%--}--%>


</script>

<script src="/js/jquery-3.7.1.js"></script>
<!-- 压缩版的bootstrap.min.js包含了所有的Bootstrap数据API插件 -->
<script src="/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>
</body>

</html>