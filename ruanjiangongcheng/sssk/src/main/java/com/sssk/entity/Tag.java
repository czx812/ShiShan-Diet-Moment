package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Tag {
    private Integer tagId;
    private String tagName;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}