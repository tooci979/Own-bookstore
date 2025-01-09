package com.baidu.dao;

import com.baidu.pojo.Classify;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ClassifyMapper {

//    查询所有书籍分类表
    @Select("SELECT * FROM classification")
    public List<Classify> getClassifyAll();

    @Insert("insert into classification(classificationName) values(#{classificationName})")
    void addClassify(String classificationName);

    @Delete("delete from classification where classificationId=#{classificationId}")
    void deleteClassifyById(Integer classificationId);

    @Select("SELECT * FROM classification where classificationId=#{classificationId}")
    Classify getClassifyById(Integer classificationId);

    @Update("update classification set classificationName=#{classificationName} " +
            " where classificationId=#{classificationId}")
    void updateClassify(Classify classify);

    @Select("SELECT * FROM classification where classificationName like concat('%',#{name},'%')")
    List<Classify> findClassifyByName(String name);

}
