package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("announcement")
public class Announcement {
    @TableId
    private Integer annId;
    private String title;
    private String content;
    private Integer adminId;
    private Integer isTop;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}