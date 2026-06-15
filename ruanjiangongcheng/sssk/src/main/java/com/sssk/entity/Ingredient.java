package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Ingredient {
    private Integer ingId;
    private String ingName;
    private Float caloriesPer100g;
    private Float proteinPer100g;
    private Float fatPer100g;
    private Float carbsPer100g;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}
