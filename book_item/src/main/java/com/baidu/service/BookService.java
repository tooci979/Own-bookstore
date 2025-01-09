package com.baidu.service;

import com.baidu.pojo.Book;
import com.baidu.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BookService {

    //    查询所有书籍
    public List<Book> getBookAll();

    void addBook(Book book);

    Book getBookById(Integer id);

    void updateBook(Book book);

    void deleteBookById(Integer id);

    //分类筛选
    public List<Book> getClassifyAllByType(Integer classificationId);

    List<Book> searchBookByName(Book book);

    //start当前页
    public List<Book> getByPageHome(Integer currentPage, Integer pageSize);
    public int count();
    List<Book> findBookByName(String name);

}
