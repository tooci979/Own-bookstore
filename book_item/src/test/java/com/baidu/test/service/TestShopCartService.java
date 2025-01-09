package com.baidu.test.service;

import com.baidu.pojo.ShopCart;
import com.baidu.service.ShopCartService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class TestShopCartService {

    @Autowired
    ShopCartService shopCartService;
    @Test
    public void testShopTorderNum(){
        Integer[] ints = new Integer[2];
        ints[0]=1;
        ints[1]=8;
        List<ShopCart> shopCarts = shopCartService.ShopTorderNum(ints);
        for (ShopCart o :shopCarts) {
            System.out.println(o);
        }

    }
    @Test
    public void getByPageShop(){
        List<ShopCart> byPageShop = shopCartService.getByPageShop(1, 3, 11);
        for (ShopCart o :byPageShop) {
            System.out.println(o);
        }
    }

    @Test
    public void SearchShopCart(){

        List<ShopCart> shopCarts = shopCartService.SearchShopCart("1", 1);
        for (ShopCart o :shopCarts) {
            System.out.println(o);
        }

    }


}
