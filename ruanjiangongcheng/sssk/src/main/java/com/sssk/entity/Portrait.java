package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("portrait")
public class Portrait {
    @TableId(type = IdType.AUTO)
    private Long id;
    private Long userId;
    private Integer age;
    private String height;
    private String weight;
    private String target;
    private String tabooFoods;
}