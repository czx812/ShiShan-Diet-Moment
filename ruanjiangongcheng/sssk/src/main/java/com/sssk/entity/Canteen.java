package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Canteen {
    @TableId
    private Integer canteenId;
    private String canteenName;
    private String location;
    private String businessHours;
    private String contactPhone;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
    private Integer isDelete;
}