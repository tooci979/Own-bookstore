package com.baidu.service.impl;

import com.baidu.dao.BookMapper;
import com.baidu.dao.ShopCartMapper;
import com.baidu.dao.TOrderMapper;
import com.baidu.dao.UserMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import com.baidu.service.TOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TOrderServiceImpl implements TOrderService {

    @Autowired
    TOrderMapper tOrderMapper;

    @Autowired
    BookMapper bookMapper;

    @Autowired
    ShopCartMapper shopCartMapper;

    @Autowired
    UserMapper userMapper;

    @Override
    public List<TOrder> getAllOrder() {
        return tOrderMapper.getAllOrder();
    }

    @Override
    public void addTOrder1(Integer bookID, Integer userID) {
        Book book = bookMapper.getBookById(bookID);
        TOrder tOrder = new TOrder();
        tOrder.setAuthor(book.getAuthor());
        tOrder.setBookName(book.getBookName());
        tOrder.setQuantity(1);
        tOrder.setOrderTime(new Date());
        tOrder.setShipStatus(0);
        tOrder.setAcceptStatus(0);
        tOrder.setPayStatus(1);
        tOrder.setImage(book.getImage());
        tOrder.setPrice(book.getPrice());
        tOrder.setUser_id(userID);
        tOrderMapper.addTOrder(tOrder);
    }
    @Override
    public void addTOrder2(Integer bookID, Integer userID) {
        System.out.println("触发");
        Book book = bookMapper.getBookById(bookID);
        TOrder tOrder = new TOrder();
        tOrder.setAuthor(book.getAuthor());
        tOrder.setBookName(book.getBookName());
        tOrder.setQuantity(1);
        tOrder.setOrderTime(new Date());
        tOrder.setShipStatus(0);
        tOrder.setAcceptStatus(0);
        tOrder.setPayStatus(0);
        tOrder.setImage(book.getImage());
        tOrder.setPrice(book.getPrice());
        tOrder.setUser_id(userID);
        tOrderMapper.addTOrder(tOrder);
    }

    @Override
    public void updateTOrderPayStatus(Integer id) {
        tOrderMapper.updateTOrderPayStatus(id);
    }

    @Override
    public void updateTOrderShipStatus(Integer id) {
        TOrder order = tOrderMapper.findTOrderByID(id);
        if (order.getPayStatus() == 1){
            tOrderMapper.updateTOrderShipStatus(id);
        }

    }

    @Override
    public TOrder findTOrderByID(Integer id) {
        return tOrderMapper.findTOrderByID(id);
    }

    @Override
    public void updateTOrderAcceptStatus(Integer id) {
        TOrder order = tOrderMapper.findTOrderByID(id);
        if (order.getPayStatus() == 1 && order.getShipStatus() == 1){
            tOrderMapper.updateTOrderAcceptStatus(id);
        }
    }

    @Override
    public void deleteTOrder(Integer id) {
        tOrderMapper.deleteTOrder(id);
    }

    @Override
    public void addTOrderList(Integer[] id,String name) {
        List<ShopCart> shopCarts = shopCartMapper.ShopTorderNum(id);
//        for (int i = 0; i < shopCarts.size(); i++) {
//            TOrder tOrder = new TOrder();
//            shopCarts[i].getAuthor()
//
//        }
        for (ShopCart s:shopCarts) {
            TOrder tOrder = new TOrder(s.getAuthor(),s.getCommodityName(),s.getQuantity(),s.getPrice(),s.getOrderTime(),0,0,1,s.getImage(),userMapper.getUserByName(name).getUser_id());
            tOrderMapper.addTOrder(tOrder);
        }
    }

    @Override
    public List<TOrder> getOrderListByName(String name) {
        return tOrderMapper.getOrderListByName(name);
    }

    @Override
    public int count(){
        return tOrderMapper.count();
    }

    //start当前页
    public List<TOrder> getByPageTorder(Integer currentPage, Integer pageSize){
        int s = (currentPage-1)*pageSize;
        List<TOrder> allOrder = tOrderMapper.getByPageTorder(s, pageSize);

        return allOrder;
    }

}
