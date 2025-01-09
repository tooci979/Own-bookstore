package com.baidu.dao;

import com.baidu.pojo.Book;
import com.baidu.pojo.Consignee;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ConsigneeMapper {

    @Select("select * from consignee where user_id = #{id}")
    List<Consignee> getAllConsignee(Integer id);

    @Insert("insert into consignee(cneeName, cneeAddress, cneePhone, user_id)" +
            " values(#{cneeName},#{cneeAddress},#{cneePhone},#{user_id})")
    void addConsignee(Consignee consignee);

    @Select("select * from consignee where cneeId = #{id}")
    Consignee getConsigneeByID(Integer id);

    @Update("update consignee set cneeName=#{cneeName}, cneeAddress =#{cneeAddress}, cneePhone =#{cneePhone} " +
            " where cneeId = #{cneeId}")
    void updateConsignee(Consignee consignee);

    @Select("select * from consignee where cneeId = #{id}")
    Consignee getConsigneeListByID(Integer id);

    @Delete("delete from consignee where cneeId = #{id}")
    void deleteConsignee(Integer id);

    @Select("select * from Consignee where cneeAddress like concat('%',#{ad},'%') and user_id =#{id}")
    List<Consignee> SearchGetAddress(@Param("ad") String addressVal, @Param("id") Integer id );
}
