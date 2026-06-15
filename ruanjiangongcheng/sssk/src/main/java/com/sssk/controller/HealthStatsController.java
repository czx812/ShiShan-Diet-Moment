package com.sssk.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sssk.entity.ClockRecord;
import com.sssk.entity.NutritionStats;
import com.sssk.service.ClockRecordService;
import com.sssk.service.NutritionStatsService;
import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/health")
public class HealthStatsController {
    private final ClockRecordService clockService;
    private final NutritionStatsService statsService;

    public HealthStatsController(ClockRecordService clockService, NutritionStatsService statsService) {
        this.clockService = clockService;
        this.statsService = statsService;
    }

    @GetMapping("/stats/{userId}")
    public Result<Map<String,Object>> getUserHealth(@PathVariable Integer userId){
        Map<String,Object> res = new HashMap<>();
        // 打卡总数
        long clockCount = clockService.count(
                new LambdaQueryWrapper<ClockRecord>()
                        .eq(ClockRecord::getUserId,userId)
                        .eq(ClockRecord::getIsDelete,0)
        );
        // 营养统计
        long statCount = statsService.count(
                new LambdaQueryWrapper<NutritionStats>()
                        .eq(NutritionStats::getUserId,userId)
                        .eq(NutritionStats::getIsDelete,0)
        );
        res.put("clockTotal",clockCount);
        res.put("nutriRecord",statCount);
        return Result.success(res);
    }
}