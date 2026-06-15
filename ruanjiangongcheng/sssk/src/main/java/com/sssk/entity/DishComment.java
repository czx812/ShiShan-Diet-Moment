package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("dish_comment")
public class DishComment {
    @TableId
    private Integer commentId;
    private Integer dishId;
    private Integer userId;
    private Integer score;
    private String content;
    private LocalDateTime createTime;
    private Integer isDelete;
}