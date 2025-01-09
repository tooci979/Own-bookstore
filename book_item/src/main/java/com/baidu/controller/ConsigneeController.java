package com.baidu.controller;

import com.baidu.pojo.Consignee;
import com.baidu.service.ConsigneeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/consignee")
public class ConsigneeController {

    @Autowired
    ConsigneeService consigneeService;

    @RequestMapping("/getAllConsignee")
    public String getAllConsignee(Integer id, HttpSession session){
        System.out.println("------getAllConsignee--------");
        List<Consignee> consigneeList = consigneeService.getAllConsignee(id);
        session.setAttribute("consigneeList",consigneeList);
        return "/user/cneeAddress";
    }

    @RequestMapping("/addConsignee")
    public String addConsignee(Consignee consignee,Integer user_id){
        System.out.println("----------addConsignee----------");
        System.out.println("consignee----"+consignee);
        consigneeService.addConsignee(consignee);
        return "redirect:/consignee/getAllConsignee?id="+user_id;
    }


    @RequestMapping("/getConsigneeByID")
    @ResponseBody
    public Consignee getConsigneeByID(Integer id){
        System.out.println("----------getConsigneeByID----------");
        System.out.println("id----------"+id);
        return consigneeService.getConsigneeByID(id);
    }

    @RequestMapping("/updateConsignee")
    public String updateConsignee(Consignee consignee,Integer id){
        System.out.println("----------updateConsignee----------");
        System.out.println("consignee----------"+consignee);
        consigneeService.updateConsignee(consignee);
        return "redirect:/consignee/getAllConsignee?id="+id;
    }


    @RequestMapping("/deleteConsignee")
    public String deleteConsignee(Integer cneeId,Integer user_id){
        System.out.println("----------deleteConsignee----------");
        consigneeService.deleteConsignee(cneeId);
        return "redirect:/consignee/getAllConsignee?id="+user_id;
    }

    @RequestMapping("/SearchAddress")
    @ResponseBody
    public List<Consignee> SearchAddress(String addressVal,Integer id){
        System.out.println("----------SearchAddress----------");
        System.out.println(addressVal);
        List<Consignee> consignees = consigneeService.SearchGetAddress(addressVal,id);

        if(addressVal!=""){
            return consignees;
        }else {
            List<Consignee> allConsignee = consigneeService.getAllConsignee(id);
            return allConsignee;
        }


    }
}
