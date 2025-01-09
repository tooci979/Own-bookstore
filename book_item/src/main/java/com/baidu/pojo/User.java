package com.baidu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer user_id;
    private String name;
    private String password;
    private Integer age;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private Integer roles;
    private Integer money;
    private String phone;

    private Role role;
    private List<TOrder> tOrder;
}
