package com.baidu.service;

import com.baidu.pojo.Consignee;

import java.util.List;

public interface ConsigneeService {
    List<Consignee> getAllConsignee(Integer id);

    void addConsignee(Consignee consignee);

    Consignee getConsigneeByID(Integer id);

    void updateConsignee(Consignee consignee);

    void deleteConsignee(Integer id);

    List<Consignee> SearchGetAddress(String addressVal,Integer id);
}
