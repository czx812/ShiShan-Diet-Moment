package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("user_profile")
public class UserProfile {
    // 主键是 profile_id，自增
    @TableId(type = IdType.AUTO)
    private Integer profileId;

    // 数据库里的列名：user_id, age, gender, height, weight, target, activity_level, taboo_foods
    private Integer userId;
    private Integer age;
    private String gender;
    private java.math.BigDecimal height;
    private java.math.BigDecimal weight;
    private String target; // 你的目标字段，数据库叫 target
    private String activityLevel;
    private String tabooFoods; // 你的忌口字段，数据库叫 taboo_foods

    // 以下是数据库里存在的时间字段
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}