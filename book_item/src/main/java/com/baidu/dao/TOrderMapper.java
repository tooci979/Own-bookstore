package com.baidu.dao;

import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface TOrderMapper {

    @Select("select * from t_order")
    List<TOrder> getAllOrder();

    @Select("select * from t_order order by orderId desc limit #{st},#{pa};")
    List<TOrder> getByPageTorder(@Param("st") Integer start, @Param("pa") Integer pageSize);

    @Select("select count(*) from t_order")
    public int count();

    @Insert("insert into t_order(author, bookName, quantity, orderTime, shipStatus, acceptStatus, payStatus, image, price, user_id) " +
            " values(#{author},#{bookName},#{quantity},#{orderTime},#{shipStatus},#{acceptStatus},#{payStatus},#{image},#{price},#{user_id}) ")
    void addTOrder(TOrder tOrder);

    @Update("update t_order set payStatus=1 where orderId = #{id}")
    void updateTOrderPayStatus(Integer id);

    @Update("update t_order set shipStatus=1 where orderId = #{id}")
    void updateTOrderShipStatus(Integer id);

    @Select("select * from t_order where orderId = #{id}")
    TOrder findTOrderByID(Integer id);
    @Update("update t_order set acceptStatus=1 where orderId = #{id}")
    void updateTOrderAcceptStatus(Integer id);

    @Delete("delete from t_order where orderId = #{id}")
    void deleteTOrder(Integer id);

    @Select("select * from t_order where author like concat('%',#{name},'%') ")
    List<TOrder> getOrderListByName(String name);






}
