package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class AdminLog {
    private Integer logId;
    private Integer adminId;
    private String content;
    private LocalDateTime createTime;
    private Integer isDelete;
}