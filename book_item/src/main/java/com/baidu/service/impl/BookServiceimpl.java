package com.baidu.service.impl;

import com.baidu.dao.BookMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.User;
import com.baidu.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

 public class BookServiceimpl implements BookService {

    @Autowired
    private BookMapper bookMapper;
    //    查询所有书籍
    public List<Book> getBookAll(){

       return bookMapper.getBookAll();
    }

    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    @Override
    public Book getBookById(Integer id) {
        return bookMapper.getBookById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookMapper.updateBook(book);
    }

    @Override
    public void deleteBookById(Integer id) {
        bookMapper.deleteBookById(id);
    }

    //分类筛选
    @Override
    public List<Book> getClassifyAllByType(Integer classificationId) {
        return bookMapper.getClassifyAllByType(classificationId);
    }


    @Override
    public List<Book> searchBookByName(Book book) {
        return bookMapper.searchBookByName(book);
    }
    @Override
    public List<Book> getByPageHome(Integer currentPage, Integer pageSize){

        int s = (currentPage-1)*pageSize;
        List<Book> byPageHome = bookMapper.getByPageHome(s, pageSize);
        return byPageHome;

    }
    @Override
    public int count(){
      return  bookMapper.count();
    }

    @Override
    public List<Book> findBookByName(String name) {
        return bookMapper.findBookByName(name);
    }
}
