package com.baidu.service;

import com.baidu.pojo.Classify;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ClassifyService {
    //    查询所有书籍分类表
    public List<Classify> getClassifyAll();

    void addClassify(String classificationName);

    Classify getClassifyById(Integer classificationId);

    void updateClassify(Classify classify);

    void deleteClassifyById(Integer classificationId);

    List<Classify> findClassifyByName(String name);
}
