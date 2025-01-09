package com.baidu.service;

import com.baidu.pojo.Book;
import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TOrderService {
    List<TOrder> getAllOrder();


    void addTOrder1(Integer bookID, Integer userID);
//    addTOrderNotPay 未支付
    void addTOrder2(Integer bookID, Integer userID);

    void updateTOrderPayStatus(Integer id);

    void updateTOrderShipStatus(Integer id);

    TOrder findTOrderByID(Integer id);

    void updateTOrderAcceptStatus(Integer id);

    void deleteTOrder(Integer id);

    void addTOrderList(Integer[] id, String name);

    List<TOrder> getOrderListByName(String name);

    public int count();

    //start当前页
    public List<TOrder> getByPageTorder(Integer currentPage, Integer pageSize);



}
