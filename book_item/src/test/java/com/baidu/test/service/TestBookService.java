package com.baidu.test.service;

import com.baidu.dao.BookMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.User;
import com.baidu.service.BookService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class TestBookService {
    @Autowired
    private BookService bookService;

    @Test
    public void getBookAll() {
        List<Book> bookAll = bookService.getBookAll();
        for (Book o : bookAll) {
            System.out.println(o);
        }

    }

    @Test
    public void updateBook() {
        Book book = new Book();
        book.setBookName("e145w3q15");
        book.setBookID(8);
        bookService.updateBook(book);
        List<Book> bookAll = bookService.getBookAll();
        for (Book book1 : bookAll) {
            System.out.println(book1);
        }
    }

    @Test
    public void getBookById() {
        System.out.println(bookService.getBookById(1));
    }

    @Test
    public void getClassifyAllByType() {
        List<Book> classifyAllByType = bookService.getClassifyAllByType(1);
        for (Book o : classifyAllByType) {
            System.out.println(o);
        }

    }

    @Test
    public void searchBookByName() {
        Book book = new Book();
        book.setBookName("人");
        book.setClassificationId(1);
        List<Book> books = bookService.searchBookByName(book);
        for (Book book1 : books) {
            System.out.println(book1);
        }
    }


    //    测试分页
    @Test
    public void testCount() {
        System.out.println("-----testCount-----");
        int count = bookService.count();

        System.out.println("total=" + count);
        System.out.println("-----测试分页查询-----");
        List<Book> byPageHome = bookService.getByPageHome(1, 4);

        for (Book o : byPageHome) {
            System.out.println(o);
        }
    }
}
