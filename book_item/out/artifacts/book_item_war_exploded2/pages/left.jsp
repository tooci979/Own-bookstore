<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>left</title>
    <link rel="stylesheet" href="/css/left.css">
</head>
<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".nav-link #top_a").click(topic, topic);
        function topic() {

            $(this).toggleClass('clickToggle')
            $(this).next("div").slideToggle(200);
            // $(this).css('background-color','#695CFE').children('span').css("color","white")
            $(this).next("div").css('background-color', '#f4f4f4').css("border-radius", "6px")

            $(this).parent("li").siblings("li").children('div').slideUp(200).siblings("a").removeClass('clickToggle');
        }
    });
    $(function () {
        $('.zi').click(function () {
            $('.first').removeClass('clickToggle');
        })
    })

</script>

<body>

    <nav class="shell">
        <header>
            <!-- <a href="/pages/home.jsp" target="con" style="text-decoration:none;"> -->
            <div class="image-text" style="height: 60px;display: flex;">
                <span class="image">
                    <svg width="16" height="16" fill="currentColor" id="imgs"
                        class="bi bi-menu-button-wide-fill iconfont icon-shouye icon" viewBox="0 0 16 16">
                        <path
                            d="M1.5 0A1.5 1.5 0 0 0 0 1.5v2A1.5 1.5 0 0 0 1.5 5h13A1.5 1.5 0 0 0 16 3.5v-2A1.5 1.5 0 0 0 14.5 0h-13zm1 2h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1zm9.927.427A.25.25 0 0 1 12.604 2h.792a.25.25 0 0 1 .177.427l-.396.396a.25.25 0 0 1-.354 0l-.396-.396zM0 8a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8zm1 3v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2H1zm14-1V8a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2h14zM2 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z" />
                    </svg>
                </span>
                <div class="text logo-text">
                    <span class="name">图书管理系统</span>
                </div>
            </div>
            <!-- </a> -->

        </header>
        <div class="menu-bar">
            <div class="menu">
                <li class="search-box">
                    <i class="iconfont icon-sousuo icon"></i>
                    <input type="text" placeholder="搜索...">
                </li>
                <ul class="menu-links">
                    <!-- 首页 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="/book/getBookAll " target="con" style="height: 50px;" id="top_a" class="first">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->

                            <svg width="16" height="16" fill="currentColor"
                                class="bi bi-menu-button-wide-fill iconfont icon-shouye icon" viewBox="0 0 16 16"
                                id="imgs">
                                <path
                                    d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146ZM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5Z" />
                            </svg>



                            <span class="text nac-text spans">首页</span>
                        </a>
                    </li>
                    <!-- 个人中心 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->

                            <svg width="16" height="16" fill="currentColor"
                                class="bi bi-menu-button-wide-fill iconfont icon-shouye icon" viewBox="0 0 16 16"
                                id="imgs">>
                                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />

                            </svg>
                            <span class="text nac-text spans">个人信息管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/updateUser.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--个人中心</span>
                            </a>
                        </div>
                    </li>

                    <!-- 用户管理 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->

                            <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-people-fill icon"
                                viewBox="0 0 16 16">
                                <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
                                <path fill-rule="evenodd"
                                    d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z" />
                                <path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
                            </svg>
                            <span class="text nac-text spans">用户管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/manage/userDetail.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--用户列表</span>
                            </a>
                        </div>
                    </li>

                    <!-- 分类管理 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->

                            <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-x-diamond-fill icon" viewBox="0 0 16 16">
                                <path d="M9.05.435c-.58-.58-1.52-.58-2.1 0L4.047 3.339 8 7.293l3.954-3.954L9.049.435zm3.61 3.611L8.708 8l3.954 3.954 2.904-2.905c.58-.58.58-1.519 0-2.098l-2.904-2.905zm-.706 8.614L8 8.708l-3.954 3.954 2.905 2.904c.58.58 1.519.58 2.098 0l2.905-2.904zm-8.614-.706L7.292 8 3.339 4.046.435 6.951c-.58.58-.58 1.519 0 2.098l2.904 2.905z"/>
                              </svg>
                            <span class="text nac-text spans">分类管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/manage/bookType.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--书籍分类列表</span>
                            </a>
                        </div>
                    </li>

                    <!-- 书籍管理 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->
                            <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-journal-text icon" viewBox="0 0 16 16">
                                <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
                                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
                              </svg>
                            <span class="text nac-text spans">书籍管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/manage/manageBook.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--书籍列表</span>
                            </a>
                        </div>
                    </li>
                    <!-- 订单管理 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->
                              <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-bookmark-check-fill icon" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                              </svg>
                            <span class="text nac-text spans">订单管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/manage/mangeOrder.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--订单列表</span>
                            </a>
                        </div>
                    </li>

                    <span>======用户left======</span>
                    <!-- ==================== 用户 left界面 -->
                    <!-- 收获地址 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->
                            <svg  id="imgs" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill icon" viewBox="0 0 16 16">
                                <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                              </svg>
                            <span class="text nac-text spans">收获地址管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/user/cneeAddress.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--收获地址列表</span>
                            </a>
                        </div>
                    </li>


                    <!-- 订单管理 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="#" style="height: 50px;" id="top_a">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->

                            <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-bookmark-check-fill icon" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                              </svg>
                            <span class="text nac-text spans">订单管理</span>
                            <svg width="16" height="16" fill="currentColor " class="bi bi-chevron-right "
                                viewBox="0 0 16 16" id="arrows">
                                <path fill-rule="evenodd"
                                    d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z" />
                            </svg>
                        </a>
                        <div class="zi">
                            <a href="/pages/user/userOrder.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--订单列表</span>
                            </a>
                            <a href="/pages/user/shopCart.jsp" target="con" style="height: 35px;">
                                <span class="text nac-text" style="text-align: center;width: 100%;">--购物车</span>
                            </a>
                        </div>
                    </li>

                    <!-- 充值 -->
                    <li class="nav-link" style="display: inline;">
                        <a href="/pages/user/userRecharge.jsp" target="con" style="height: 50px;" id="top_a"
                           class="first">
                            <!-- <i class="iconfont icon-shouye icon"></i> -->
                            <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-currency-exchange icon" viewBox="0 0 16 16">
                                <path d="M0 5a5.002 5.002 0 0 0 4.027 4.905 6.46 6.46 0 0 1 .544-2.073C3.695 7.536 3.132 6.864 3 5.91h-.5v-.426h.466V5.05c0-.046 0-.093.004-.135H2.5v-.427h.511C3.236 3.24 4.213 2.5 5.681 2.5c.316 0 .59.031.819.085v.733a3.46 3.46 0 0 0-.815-.082c-.919 0-1.538.466-1.734 1.252h1.917v.427h-1.98c-.003.046-.003.097-.003.147v.422h1.983v.427H3.93c.118.602.468 1.03 1.005 1.229a6.5 6.5 0 0 1 4.97-3.113A5.002 5.002 0 0 0 0 5zm16 5.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0zm-7.75 1.322c.069.835.746 1.485 1.964 1.562V14h.54v-.62c1.259-.086 1.996-.74 1.996-1.69 0-.865-.563-1.31-1.57-1.54l-.426-.1V8.374c.54.06.884.347.966.745h.948c-.07-.804-.779-1.433-1.914-1.502V7h-.54v.629c-1.076.103-1.808.732-1.808 1.622 0 .787.544 1.288 1.45 1.493l.358.085v1.78c-.554-.08-.92-.376-1.003-.787H8.25zm1.96-1.895c-.532-.12-.82-.364-.82-.732 0-.41.311-.719.824-.809v1.54h-.005zm.622 1.044c.645.145.943.38.943.796 0 .474-.37.8-1.02.86v-1.674l.077.018z"/>
                              </svg>
                            <span class="text nac-text spans">充值中心</span>
                        </a>
                    </li>



                </ul>
            </div>
            <div class="bottom-content">
                <li class="">
                    <a href="#">
                        <svg id="imgs" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left icon" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                            <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                          </svg>
                        <span class="text nac-text">注销</span>
                    </a>
                </li>
            </div>
        </div>

    </nav>

</body>


<script>

    // const body = document.querySelector('body'),
    //     shell = body.querySelector('nav'),
    //     toggle = body.querySelector(".toggle"),
    //     searchBtn = body.querySelector(".search-box"),
    //     modeSwitch = body.querySelector(".toggle-switch"),
    //     modeText = body.querySelector(".mode-text");
    // // 点击toggle元素时触发事件
    // toggle.addEventListener("click", () => {
    //     // 切换shell元素的close类
    //     shell.classList.toggle("close");
    // })
    // // 点击searchBtn元素时触发事件
    // searchBtn.addEventListener("click", () => {
    //     // 移除shell元素的close类
    //     shell.classList.remove("close");
    // })
    // // 点击modeSwitch元素时触发事件
    // modeSwitch.addEventListener("click", () => {
    //     // 切换body元素的dark类
    //     body.classList.toggle("dark");
    //     // 如果body元素包含dark类
    //     if (body.classList.contains("dark")) {
    //         modeText.innerText = "白日模式";
    //     } else {
    //         modeText.innerText = "夜间模式";
    //     }
    // });


</script>

</html>