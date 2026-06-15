package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class AiLog {
    private Integer logId;
    private Integer userId;
    private String modelType;
    private String prompt;
    private String response;
    private Integer callStatus;
    private Float responseTime;
    private String errorInfo;
    private LocalDateTime createTime;
    private Integer isDelete;
}