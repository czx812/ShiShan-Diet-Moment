package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@TableName("community_post")
public class CommunityPost {
    @TableId
    private Integer postId;
    private Integer userId;
    private String title;
    private String content;
    private Integer likeCount;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}