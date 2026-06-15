package com.sssk.entity;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class DietPlan {
    @TableId
    private Integer planId;
    private Integer userId;
    private String planName;
    private Integer totalCalories;
    private String recipeContent;
    private String status;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}