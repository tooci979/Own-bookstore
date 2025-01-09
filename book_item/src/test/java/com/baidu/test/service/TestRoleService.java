package com.baidu.test.service;

import com.baidu.pojo.Role;
import com.baidu.pojo.User;
import com.baidu.service.RoleService;
import com.baidu.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class TestRoleService {

    @Autowired
    RoleService roleService;

    @Test
    public void testGetAllRole(){
        List<Role> roles = roleService.getAllRole();
        for (Role role: roles) {
            System.out.println(role);
        }
    }

}
