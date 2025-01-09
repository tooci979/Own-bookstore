package com.baidu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TOrder {
    private Integer orderId;
    private String author;
    private String bookName;
    private Integer quantity;
    private Integer price;
    private Date orderTime;
    private Integer shipStatus;
    private Integer acceptStatus;
    private Integer payStatus;
    private String image;
    private Integer user_id;

    public TOrder(String author, String bookName, Integer quantity, Integer price, Date orderTime, Integer shipStatus, Integer acceptStatus, Integer payStatus, String image, Integer user_id) {
        this.author = author;
        this.bookName = bookName;
        this.quantity = quantity;
        this.price = price;
        this.orderTime = orderTime;
        this.shipStatus = shipStatus;
        this.acceptStatus = acceptStatus;
        this.payStatus = payStatus;
        this.image = image;
        this.user_id = user_id;
    }
}
