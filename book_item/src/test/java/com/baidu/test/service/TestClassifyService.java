package com.baidu.test.service;

import com.baidu.dao.BookMapper;
import com.baidu.dao.ClassifyMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.Classify;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring_config.xml")
public class TestClassifyService {
    @Autowired
    private ClassifyMapper classifyMapper;
    @Test
    public void getBookAll(){
        List<Classify> classifyAll = classifyMapper.getClassifyAll();
        for (Classify o :classifyAll) {
            System.out.println(o);
        }


    }


}
