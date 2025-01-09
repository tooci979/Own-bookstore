package com.baidu.test.service;

import com.baidu.pojo.Book;
import com.baidu.pojo.TOrder;
import com.baidu.pojo.User;
import com.baidu.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class TestUserService {

    @Autowired
    UserService userService;

    @Test
    public void testLogin(){
        User user = new User();
        user.setName("admin");
        user.setPassword("123456");
        User user1 = userService.login(user);
        System.out.println(user1);
    }

    @Test
    public void testGetAllUser(){
        List<User> users = userService.getAllUser();
        for (User user: users) {
            System.out.println(user);
        }
    }

//    @Test
//    public void testaddUser(){
//        User a = new User(1,"123","123132",18,new Date(),1,200,"12315",null,null);
//        userService.addUser(a);
//    }

    @Test
    public void testFindUser(){
        User user = userService.findUser(1);
        System.out.println(user);
    }

    @Test
    public void testUpdate(){
        User user = new User();
        user.setAge(20000);
        user.setUser_id(1);
        userService.personDetailUpdate(user);
    }


    @Test
    public void getAllOredrByUserName() {

        List<User> admin = userService.getAllOredrByUserName("admin");
        for (User o :admin) {
            System.out.println(o);

            for (TOrder o1 :o.getTOrder()) {
                System.out.println(o1.getShipStatus());
            }

        }

    }
    //    测试分页
    @Test
    public void testCount() {
        System.out.println("-----testCount-----");
        int count = userService.count("admin");

        System.out.println("total=" + count);
        System.out.println("-----测试分页查询-----");
        List<User> byPageHome = userService.getAllOredrByUserNamePage(1, 4,"admin");

        for (User o : byPageHome) {
            System.out.println(o);
        }
    }
    @Test
    public void testCheckPhone() {
        User user = userService.checkPhone("123");
        System.out.println(user);
    }

}
