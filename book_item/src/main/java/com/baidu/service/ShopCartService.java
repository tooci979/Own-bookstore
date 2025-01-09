package com.baidu.service;

import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopCartService {

    List<ShopCart> getAllShopCart();

    void addOrderToShopCart(ShopCart shopCart);

    void deleteOrderFromShopCartByID(Integer id);

    ShopCart getShopCartByID(Integer id);

    void updateShopCart(ShopCart shopCart);


    public List<ShopCart> ShopTorderNum(Integer orderIdLsit[]);

    public int count(Integer user_id);

    List<ShopCart> getByPageShop(Integer currentPage, Integer pageSize, Integer id);

    //    搜索
    List<ShopCart> SearchShopCart(String ShopVal, Integer id);

    List<ShopCart> getAllShopCartById(Integer id);

}
