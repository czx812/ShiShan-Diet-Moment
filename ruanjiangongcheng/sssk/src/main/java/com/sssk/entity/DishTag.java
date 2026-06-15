package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class DishTag {
    private Integer id;
    private Integer dishId;
    private Integer tagId;
    private LocalDateTime createTime;
    private Integer isDelete;
}