package com.baidu.dao;

import com.baidu.pojo.TOrder;
import com.baidu.pojo.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {

    @Select("select * from user where name=#{name} and password=#{password}")
    User login(User user);

    List<User> getAllUser();

    @Select("select * from user where name=#{name}")
    User getUserByName(String name);

//    增加用户
    @Insert("insert into user(name,password,age,birthday,roles,phone) value(#{name},#{password},#{age},#{birthday},#{roles},#{phone})")
    public int addUser(User user);
//删除用户
    @Delete("delete from user where user_id=#{id}")
    public void deleteById(Integer id);

    @Update("update user set name=#{name}, password =#{password}, age =#{age}, birthday =#{birthday}, phone = #{phone}, roles = #{roles} " +
            " where user_id = #{user_id}")
    void personDetailUpdate(User user);

    @Select("select * from user where user_id = #{user_id}")
    User findUser(Integer user_id);

    //    用户查询自己的订单
    List<User> getAllOredrByUserName(String name);
    List<User> getAllOredrByUserNamePage(@Param("st") Integer start, @Param("pa") Integer pageSize,@Param("name") String name);


    public int count(String name);

    @Update("update user set money=#{money} where phone = #{phone}")
    void recharge(User user);

    @Update("update user set money=#{money} where user_id = #{user_id}")
    void updateMoney(User user);

    @Select("select * from user where phone = #{phone}")
    User findUserByPhone(String phone);

    List<User> getUserListByName(String name);

    @Select("select * from user where name = #{name}")
    public User registerCheckName(String name);

    @Select("select * from user where phone = #{phone}")
    public User checkPhone(String phone);
}
