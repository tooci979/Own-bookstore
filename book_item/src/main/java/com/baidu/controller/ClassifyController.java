package com.baidu.controller;


import com.baidu.dao.ClassifyMapper;
import com.baidu.pojo.Book;
import com.baidu.pojo.Classify;
import com.baidu.service.BookService;
import com.baidu.service.ClassifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/classify")
public class ClassifyController {
    @Autowired
    private ClassifyService classifyService;

    @RequestMapping("/getClassifyAll")
    public String getClassifyAll(HttpServletRequest request, HttpSession session) {
        System.out.println("----getClassifyAll---------");
        List<Classify> classifyAll = classifyService.getClassifyAll();

        session.setAttribute("classification",classifyAll);
        return "/manage/bookType";
    }

    @RequestMapping("/addClassify")
    public String addClassify(String classificationName){
        System.out.println("-----addClassify------");
        classifyService.addClassify(classificationName);
        return "redirect:/classify/getClassifyAll";
    }

    @RequestMapping("/deleteClassifyById")
    public String deleteClassifyById(Integer classificationId){
        System.out.println("-----deleteClassifyById------");
        classifyService.deleteClassifyById(classificationId);
        return "redirect:/classify/getClassifyAll";
    }

    @RequestMapping("/getClassifyById")
    @ResponseBody
    public Classify getClassifyById(Integer id){
        System.out.println("----------getClassifyById------------");
        System.out.println("id-----------"+id);
        Classify classifyById = classifyService.getClassifyById(id);
        System.out.println("Classify-------------"+classifyById);
        return classifyById;
    }

    @RequestMapping("/updateClassify")
    public String updateClassify(Classify classify){
        System.out.println("----------updateClassify-----------");
        System.out.println("classify---------"+classify);
        classifyService.updateClassify(classify);
        return "redirect:/classify/getClassifyAll";
    }

    @RequestMapping("/findClassifyByName")
    @ResponseBody
    public List<Classify> findClassifyByName(String name){
        System.out.println("----------findClassifyByName-----------");
        System.out.println("name---------"+name);
        if(name!=null)
            return classifyService.findClassifyByName(name);
        else
            return classifyService.getClassifyAll();

    }

}
