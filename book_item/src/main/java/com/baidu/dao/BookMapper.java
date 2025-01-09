package com.baidu.dao;

import com.baidu.pojo.Book;
import com.baidu.pojo.Classify;
import com.baidu.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface BookMapper {

    //    查询所有书籍
    public List<Book> getBookAll();

    @Insert("insert into book(bookName, author, publisher, image, price, classificationId) " +
            " values(#{bookName},#{author},#{publisher},#{image},#{price},#{classificationId})")
    void addBook(Book book);

    @Select("select * from book where bookID = #{bookID}")
    Book getBookById(Integer bookID);

    @Delete("delete from book where bookID=#{bookID}")
    void deleteBookById(Integer bookID);

    @Update("update book set bookName=#{bookName}, author =#{author}, publisher =#{publisher}, image =#{image}, price = #{price}, classificationId = #{classificationId} " +
            " where bookID = #{bookID}")
    void updateBook(Book book);

//分类筛选
//    @Select("SELECT * FROM  book where book.classificationId=#{classificationId}")
    public List<Book> getClassifyAllByType(Integer classificationId);

//    @Select("select * from book where classificationId = #{id} and bookName = #{name}")
    public List<Book> searchBookByName(Book book);


    //    分页
    public List<Book> getByPageHome(@Param("st") Integer start, @Param("pa") Integer pageSize);

    //    查询总记录数
    @Select("SELECT COUNT(*) FROM  book as b,classification as c " +
            "        where b.classificationId = c.classificationId ")
    public int count();

//    @Select("select * from book where bookName = #{name}")
    List<Book> findBookByName(String name);



}
