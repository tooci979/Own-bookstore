package com.baidu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Book {
    private Integer bookID;
    private String bookName;
    private String author;
    private String publisher;
    private String image;
    private Integer price;
    private Integer classificationId;

    private Classify classify;

}























