package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("user_weight_record")
public class UserWeightRecord {
    private Long id;
    private Long userId;
    private BigDecimal weight;
    private LocalDateTime recordDate;
}