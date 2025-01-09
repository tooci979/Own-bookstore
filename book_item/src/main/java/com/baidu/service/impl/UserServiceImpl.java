package com.baidu.service.impl;

import com.baidu.dao.UserMapper;
import com.baidu.pojo.TOrder;
import com.baidu.pojo.User;
import com.baidu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public void deleteById(Integer id) {
        userMapper.deleteById(id);
    }

    @Override
    public void personDetailUpdate(User user) {
        userMapper.personDetailUpdate(user);
    }

    @Override
    public User findUser(Integer user_id) {
        return userMapper.findUser(user_id);
    }

    @Override
    public List<User> getAllOredrByUserName(String name) {
        return userMapper.getAllOredrByUserName(name);
    }


    @Override
    public void recharge(User user) {

        User userByPhone = userMapper.findUserByPhone(user.getPhone());
        Integer orignMoney = userByPhone.getMoney();
        Integer finalMoney = user.getMoney()+orignMoney;
        user.setMoney(finalMoney);
        userMapper.recharge(user);
    }

    @Override
    public User getUserByName(String name) {
        return userMapper.getUserByName(name);
    }

    @Override
    public List<User> getUserListByName(String name) {
        return userMapper.getUserListByName(name);
    }


    @Override
    public void updateMoney(User user) {
        userMapper.updateMoney(user);
    }

    @Override
    public int count(String name) {
        return userMapper.count(name);
    }

    @Override
    public List<User> getAllOredrByUserNamePage(Integer currentPage, Integer pageSize,String name) {
        int s = (currentPage-1)*pageSize;
        List<User> allOrder = userMapper.getAllOredrByUserNamePage(s, pageSize,name);

        return allOrder;
    }


    @Override
    public User registerCheckName(String name) {
        return userMapper.registerCheckName(name);
    }

    @Override
    public User checkPhone(String phone){
        return userMapper.checkPhone(phone);
    }
}
