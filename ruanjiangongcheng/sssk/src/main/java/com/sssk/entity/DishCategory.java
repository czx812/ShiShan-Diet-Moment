package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class DishCategory {
    private Integer cateId;
    private String cateName;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}