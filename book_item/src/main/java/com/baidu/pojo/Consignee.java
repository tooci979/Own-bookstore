package com.baidu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Consignee {
    private Integer cneeId;
    private String cneeName;
    private String cneeAddress;
    private String cneePhone;
    private Integer user_id;
}
