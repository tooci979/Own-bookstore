package com.baidu.controller;

import com.baidu.pojo.Classify;
import com.baidu.pojo.User;
import com.baidu.service.UserService;
import com.baidu.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request, HttpSession session) {
        System.out.println("--------Login--------");
        System.out.println("User: " + user);

        User userLogin = userService.login(user);
        System.out.println(userLogin);
        if (userLogin != null) {
            session.setAttribute("user2", userLogin);
            return "main";
        } else {
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("/getAllUser")
    public String getAllUser(HttpSession session) {
        System.out.println("--------getAllUser--------");
        List<User> users = userService.getAllUser();
        session.setAttribute("userList", users);
        return "/manage/userDetail";
    }

    @RequestMapping("/addUser")
    public String addUser(HttpSession session, User user) {
        System.out.println("--------addUser--------");

        int i = userService.addUser(user);
        return "redirect:/user/getAllUser";
    }

    @RequestMapping("/registerUser")
    public String registerUser(User user) {
        System.out.println("--------registerUser--------");
        System.out.println(user);
        int i = userService.addUser(user);
        return "redirect:/login.jsp";
    }

    @RequestMapping("/checkName")
    @ResponseBody
    public boolean checkName(String name) {
        System.out.println("--------checkName--------");
        User user = userService.registerCheckName(name);
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    //
    @RequestMapping("/deleteById")
    public String deleteById(HttpSession session, Integer id) {
        System.out.println("--------deleteById--------");

        userService.deleteById(id);

        return "redirect:/user/getAllUser";
    }

    @RequestMapping("/toEdit")
    public String toEdit(Integer user_id, HttpServletRequest request) {
        System.out.println("--------toEdit--------");
        User user = userService.findUser(user_id);
        request.setAttribute("edit", user);
        return "updateUser";

    }

    @RequestMapping("/getUserById")
    public String getUserById(Integer id, HttpSession session) {
        System.out.println("--------getUserById--------");
        System.out.println("id----" + id);
        User user = userService.findUser(id);
        System.out.println("user*----" + user);
        session.setAttribute("user4", user);
        return "/user/updateUserTable";

    }

    //修改个人信息
    @RequestMapping("/personDetailUpdate")
    public String personDetailUpdate(User user,Integer user_id) {
        System.out.println("--------personDetailUpdate--------");
        System.out.println("user:   " + user);
        if(user.getRoles()==null){
            user.setRoles(2);
        }
        userService.personDetailUpdate(user);

        return "redirect:/user/toEdit?user_id="+user_id;
    }


    @RequestMapping("/getAllOredrByUserName")
    public String getAllOredrByUserName(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "4") Integer pageSize,
            String name, HttpSession session) {
        System.out.println("--------getAllOredrByUserName--------");
        System.out.println("name:  =======> " + name);

        List<User> allOredrByUserName = userService.getAllOredrByUserNamePage(currentPage, pageSize, name);
        session.setAttribute("UserOredrList", allOredrByUserName);
        Pages pages = new Pages();
        pages.setCurrentPage(currentPage);
        pages.setPageSize(pageSize);
        int total = userService.count(name);
        pages.setTotalCount(total);

        session.setAttribute("pagesListUserOrder", pages);

        return "/user/userOrder";
    }

    @RequestMapping("/recharge")
    public String recharge(User user) {
        System.out.println("--------recharge--------");
        System.out.println("user:  =======> " + user);
        userService.recharge(user);
        return "home";
    }

    //   退出
    @RequestMapping("/quit")
    public String quit(HttpSession session) {
        System.out.println("----quit---------");
//        清空session
        session.invalidate();
        return "redirect:/login.jsp";
    }

    @RequestMapping("/getUserListByName")
    @ResponseBody
    public List<User> getUserListByName(String name) {
        System.out.println("--------getUserListByName---------");
        System.out.println("name----------------" + name);
        return userService.getUserListByName(name);
    }

    //验证电话号码的唯一性
    @RequestMapping("/checkPhone")
    @ResponseBody
    public boolean checkPhone(String phone) {
        System.out.println("--------checkPhone---------");
        System.out.println("phone----------------" + phone);
        User user = userService.checkPhone(phone);
        if (user != null)
            return true;
        else
            return false;
    }

}
