package com.baidu.test.service;

import com.baidu.pojo.Book;
import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import com.baidu.service.TOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class TestTOrderService {

    @Autowired
    TOrderService tOrderService;

    @Test
    public void testGetAllOrder(){
        List<TOrder> orders = tOrderService.getAllOrder();
        for(TOrder order:orders){
            System.out.println(order);
        }
    }

    @Test
    public void testAddOrder(){
        tOrderService.addTOrder1(6,1);
    }


    @Test
    public void addTOrderList(){
        Integer[] a = {1,8};
        tOrderService.addTOrderList(a,"admin");
    }

    @Test
    public void testfindTOrderByID(){
        TOrder tOrderByID = tOrderService.findTOrderByID(21);
        System.out.println(tOrderByID);

    }
    //    测试分页
    @Test
    public void testCount() {
        System.out.println("-----testCount-----");
        int count = tOrderService.count();

        System.out.println("total=" + count);
        System.out.println("-----测试分页查询-----");
        List<TOrder> byPageHome = tOrderService.getByPageTorder(1, 4);

        for (TOrder o : byPageHome) {
            System.out.println(o);
        }
    }
}
