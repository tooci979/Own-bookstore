<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <title>管理员查看订单信息</title>

    <link href="/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <link rel="stylesheet" href="/bootstrap-4.6.2-dist//css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/table-center.css">
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
    <style>
        .modal-pay {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .close {
            text-align: center;
        }

        a {
            text-decoration: none;
        }

        /* 购物选项 */

        .crta {
            width: 1226px;
            height: 50px;
            margin: 0 auto;
            text-align: center;
            display: flex;
            background-color: #fff;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            color: #757575;
            margin-top: 30px;
        }

        i {
            font-style: normal;
        }

        .c-left {
            height: 50px;
            font-size: 14px;
            color: #757575;
            text-align: center;
            display: flex;
            align-items: center;
        }


        .cart-total {
            margin-left: 16px;
            padding-left: 16px;
            border-left: 1px solid #eee;
            color: #757575;
            display: inline-block;
            box-sizing: border-box;
        }

        .cart-total i {
            color: #ff6700;
        }


        /* 合计 */

        .total-price {
            color: #ff6700;
        }

        .total-price em {
            font-style: normal;
            font-size: 30px;
        }


        /* 勾选 */

        .noTip {
            width: 200px;
            height: 48px;
            line-height: 48px;
            position: absolute;
            top: -58px;
            right: 0;
            background-color: #fff;
            border: 1px solid #ff6700;
            color: #ff6700;
            text-align: center;
        }


    </style>
    <script type="text/javascript">
        function updateShopCartBtn(id) {
            $.ajax({
                url: "/ShopCart/getShopCartByID",
                data: {"id": id},
                tape: "post",
                dataType: "json",
                success: function (data) {
                    $("[name=cartId]").val(data.cartId)
                    $("[name=author]").val(data.author)
                    $("[name=commodityName]").val(data.commodityName)
                    $("[name=publisher]").val(data.publisher)
                    $("[name=quantity]").val(data.quantity)
                    $("[name=price]").val(data.price)
                    $("[name=total_money]").val(data.total_money)
                }
            })

            $("[name=quantity]").blur(function () {
                let quantity = $("[name=quantity]").val()
                let price = $("[name=price]").val()
                $("[name=total_money]").val(quantity * price)
            })
        }
        //搜索
        function getShopOrder(id){
            let ShopVal = $('.inputShop').val();
            $.ajax({
                url: "/ShopCart/SearchShopCart",
                data: {"ShopVal": ShopVal,"id":id},
                tape: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    $('tBody').children().remove()
                    $.each(data,function (i,data){
                        $('tBody').append(
                            `<tr>
                <td><input class="form-check-input" type="checkbox" value="`+data.cartId+`" id="flexCheckDefault" name="checkBody">
                </td>
                <td class="cartID"> `+data.cartId+`</td>
                <td><img src="`+data.image+`" alt="" class="img-fluid"></td>
                <td>`+data.author+`</td>
                <td>`+data.commodityName+`</td>
                <td>`+data.quantity+`</td>
                <td>`+data.publisher+`</td>
                <td class="total_money">`+data.total_money+`</td>
                <td>
                    <button type="button" onclick="updateShopCartBtn(`+data.cartId+`)" class="btn btn-info"
                            data-toggle="modal" data-target="#update">
                        修改
                    </button>
                    <a href="/ShopCart/deleteOrderFromShopCartByID?id=`+data.cartId+`&user_id=${user2.user_id}"
                       class="del btn btn-danger">删除</a>&nbsp;
                </td>
            </tr>`)
                    })
                    <%--    复选框--%>
                    let checkTop = document.querySelector("[name=checkTop]")
                    let checkBody = document.querySelectorAll("[name=checkBody]")
                    let c_number = document.querySelector('.c-number')  //共几件商品
                    let g_number = document.querySelector('.g-number')  //已选商品
                    let total_money = document.querySelectorAll('.total_money')  //各类商品的价格
                    let total_price = document.querySelector('.total-price em') //将各类商品的价格求和显示在页面上
                    let btnPay = document.querySelector('.btnPay') //结算按钮
                    //结算界面
                    let items = document.querySelector('.items') //结算 商品件数
                    let itemsPrice = document.querySelector('.itemsPrice') //结算 总费用
                    let SelectNumber = document.querySelector('[name=SelectNumber]') //表单发送 选中商品的个数

                    //默认为0
                    g_number.innerHTML=0
                    total_price.innerHTML=0
                    btnPay.classList.add('btnClose')
                    checkTop.checked=false

                    c_number.innerHTML = checkBody.length
                    checkTop.addEventListener("click", function () {



                        let sum = 0
                        if (checkTop.checked === true) {
                            checkBody.forEach(ck => ck.checked = true)
                            g_number.innerHTML = checkBody.length
                            total_money.forEach(e => {
                                sum += parseInt(e.innerHTML)
                            })
                            total_price.innerHTML = sum

                            //判断结算按钮能否点击
                            if(total_price.innerHTML>0){
                                btnPay.classList.remove('btnClose')
                            }else {
                                btnPay.classList.add('btnClose')
                            }

                        } else {
                            checkBody.forEach(ck => ck.checked = false)
                            g_number.innerHTML = 0
                            total_price.innerHTML = 0
                            btnPay.classList.add('btnClose')
                        }
                    })

                    checkBody.forEach(e => {
                        e.addEventListener('click', function () {

                            let selectBook = 0  //记录选中商品个数
                            let sum = 0//计算总价钱
                            for (let index = 0; index < checkBody.length; index++) {
                                if (checkBody[index].checked === true) {
                                    sum += parseInt(total_money[index].innerHTML)
                                    selectBook++
                                }
                            }
                            for (let index = 0; index < checkBody.length; index++) {
                                if (checkBody[index].checked === false) {
                                    checkTop.checked = false
                                    break
                                } else {
                                    checkTop.checked = true
                                }
                            }
                            g_number.innerHTML = selectBook
                            total_price.innerHTML = sum
                            if (sum > 0) btnPay.classList.remove('btnClose')
                            else btnPay.classList.add('btnClose')
                        })
                    })


                    //    结算界面
                    btnPay.addEventListener('click', function () {
                        let shopSelect = []
                        items.innerHTML = g_number.innerHTML
                        itemsPrice.innerHTML = total_price.innerHTML;
                        //    传递数组到后端
                        for (let index = 0; index < checkBody.length; index++) {
                            if (checkBody[index].checked === true) {
                                let cartID = document.querySelectorAll('.cartID')
                                shopSelect.push(cartID[index].innerHTML)
                            }
                        }
                        console.log(shopSelect)
                        let shopList = document.querySelector('.shopList input')
                        shopList.value = JSON.stringify(shopSelect);
                        console.log(typeof shopList.value)
                        SelectNumber.value=g_number.innerHTML
                    })
                }

            })




        }


    </script>
    <style>
        #flexCheckDefault {
            width: 20px;
            height: 20px;
        }

        head #flexCheckDefault {
            position: absolute;
            left: 20px;
        }

        /*  结算==================  */
        .btnPay {

            width: 200px;
            height: 48px;
            line-height: 35px;
            text-align: center;
            font-size: 18px;
            margin-left: 50px;
            vertical-align: top;
            display: inline-block;
            background-color: #ff6700;
            color: white;

        }

        .btnPay:hover {
            background-color: #ff6700;
        }

        .btnClose {
            pointer-events: none;
            color: #b0b0b0;
            background-color: #e0e0e0;
            cursor: not-allowed;
        }
    </style>
