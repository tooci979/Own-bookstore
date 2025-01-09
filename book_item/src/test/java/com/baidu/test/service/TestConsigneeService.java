package com.baidu.test.service;

import com.baidu.dao.ConsigneeMapper;
import com.baidu.pojo.Consignee;
import com.baidu.pojo.User;
import com.baidu.service.ConsigneeService;
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
public class TestConsigneeService {

    @Autowired
    ConsigneeService consigneeService;

    @Test
    public void getAllConsignee(){
        List<Consignee> allConsignee = consigneeService.getAllConsignee(1);
        for (Consignee o :allConsignee) {
            System.out.println(o);
        }

    }

    @Test
    public void getbyid(){
//        System.out.println(consigneeService.getConsigneeByID(1));
    }



}
