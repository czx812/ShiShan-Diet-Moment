package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class PlanDish {
    private Integer id;
    private Integer planId;
    private Integer dishId;
    private Integer quantity;
    private LocalDateTime createTime;
    private Integer isDelete;
}