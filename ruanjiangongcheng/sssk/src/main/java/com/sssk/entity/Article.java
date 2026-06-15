package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Article {
    private Integer articleId;
    private String title;
    private String content;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}