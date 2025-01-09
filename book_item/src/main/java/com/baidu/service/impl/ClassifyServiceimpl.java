package com.baidu.service.impl;

import com.baidu.dao.ClassifyMapper;
import com.baidu.pojo.Classify;
import com.baidu.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassifyServiceimpl implements ClassifyService {

    @Autowired
    private ClassifyMapper classifyMapper;
    @Override
    public List<Classify> getClassifyAll() {
       return classifyMapper.getClassifyAll();
    }

    @Override
    public void addClassify(String classificationName) {
        classifyMapper.addClassify(classificationName);
    }

    @Override
    public Classify getClassifyById(Integer classificationId) {
        return classifyMapper.getClassifyById(classificationId);
    }

    @Override
    public void updateClassify(Classify classify) {
        classifyMapper.updateClassify(classify);
    }


    @Override
    public void deleteClassifyById(Integer classificationId) {
        classifyMapper.deleteClassifyById(classificationId);
    }

    @Override
    public List<Classify> findClassifyByName(String name) {
        return classifyMapper.findClassifyByName(name);
    }


}
