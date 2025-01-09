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

  <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
  <link rel="stylesheet" href="/css/table-center.css">
  <style>
    #flexCheckDefault {
      width: 20px;
      height: 20px;
    }

    head #flexCheckDefault {
      position: absolute;
      left: 20px;
    }

    .moneys {
      display: flex;
      justify-content: space-around;
      width: 40%;
    }

    .moneys .box {
      display: flex;
      flex-direction: column;
      justify-content: space-between;

    }

    .moneys .box input {
      background-color: white;
    }

    .moneys div {
      width: 80px;
      margin-bottom: 10px;

    }

    .sunMoney {
      width: 60%;
    }
  </style>
</head>

<body>
  <nav id="up">
    <ol class="breadcrumb" style="line-height: 35px;">
      <li class="breadcrumb-item"><a href="admin/welcome">平台首页</a></li>
      <li class="breadcrumb-item active" aria-current="page">充值中心</li>
    </ol>
  </nav>

  <div style="width: 60%;margin: 40px auto" class="card shadow-sm p-3 mb-5 bg-white rounded">

    <h2>充值中心</h2>
    <form action="/user/recharge" method="get">

      <div>
        <div class="form-group" style="display: flex;line-height: 40px">
          <label for="inputPhone">手机号：</label>
          <input type="text" class="form-control" name="phone" class="in" placeholder="请输入手机号.."
            style="width:70%;height: 40px;">
        </div>

        <div style="display: flex;line-height: 40px">
          <label>充值金额：</label>
          <div class="moneys">
            <div class="box">
              <div>
                <input type="type" class="form-control" readonly name="money1" value="50">
              </div>
              <div>
                <input type="type" class="form-control" readonly name="money1" value="300">
              </div>

            </div>
            <div class="box">
              <div>
                <input type="type" class="form-control" readonly name="money1" value="100">
              </div>
              <div>
                <input type="type" class="form-control" readonly name="money1" value="500">
              </div>
            </div>
            <div class="box">
              <div>
                <input type="type" class="form-control" readonly name="money1" value="200">
              </div>

              <div style="width: 100px;">
                <input type="type" class="form-control" name="userDefind" value="" placeholder="自定义">
              </div>
            </div>



          </div>
        </div>

        <div style="display: flex;line-height: 40px">
          <label>销售金额：</label>
          <div style="display: flex;justify-content: space-between;width:200px">
            <div style="color: red;font-size: 30px;" class="sumprice">
              <!-- <span id="spans">50</span> -->
              <input type="text" name="money" id="" value="50" readonly style="border: 0px ;color: red;">
            </div>
          </div>
        </div>

        <button type="submit" class="btn btn-danger">立即充值</button>

      </div>

    </form>

  </div>


  <script>
    let sumprice = document.querySelector('.sumprice input');
    let inputs = document.querySelectorAll('[name=money1]')
    let userDefind = document.querySelector('[name=userDefind]')
    let submit = document.querySelector('[type=submit]')
    inputs.forEach((e,i) => {
      e.addEventListener('click',()=>{
        sumprice.value = inputs[i].value
      })
     
    });
    userDefind.addEventListener('input', () => {
      sumprice.value = userDefind.value
    })
    // money.addEventListener('click', function (e) {
    //   console.log(e)
    //   if (e.target.name = 'money') {
    //     span.value = e.target.defaultValue
    //   }
    //   if (e.target.name = 'userDefind') {
    //     userDefind.addEventListener('input', () => {
    //       span.value = userDefind.value
    //     })
    //   }
    // })
    submit.addEventListener('click', function () {
      inputs.forEach(e => {
        console.log(e.disabled)
        e.disabled = true

      })
      userDefind.disabled=true
    })



  </script>
</body>

</html>