</head>

<body>
<nav id="up">
    <ol class="breadcrumb" style="line-height: 35px;">
        <li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
        <li class="breadcrumb-item active" aria-current="page">订单管理</li>
        <li class="breadcrumb-item active" aria-current="page">购物车</li>
    </ol>
</nav>

<div style="width: 95%;margin: auto 30px;" class="card shadow-sm p-3 mb-5 bg-white rounded">

    <div style="display: flex;justify-content: space-between; margin: 15px;">
        <div>
            <a href="/book/getBookAll"
               class="btn btn-primary">添加商品</a>
        </div>
        <div style="display: flex;margin-left: 20px;">
            <input type="text" class="form-control inputShop" placeholder="请输入要查询的商品.." style="width: 240px;">
            <button style="margin-left: 10px;"
                    onclick="getShopOrder(${user2.user_id})"  class="del btn btn-primary">搜索</button>

        </div>
    </div>


    <table class="table table-striped">
        <thead style="text-align: center;">
        <tr class="head ">
            <th>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name="checkTop"
                       style="display: flex">
                <div>全选</div>
            </th>
            <th scope="col">

                订单编号
            </th>
            <th scope="col">商品图片</th>
            <th scope="col">作者</th>
            <th scope="col">商品名</th>
            <th scope="col">购买数量</th>
            <th scope="col">出版社</th>
            <th scope="col">总全额</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${shopCarts}" var="shopCart" varStatus="status">
            <tr>
                <td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" name="checkBody">
                </td>
                <td class="cartID"> ${shopCart.cartId}</td>
                <td><img src="${shopCart.image}" alt="" class="img-fluid"></td>
                <td>${shopCart.author}</td>
                <td>${shopCart.commodityName}</td>
                <td>${shopCart.quantity}</td>
                <td>${shopCart.publisher}</td>
                <td class="total_money">${shopCart.total_money}</td>
                <td>
                    <button type="button" onclick="updateShopCartBtn(${shopCart.cartId})" class="btn btn-info"
                            data-toggle="modal" data-target="#update">
                        修改
                    </button>
                    <a href="/ShopCart/deleteOrderFromShopCartByID?id=${shopCart.cartId}&user_id=${user2.user_id}"
                       class="del btn btn-danger">删除</a>&nbsp;
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <!-- 修改弹框 -->
    <div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">加入购物车</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/ShopCart/updateShopCart" >
                    <div class="modal-body">

                        <input type="hidden" class="form-control" value="" name="cartId" class="in">
                        <input type="hidden" class="form-control" value="" name="price" class="in">
                        <input type="hidden" class="form-control" value="${user2.user_id}" name="user_id" class="in">
                        <div class="form-group">
                            <label >作者：</label>
                            <input type="text" class="form-control" value="" name="author" class="in" readonly>
                        </div>
                        <div class="form-group">
                            <label >商品名：</label>
                            <input type="text" class="form-control" value="" name="commodityName" class="in" readonly>
                        </div>
                        <div class="form-group">
                            <label >出版社：</label>
                            <input type="text" class="form-control" value="" name="publisher" class="in" readonly>
                        </div>
                        <div class="form-group">
                            <label >数量：</label>
                            <input type="number" class="form-control" value="" name="quantity" class="in">
                        </div>
                        <div class="form-group">
                            <label >总金额</label>
                            <input type="number" class="form-control" value="" name="total_money" class="in" readonly>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary" >确认加入</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%--    结算界面--%>
    <div class="modal fade" id="pay" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">购物车结算：</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/ShopCart/PayShopOrder?name=${user2.name}" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>商品件数：</label>
                            <span class="items" style="color: red"></span>
                        </div>
                        <div class="form-group">
                            <label>总费用：</label>
                            <span class="itemsPrice" style="color: red"></span>
                        </div>
                        <div class="shopList">
