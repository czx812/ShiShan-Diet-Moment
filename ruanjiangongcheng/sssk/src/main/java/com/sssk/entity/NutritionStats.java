package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@TableName("nutrition_stats")
public class NutritionStats {
    @TableId
    private Integer statId;
    private Integer userId;
    private LocalDate recordDate;
    private Integer totalCalories;
    private BigDecimal totalProtein;
    private BigDecimal totalFat;
    private BigDecimal totalCarbs;
    private LocalDateTime createTime;
    private Integer isDelete;
}