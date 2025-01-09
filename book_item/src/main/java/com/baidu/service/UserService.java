package com.baidu.service;

import com.baidu.pojo.TOrder;
import com.baidu.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserService {
    User login(User user);

    List<User> getAllUser();

    //    增加用户
    public int addUser(User user);
    //删除用户
    public void deleteById(Integer id);

    void personDetailUpdate(User user);

    User findUser(Integer user_id);

    //    用户查询自己的订单
    List<User> getAllOredrByUserName(String name);

    void recharge(User user);

    User getUserByName(String name);

    List<User> getUserListByName(String name);

    void updateMoney(User user);

    public int count(String name);
    public List<User> getAllOredrByUserNamePage(Integer currentPage, Integer pageSize,String name);

    public User registerCheckName(String name);


    public User checkPhone(String phone);

}
