package com.baidu.dao;

import com.baidu.pojo.ShopCart;
import com.baidu.pojo.TOrder;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ShopCartMapper {

    @Select("select * from shopcart")
    List<ShopCart> getAllShopCart();
    @Select("select * from shopcart where user_id = #{id}")
    List<ShopCart> getAllShopCartById(Integer id);

    @Insert("insert into shopcart(commodityName, price, quantity, total_money, image, author, orderTime, publisher,user_id) " +
            " values(#{commodityName},#{price},#{quantity},#{total_money},#{image},#{author},#{orderTime},#{publisher},#{user_id})")
    void addOrderToShopCart(ShopCart shopCart);

    @Delete("delete from shopcart where cartId=#{id}")
    void deleteOrderFromShopCartByID(Integer id);

    @Select("select * from shopcart where cartId=#{id}")
    ShopCart getShopCartByID(Integer id);

    @Update("update shopcart set quantity = #{quantity}, total_money = #{total_money} " +
            " where cartId = #{cartId}")
    void updateShopCart(ShopCart shopCart);


    public List<ShopCart> ShopTorderNum(Integer orderIdLsit[]);

//    分页
    @Select("select count(*) from shopcart as s ,user as u where s.user_id = u.user_id and s.user_id=#{user_id}")
    public int count(Integer user_id);

    @Select("select * from shopcart as s ,user as u where s.user_id = u.user_id and u.user_id=#{id} limit #{st},#{pa};")
    List<ShopCart> getByPageShop(@Param("st") Integer start, @Param("pa") Integer pageSize,@Param("id") Integer id);

//    搜索
    @Select("select * from shopCart where user_id = #{id} and commodityName like concat('%',#{val},'%') ")
    List<ShopCart> SearchShopCart(@Param("val") String ShopVal,@Param("id") Integer id);
}