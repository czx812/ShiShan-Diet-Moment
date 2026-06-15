package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class CheckinRecord {
    // 加上主键注解，解决MyBatis-Plus无法识别主键的问题
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long userId;
    private String date;
    private String status;
}