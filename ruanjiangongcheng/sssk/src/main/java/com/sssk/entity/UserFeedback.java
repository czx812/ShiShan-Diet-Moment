package com.sssk.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class UserFeedback {
    private Integer feedbackId;
    private Integer userId;
    private String type;
    private String content;
    private String contact;
    private String status;
    private String reply;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}
