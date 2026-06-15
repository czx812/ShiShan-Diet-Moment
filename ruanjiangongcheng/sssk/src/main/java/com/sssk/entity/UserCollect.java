package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class UserCollect {
    private Integer id;
    private Integer userId;
    private String collectType;
    private Integer targetId;
    private LocalDateTime createTime;
    private Integer isDelete;
}
