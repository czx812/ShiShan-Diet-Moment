package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("clock_record")
public class ClockRecord {
    @TableId
    private Integer clockId;
    private Integer userId;
    private Integer planId;
    private String mealType;
    private String dishList;
    private String intakeAmount;
    private String remarks;
    private LocalDateTime clockTime;
    private LocalDateTime createTime;
    private Integer isDelete;
}