<%--                            传选中商品 的数组--%>
                            <input value="" type="hidden" name="orderIdLsit">
<%--                            共选中了多少商品--%>
                            <input value="" type="hidden" name="SelectNumber">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" onclick="return alert('结算成功')">结算</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal-pay">
        <div class="c-left">
            <a href="/book/getBookAll" class="back-shopping">继续购物</a>
            <span class="cart-total">共<i class="c-number">3</i> 件商品，已选择
                    <i class="g-number">0</i>件
                </span>
        </div>
        <div class="total-price">
            <span>合计：<em>0</em>元</span>

            <a type="submit" class="btn btnPay btnClose" data-toggle="modal" data-target="#pay" >去结算</a>
        </div>

    </div>
    <nav aria-label="...">
        <ul class="pagination justify-content-end">
            <li class="page-item">
                <a class="page-link" href="/ShopCart/getAllShopCart?currentPage=1&id=${user2.user_id}">首页</a>
            </li>
            <li class="page-item ">
                <a class="page-link" href="/ShopCart/getAllShopCart?currentPage=${pagesListShop.getPrePage()}&id=${user2.user_id}">上一页</a>
            </li>

            <c:forEach items="${pagesListShop.getPageListNum()}" var="num" varStatus="statusNum">
                <%--                <input value="${statusNum.count}" id="hid1">--%>
                <%--                <input value="${pagesList.getCurrentPage()}" id="hid2">--%>
                <li class="page-item" id="hidLink">
                    <a class="page-link" href="/ShopCart/getAllShopCart?currentPage=${statusNum.count}&id=${user2.user_id}">${statusNum.count}</a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="/ShopCart/getAllShopCart?currentPage=${pagesListShop.getNextPage()}&id=${user2.user_id}">下一页</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="/ShopCart/getAllShopCart?currentPage=${pagesListShop.getTotalPage()}&id=${user2.user_id}">尾页</a>
            </li>
        </ul>
    </nav>
