package com.baidu.service.impl;

import com.baidu.dao.ShopCartMapper;
import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import com.baidu.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopCartServiceImpl implements ShopCartService {

    @Autowired
    ShopCartMapper shopCartMapper;

    @Override
    public List<ShopCart> getAllShopCart() {
        return shopCartMapper.getAllShopCart();
    }

    @Override
    public void addOrderToShopCart(ShopCart shopCart) {
        shopCartMapper.addOrderToShopCart(shopCart);
    }

    @Override
    public void deleteOrderFromShopCartByID(Integer id) {
        shopCartMapper.deleteOrderFromShopCartByID(id);
    }

    @Override
    public ShopCart getShopCartByID(Integer id) {
        return shopCartMapper.getShopCartByID(id);
    }

    @Override
    public void updateShopCart(ShopCart shopCart) {
        shopCartMapper.updateShopCart(shopCart);
    }

    @Override
    public List<ShopCart> ShopTorderNum(Integer[] orderIdLsit) {
        return shopCartMapper.ShopTorderNum(orderIdLsit);
    }

    @Override
    public int count(Integer user_id) {
       return shopCartMapper.count(user_id);
    }

    @Override
    public List<ShopCart> getByPageShop(Integer currentPage, Integer pageSize, Integer id) {
        int s = (currentPage-1)*pageSize;

        List<ShopCart> byPageShop = shopCartMapper.getByPageShop(s, pageSize,id);

        return byPageShop;
    }

    @Override
    public List<ShopCart> SearchShopCart(String ShopVal, Integer id) {
        List<ShopCart> shopCarts = shopCartMapper.SearchShopCart(ShopVal, id);
        return shopCarts;
    }
    @Override
    public List<ShopCart> getAllShopCartById(Integer id){
        List<ShopCart> allShopCartById = shopCartMapper.getAllShopCartById(id);
        return allShopCartById;
    }

}
