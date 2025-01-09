package com.baidu.service.impl;

import com.baidu.dao.ConsigneeMapper;
import com.baidu.pojo.Consignee;
import com.baidu.service.ConsigneeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConsigneeServiceImpl implements ConsigneeService {

    @Autowired
    ConsigneeMapper consigneeMapper;

    @Override
    public List<Consignee> getAllConsignee(Integer id) {
        List<Consignee> allConsignee = consigneeMapper.getAllConsignee(id);
        return allConsignee;
    }

    @Override
    public void addConsignee(Consignee consignee) {
        consigneeMapper.addConsignee(consignee);
    }

    @Override
    public Consignee getConsigneeByID(Integer id) {
        return consigneeMapper.getConsigneeByID(id);
    }

    @Override
    public void updateConsignee(Consignee consignee) {
        consigneeMapper.updateConsignee(consignee);
    }

    @Override
    public void deleteConsignee(Integer id){
        consigneeMapper.deleteConsignee(id);
    }

    @Override
    public List<Consignee> SearchGetAddress(String addressVal,Integer id ) {

        List<Consignee> consignees = consigneeMapper.SearchGetAddress(addressVal,id);

        return consignees;
    }


}
