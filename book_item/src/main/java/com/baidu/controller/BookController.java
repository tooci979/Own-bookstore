package com.baidu.controller;


import com.baidu.config.config;
import com.baidu.dao.ClassifyMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.Classify;
import com.baidu.pojo.User;
import com.baidu.service.BookService;
import com.baidu.service.ClassifyService;
import com.baidu.service.UserService;
import com.baidu.utils.Pages;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private ClassifyService classifyService;
    @Autowired
    private UserService userService;

    @RequestMapping("/getBookAll")
    public String getBookAll(
            @RequestParam(defaultValue = "1") Integer currentPage,
            @RequestParam(defaultValue = "3") Integer pageSize,
            HttpServletRequest request, HttpSession session,
            Integer id) {
        System.out.println("----getBookAll---------");
        List<Book> bookAll = bookService.getByPageHome(currentPage, pageSize);
        session.setAttribute("BookList", bookAll);

        Pages pages = new Pages();
        pages.setCurrentPage(currentPage);
        pages.setPageSize(pageSize);
        int total = bookService.count();
        pages.setTotalCount(total);

        session.setAttribute("pagesList", pages);

        List<Classify> classifyAll = classifyService.getClassifyAll();
        session.setAttribute("classifyAllList", classifyAll);


        User user = userService.findUser(id);
        session.setAttribute("HomeUser", user);
        System.out.println("user========>" + user);
        System.out.println(id);
        return "home";
    }

    @RequestMapping("/getBookAllByManage")
    public String getBookAllByManage(HttpServletRequest request, HttpSession session) {
        System.out.println("----getBookAllByManage---------");
        List<Book> bookAll = bookService.getBookAll();
        session.setAttribute("ManageBookList", bookAll);
        return "/manage/manageBook";
    }

    @RequestMapping(value = "/addBook",method = RequestMethod.POST)
    public String addBook(Book book, MultipartFile photo) throws IOException {
        System.out.println("---------addBook----------");
        System.out.println("book------" + book);
        System.out.println("文件名称:" + photo.getOriginalFilename());

//        获取原始文件名
        String originalFilename = photo.getOriginalFilename();
        System.out.println(originalFilename);
//    上传图片 保存文件目录
        File file = new File("e:/1java/book_item/src/main/webapp/img");
//    随机数 拼接新的文件名
        UUID uuid = UUID.randomUUID();
        String realName = uuid + originalFilename;
//创建file 上传文件，file对象中保存文件的路径和文件名
        File realFile = new File(file, realName);
        //        将图片路径存储到数据库

        book.setImage("/img/"+uuid + originalFilename);
        bookService.addBook(book);
//    执行文件上传
        photo.transferTo(realFile);


        return "redirect:/book/getBookAllByManage";
    }

    @RequestMapping("/getBookById")
    public String getBookById(Integer id, HttpSession session) {
        System.out.println("-------getBookById--------");
        System.out.println("id------------" + id);
        Book book = bookService.getBookById(id);

        System.out.println("book------------------" + book);
        System.out.println("booId--------------------" + book.getBookID());
        session.setAttribute("book", book);

        return "/manage/updateBookTable";
    }

    @RequestMapping("/updateBook")
    public String updateBook(Book book, MultipartFile photo) throws IOException {
        String originalFilename = photo.getOriginalFilename();
//    上传图片 保存文件目录
        File file = new File("e:/1java/book_item/src/main/webapp/img");
//    随机数 拼接新的文件名
        UUID uuid = UUID.randomUUID();
        String realName = uuid + originalFilename;
//创建file 上传文件，file对象中保存文件的路径和文件名
        File realFile = new File(file, realName);
//    执行文件上传
        photo.transferTo(realFile);
        book.setImage("/img/" + uuid + originalFilename);
        System.out.println(book.getImage() + "=============getImage");
        System.out.println("booId--------------------" + book.getBookID());
        bookService.updateBook(book);

        return "redirect:/book/getBookAllByManage";
    }

    @RequestMapping("/deleteBookById")
    public String deleteBookById(Integer id) {
        System.out.println("---------deleteBookById----------");
        System.out.println("id-----" + id);
        bookService.deleteBookById(id);
        return "redirect:/book/getBookAllByManage";
    }

    //分类筛选
    @RequestMapping("/getClassifyAllByType")
    @ResponseBody
    public List<Book> getClassifyAllByType(Integer id, HttpSession session) {
        System.out.println("---------getClassifyAllByType----------");
        System.out.println("id-----" + id);

        if (id != 0) {
            return bookService.getClassifyAllByType(id);
        } else {
            return bookService.getBookAll();
        }
    }

    @RequestMapping("/searchBookByName")
    @ResponseBody
    public List<Book> searchBookByName(Book book) {
        System.out.println("-------------searchBookByName--------------");
//        System.out.println("id:----------------"+id);
//        System.out.println("name:----------------"+name);
        List<Book> books = bookService.searchBookByName(book);
        return books;
    }


    @RequestMapping("/findBookByName")
    @ResponseBody
    public List<Book> findBookByName(String name) {
        System.out.println("-------------findBookByName--------------");
        System.out.println("name:----------------" + name);
        return bookService.findBookByName(name);
    }


}