</div>
<script type="text/javascript">
    <%--    复选框--%>
        let checkTop = document.querySelector("[name=checkTop]")
        let checkBody = document.querySelectorAll("[name=checkBody]")
        let c_number = document.querySelector('.c-number')  //共几件商品
        let g_number = document.querySelector('.g-number')  //已选商品
        let total_money = document.querySelectorAll('.total_money')  //各类商品的价格
        let total_price = document.querySelector('.total-price em') //将各类商品的价格求和显示在页面上
        let btnPay = document.querySelector('.btnPay') //结算按钮
        //结算界面
        let items = document.querySelector('.items') //结算 商品件数
        let itemsPrice = document.querySelector('.itemsPrice') //结算 总费用
        let SelectNumber = document.querySelector('[name=SelectNumber]') //表单发送 选中商品的个数


        c_number.innerHTML = checkBody.length
        checkTop.addEventListener("click", function () {



            let sum = 0
            if (checkTop.checked === true) {
                checkBody.forEach(ck => ck.checked = true)
                g_number.innerHTML = checkBody.length
                total_money.forEach(e => {
                    sum += parseInt(e.innerHTML)
                })
                total_price.innerHTML = sum

                //判断结算按钮能否点击
                if(total_price.innerHTML>0){
                    btnPay.classList.remove('btnClose')
                }else {
                    btnPay.classList.add('btnClose')
                }

            } else {
                checkBody.forEach(ck => ck.checked = false)
                g_number.innerHTML = 0
                total_price.innerHTML = 0
                btnPay.classList.add('btnClose')
            }
        })

        checkBody.forEach(e => {
            e.addEventListener('click', function () {
                // //判断按钮是否可以点击
                // if(g_number.innerHTML>0) {
                //     btnPay.disabled = false
                // }

                let selectBook = 0  //记录选中商品个数
                let sum = 0//计算总价钱
                for (let index = 0; index < checkBody.length; index++) {
                    if (checkBody[index].checked === true) {
                        sum += parseInt(total_money[index].innerHTML)
                        selectBook++
                    }
                }
                for (let index = 0; index < checkBody.length; index++) {
                    if (checkBody[index].checked === false) {
                        checkTop.checked = false
                        break
                    } else {
                        checkTop.checked = true
                    }
                }
                g_number.innerHTML = selectBook
                total_price.innerHTML = sum
                if (sum > 0) btnPay.classList.remove('btnClose')
                else btnPay.classList.add('btnClose')
            })
        })


        //    结算界面
        btnPay.addEventListener('click', function () {
            let shopSelect = []
            items.innerHTML = g_number.innerHTML
            itemsPrice.innerHTML = total_price.innerHTML;
            //    传递数组到后端
            for (let index = 0; index < checkBody.length; index++) {
                if (checkBody[index].checked === true) {
                    let cartID = document.querySelectorAll('.cartID')
                    shopSelect.push(cartID[index].innerHTML)
                }
            }
            console.log(shopSelect)
            let shopList = document.querySelector('.shopList input')
            shopList.value = JSON.stringify(shopSelect);
            console.log(typeof shopList.value)
            console.log(g_number.innerHTML)
            SelectNumber.value=g_number.innerHTML
        })



</script>

<script src="/js/jquery-3.7.1.js"></script>
<!-- 压缩版的bootstrap.min.js包含了所有的Bootstrap数据API插件 -->
<script src="/bootstrap-4.6.2-dist/js/bootstrap.min.js"></script>
</body>

</html>