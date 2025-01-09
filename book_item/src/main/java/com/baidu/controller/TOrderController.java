package com.baidu.controller;

import com.baidu.dao.UserMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.TOrder;
import com.baidu.pojo.User;
import com.baidu.service.BookService;
import com.baidu.service.TOrderService;
import com.baidu.service.UserService;
import com.baidu.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/order")
public class TOrderController {

    @Autowired
    TOrderService tOrderService;

    @Autowired
    UserService userService;

    @Autowired
    BookService bookService;

    @RequestMapping("/getAllOrder")
    public String getAllOrder(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "8") Integer pageSize,
            HttpSession session){
        System.out.println("---------getAllOrder---------");
        List<TOrder> orders = tOrderService.getByPageTorder(currentPage,pageSize);
        session.setAttribute("orders",orders);

        Pages pages = new Pages();
        pages.setCurrentPage(currentPage);
        pages.setPageSize(pageSize);
        int total = tOrderService.count();
        pages.setTotalCount(total);

        session.setAttribute("pagesListTorder",pages);

        return "/manage/mangeOrder";
    }

//    @RequestMapping("/addTOrder")
//    public String addTOrder(Integer bookID, Integer userID){
//        System.out.println("-------------addTOrder---------------");
//        System.out.println("bookID--------------------"+bookID);
//        System.out.println("userID--------------------"+userID);
//
//        tOrderService.addTOrder1(bookID,userID);
//        String name = userService.findUser(userID).getName();
//        return "forward:/user/getAllOredrByUserName?name="+name;
//    }

    @RequestMapping("/addTOrder")
    public String addTOrder(Integer bookID, Integer userID){
        System.out.println("-------------addTOrder---------------");
        System.out.println("bookID--------------------"+bookID);
        System.out.println("userID--------------------"+userID);
        User user = userService.findUser(userID);
        Book book = bookService.getBookById(bookID);

        if (user.getMoney()>=book.getPrice()){
            int money = user.getMoney()-book.getPrice();
            System.out.println("money---------------------"+money);
            user.setMoney(money);
            userService.updateMoney(user);
            tOrderService.addTOrder1(bookID,userID);
        }else {
            tOrderService.addTOrder2(bookID,userID);
        }

        String name = userService.findUser(userID).getName();
        return "forward:/user/getAllOredrByUserName?name="+name;
    }

    @RequestMapping("/toPay")
    public String toPay(Integer orderID, Integer userID){
        System.out.println("------------toPay--------------");
        System.out.println("orderID----------------------"+orderID);
        System.out.println("userID----------------------"+userID);
        tOrderService.updateTOrderPayStatus(orderID);
        String name = userService.findUser(userID).getName();
        return "forward:/user/getAllOredrByUserName?name="+name;
    }

    @RequestMapping("/toShip")
    public String toShip(Integer orderID, Integer userID){
        System.out.println("------------toShip--------------");
        System.out.println("orderID----------------------"+orderID);
        System.out.println("userID----------------------"+userID);
        tOrderService.updateTOrderShipStatus(orderID);
        String name = userService.findUser(userID).getName();
        return "forward:/user/getAllOredrByUserName?name="+name;
    }

    @RequestMapping("/toAccept")
    public String toAccept(Integer orderID, Integer userID){
        System.out.println("------------toAccept--------------");
        System.out.println("orderID----------------------"+orderID);
        System.out.println("userID----------------------"+userID);
        tOrderService.updateTOrderAcceptStatus(orderID);
        String name = userService.findUser(userID).getName();
        return "forward:/user/getAllOredrByUserName?name="+name;
    }

    @RequestMapping("/deleteTOrder")
    public String deleteTOrder(Integer orderID, Integer userID){
        System.out.println("------------deleteTOrder--------------");
        System.out.println("orderID----------------------"+orderID);
        System.out.println("userID----------------------"+userID);
        tOrderService.deleteTOrder(orderID);
        String name = userService.findUser(userID).getName();
        return "forward:/user/getAllOredrByUserName?name="+name;
    }


    @RequestMapping("/shipOrder")
    public String toShip(Integer orderID){
        System.out.println("------------toShip--------------");
        System.out.println("orderID----------------------"+orderID);
        tOrderService.updateTOrderShipStatus(orderID);
        return "redirect:/order/getAllOrder";
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(Integer orderID){
        System.out.println("------------deleteOrder--------------");
        System.out.println("orderID----------------------"+orderID);
        tOrderService.deleteTOrder(orderID);
        return "redirect:/order/getAllOrder";
    }


    @RequestMapping("/addTOrderNotPay")
    public String addTOrderNotPay(Integer bookID, Integer userID){
        System.out.println("-------------addTOrderNotPay---------------");
        System.out.println("bookID--------------------"+bookID);
        System.out.println("userID--------------------"+userID);
        tOrderService.addTOrder2(bookID,userID);
        String name = userService.findUser(userID).getName();
        return "forward:/user/getAllOredrByUserName?name="+name;

    }

    @RequestMapping("/getOrderListByName")
    @ResponseBody
    public List<TOrder> getOrderListByName(String name){
        System.out.println("-------------getOrderListByName--------------");
        System.out.println("name:----------------"+name);
        return tOrderService.getOrderListByName(name);
    }
}
