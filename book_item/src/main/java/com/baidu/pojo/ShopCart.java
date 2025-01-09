package com.baidu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ShopCart {
    private Integer cartId;
    private String commodityName;
    private Integer price;
    private Integer quantity;
    private Integer total_money;
    private String image;
    private String author;
    private Date orderTime;
    private String publisher;
    private Integer user_id;
}
