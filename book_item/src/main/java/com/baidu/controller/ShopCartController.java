package com.baidu.controller;

import com.alibaba.fastjson.JSON;
import com.baidu.pojo.Book;
import com.baidu.pojo.ShopCart;
import com.baidu.pojo.User;
import com.baidu.service.BookService;
import com.baidu.service.ShopCartService;
import com.baidu.service.TOrderService;
import com.baidu.service.UserService;
import com.baidu.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Array;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.IntStream;

@Controller
@RequestMapping("/ShopCart")
public class ShopCartController {

    @Autowired
    ShopCartService shopCartService;

    @Autowired
    BookService bookService;

    @Autowired
    TOrderService tOrderService;

    @Autowired
    UserService userService;

    @RequestMapping("/getAllShopCart")
    public String getAllShopCart(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "3") Integer pageSize,
            HttpSession session,
            Integer id
    ) {
        System.out.println("----------getAllShopCart-----------");
        List<ShopCart> shopCarts = shopCartService.getByPageShop(currentPage, pageSize, id);
        session.setAttribute("shopCarts", shopCarts);

        Pages pages = new Pages();
        pages.setCurrentPage(currentPage);
        pages.setPageSize(pageSize);
        int total = shopCartService.count(id);
        pages.setTotalCount(total);

        session.setAttribute("pagesListShop", pages);

        User user = userService.findUser(id);
        session.setAttribute("ShopUser", user);
        System.out.println("user========>" + user);
        System.out.println(id);

        return "/user/shopCart";
    }

    @RequestMapping("/getBookById")
    @ResponseBody
    public Book getBookById(Integer id) {
        System.out.println("-------addShopCart-------");
        Book book = bookService.getBookById(id);
        return book;
    }

    @RequestMapping("/addOrderToShopCart")
    public String addOrderToShopCart(ShopCart shopCart, Integer price, String image) {
        System.out.println("--------addOrderToShopCart--------");
        System.out.println("shopCart-----------------" + shopCart);
        System.out.println("price-----------------" + price);
        System.out.println("image-----------------" + image);

        shopCart.setPrice(price);
        shopCart.setOrderTime(new Date());
        shopCart.setImage(image);
        shopCartService.addOrderToShopCart(shopCart);

        System.out.println(shopCart);


        return "home";
    }

    @RequestMapping("/deleteOrderFromShopCartByID")
    public String deleteOrderFromShopCartByID(Integer id,Integer user_id) {
        System.out.println("---------deleteOrderFromShopCartByID----------");
        System.out.println("id---------" + id);
        shopCartService.deleteOrderFromShopCartByID(id);
        return "redirect:/ShopCart/getAllShopCart?id="+user_id;
    }

    @RequestMapping("/getShopCartByID")
    @ResponseBody
    public ShopCart getShopCartByID(Integer id) {
        System.out.println("----------getShopCartByID------------");
        System.out.println("id-----------" + id);
        return shopCartService.getShopCartByID(id);
    }

    @RequestMapping("/updateShopCart")
    public String updateShopCart(ShopCart shopCart,Integer id) {
        System.out.println("----------updateShopCart------------");
        System.out.println("shopCart-----------" + shopCart);
        shopCartService.updateShopCart(shopCart);
        return "redirect:/ShopCart/getAllShopCart?id="+shopCart.getUser_id();
    }

    //    购物车支付
    @RequestMapping("/PayShopOrder")
    public String PayShopOrder(@RequestParam("name") String name,
                               @RequestParam("SelectNumber") Integer SelectNumber,
                               @RequestBody String orderIdLsit
    ) throws UnsupportedEncodingException {
        System.out.println("----------PayShopOrder------------");

        String decoded = URLDecoder.decode(orderIdLsit, "UTF-8"); // 解码
        String[] values = decoded.substring(0, decoded.length()).split("&"); // 解析为数组

        String regex = "(\\d+)"; // 匹配一个或多个数字
        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(Arrays.toString(values));
        Integer[] array = new Integer[100]; // 预定义数组大小，可根据实际需要调整
        int index = 0;
        while (matcher.find()) {
            array[index++] = Integer.parseInt(matcher.group());
        }
        System.out.println(array);
        for (int i = 0; i < array.length; i++) {
            System.out.println(array[i]);
        }


        tOrderService.addTOrderList(array, name);

//        System.out.println(array); // 输出数组内容：[1, 8, 13]
//        Integer[] intArray = Arrays.stream(values)
        return "redirect:/user/getAllOredrByUserName?name=" + name;
    }
//搜索框

    @RequestMapping("/SearchShopCart")
    @ResponseBody
    public List<ShopCart> SearchShopCart(String ShopVal,Integer id) {
        System.out.println("SearchShopCart id =>>>>"+id);
        System.out.println("----------SearchShopCart------------");
        List<ShopCart> shopCarts = shopCartService.SearchShopCart(ShopVal, id);
        if (ShopVal!=""){
            return shopCarts;
        }else {
            return shopCartService.getAllShopCartById(id);
        }
    }
}
