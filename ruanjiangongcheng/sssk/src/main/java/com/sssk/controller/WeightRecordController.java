package com.sssk.controller;

import com.sssk.entity.UserWeightRecord;
import com.sssk.service.UserWeightRecordService;
import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.*;
import jakarta.annotation.Resource; // 这里也换成 jakarta
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/weight")
public class WeightRecordController {

    @Resource
    private UserWeightRecordService service;

    @PostMapping("/save")
    public Result<?> save(@RequestBody Map<String, Object> map) {
        Long userId = Long.valueOf(map.get("userId").toString());
        BigDecimal weight = new BigDecimal(map.get("weight").toString());
        service.save(userId, weight);
        return Result.success();
    }

    @GetMapping("/history")
    public Result<List<UserWeightRecord>> history(@RequestParam Long userId) {
        return Result.success(service.getHistory(userId));
    }
}